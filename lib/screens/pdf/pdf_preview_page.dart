import 'package:flutter/material.dart';
import 'package:my_widgets/screens/pdf/pdfExport.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import '../../model/invoice_model.dart';

class PdfPreviewPage extends StatelessWidget {
  const PdfPreviewPage({super.key, required this.invoice});
  final Invoice invoice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PDF Preview"),
        ),
        body: PdfPreview(
          pageFormats: const <String, PdfPageFormat>{
            'one': PdfPageFormat(100, 300),
            'two': PdfPageFormat(300, 700),
          },
          build: (context) => makePdf(invoice),
        ));
  }
}
