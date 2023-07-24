import 'package:flutter/material.dart';

class LazyLoadingScreen extends StatefulWidget {
  const LazyLoadingScreen({super.key});

  @override
  State<LazyLoadingScreen> createState() => _LazyLoadingScreenState();
}

class _LazyLoadingScreenState extends State<LazyLoadingScreen> {
  List<String> items = List.generate(100, (index) => "Hello $index");
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
          child: ListView.builder(
              itemCount: items.length,
              controller: controller,
              itemBuilder: (context, index) {
                return Text(items[index]);
              })),
    );
  }

  void _scrollListener() {
    if (controller.position.extentAfter < 500) {
      const CircularProgressIndicator();
      setState(() {
        items.addAll(List.generate(42, (index) => "Inserted $index"));
      });
    }
  }
}
