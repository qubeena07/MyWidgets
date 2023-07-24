import 'package:flutter/material.dart';
import 'package:my_widgets/main.dart';
import 'package:simple_internet_checker/simple_internet_checker.dart';

class InternetCheckerScreen extends StatefulWidget {
  const InternetCheckerScreen({super.key});

  @override
  State<InternetCheckerScreen> createState() => _InternetCheckerScreenState();
}

class _InternetCheckerScreenState extends State<InternetCheckerScreen> {
  internetUnAvailable() {
    messengerKey.currentState?.showSnackBar(const SnackBar(
      content: Text("No Internet Connection"),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 20),
    ));
  }

  internetAvailable() {
    messengerKey.currentState?.showSnackBar(const SnackBar(
      content: Text("Internet Connected"),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 20),
    ));
  }

  @override
  void initState() {
    useProvider(context).monitorConnection(
        internetAvailableCallback: internetAvailable,
        internetUnAvailableCallback: internetUnAvailable);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "Internet Checker",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final hasInternet = useProvider(context).isOnline;
          if (hasInternet) {
            useProvider(context).notify(() {
              messengerKey.currentState?.clearSnackBars();
            });
            // Navigator.pop(context);
          }
        },
        child: const Icon(Icons.wifi),
      ),
    );
  }
}
