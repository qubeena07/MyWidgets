import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarcodeGeneratorScreen extends StatefulWidget {
  const BarcodeGeneratorScreen({super.key});

  @override
  State<BarcodeGeneratorScreen> createState() => _BarcodeGeneratorScreenState();
}

class _BarcodeGeneratorScreenState extends State<BarcodeGeneratorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate Barcode"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BarcodeWidget(
                // errorBuilder: (context, error) => Center(child: Text(error)),
                data: "122956789012asbo8",
                barcode: Barcode.code128()),
            const SizedBox(
              height: 20,
            ),
            BarcodeWidget(data: "HelloNotDIpika", barcode: Barcode.qrCode())
          ],
        ),
      ),
    );
  }
}
