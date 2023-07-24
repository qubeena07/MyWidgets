import 'package:flutter/material.dart';

class ListViewAnimationScreen extends StatefulWidget {
  const ListViewAnimationScreen({super.key});

  @override
  State<ListViewAnimationScreen> createState() =>
      _ListViewAnimationScreenState();
}

class _ListViewAnimationScreenState extends State<ListViewAnimationScreen> {
  List<String> textList = [
    "One",
    "Not DIpika",
    "three",
    "two",
    "five",
    "severn",
    "sda",
    "ada",
    "adsas",
    "21e",
    "13d",
    "13edcf",
    "qwdasd",
    "weqw2edc",
    "asd3ed",
    "23rdxz",
    "asda23erfc",
    "1asd",
    "12eds",
    "wdvdsa",
    "asxc",
    "sdd",
    "sdsc"
  ];

  bool startAnimation = false;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   setState(() {
    //     startAnimation = true;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    startAnimation = true;
                  });
                },
                child: const Text(
                  "Animation List",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              const Text(
                "Click on animation list to display list in animation",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              ListView.builder(
                  primary: false,
                  itemCount: textList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return containerItem(index);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget containerItem(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300 + (index * 100)),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(bottom: 20),
      height: 55,
      width: double.infinity,
      transform: Matrix4.translationValues(
          startAnimation ? 0 : MediaQuery.of(context).size.width, 0, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              "${index + 1}.${textList[index]}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
