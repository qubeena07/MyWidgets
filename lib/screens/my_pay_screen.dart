import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mypay_flutter/mypay_flutter.dart';

class MyPayScreen extends StatefulWidget {
  const MyPayScreen({super.key});

  @override
  State<MyPayScreen> createState() => _MyPayScreenState();
}

class _MyPayScreenState extends State<MyPayScreen> {
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Pay integration"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Example Using pay function mannaully - 2
            TextButton(
              onPressed: () async {
                MyPay.payment(
                  context,
                  config: MyPayConfig(
                    amount: 100,
                    environment: MyPayEnvironment.dev,
                    orderId: "hjhjkhjkhkhkssds",
                    merchantId: "MER79270453",
                    userName: "hamrohub",
                    password: "H0W29CMMRIK6BBT",
                  ),
                  apiKey:
                      "v+pLjx9Hhw0hR/sSS2bDQnMAbOhDkVWy8tz2FgcXnqT8QPCuRI2CRbCTUIzkCewY",
                  onFailure: (result) async {
                    message = result.remarks;
                    setState(() {});
                    if (kDebugMode) {
                      print("Transaction Failed");
                    }
                  },
                  onSuccess: (result) async {
                    message = result.remarks;
                    if (kDebugMode) {
                      print("Transaction Successful");
                    }
                  },
                  onCancel: (result) {
                    message = result.remarks;
                    if (kDebugMode) {
                      print("Transaction Cancelled");
                    }
                  },
                );
              },
              child: const Text('Pay with MyPay'),
            ),
            const SizedBox(
              height: 16,
            ),
            if (message.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Text('Console: Payment Info, Message: $message'),
              ),
          ],
        ),
      ),
    );
  }
}
