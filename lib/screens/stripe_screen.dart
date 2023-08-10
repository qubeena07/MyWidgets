import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeScreen extends StatefulWidget {
  const StripeScreen({super.key});

  @override
  State<StripeScreen> createState() => _StripeScreenState();
}

class _StripeScreenState extends State<StripeScreen> {
  Map<String, dynamic>? paymentIntent;

  createPaymentIntent() async {
    try {
      Map<String, dynamic> body = {"amount": "1000", "currency": "USD"};
      http.Response response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            "Authorization": "Bearer your_key",
            "Content-Type": "application/x-www-form-urlencoded",
          });
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      print("Done");
    } catch (e) {
      print("failed");
    }
  }

  void makePayment() async {
    try {
      paymentIntent = await createPaymentIntent();
      var gpay = const PaymentSheetGooglePay(
          merchantCountryCode: "US", currencyCode: "USD", testEnv: true);
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!["client_secret"],
              style: ThemeMode.dark,
              merchantDisplayName: "Dipika",
              googlePay: gpay));
      displayPaymentSheet();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              makePayment();
              print("presses");
            },
            child: const Text("Pay with stripe")),
      ),
    );
  }
}
