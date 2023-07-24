import 'package:flutter/material.dart';
import 'package:my_widgets/screens/pdf/pdf_preview_page.dart';

import '../../model/invoice_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.invoice});
  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.picture_as_pdf),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PdfPreviewPage(invoice: invoice)));
        },
      ),
      appBar: AppBar(
        title: Text(
          invoice.name,
          style: const TextStyle(fontSize: 15),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    "Customer",
                    style: Theme.of(context).textTheme.headlineMedium,
                  )),
                  Expanded(
                      child: Text(
                    invoice.customer,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Column(
                children: [
                  Text(
                    "Invoice items",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  ...invoice.items.map((e) => ListTile(
                        title: Text(e.description),
                        trailing: Text(e.cost.toStringAsFixed(2)),
                      )),
                  DefaultTextStyle.merge(
                      style: Theme.of(context).textTheme.headlineSmall,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("Total"),
                          Text(invoice.totalCost().toStringAsFixed(2))
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
