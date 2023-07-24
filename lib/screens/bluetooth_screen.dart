import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_widgets/screens/print_screen.dart';

class BluetoothScreen extends StatelessWidget {
  // const BluetoothScreen({super.key});
  final List<Map<String, dynamic>> data = [
    {"title": "Mobile Phone", "price": 100, "qty": 2},
    {"title": "IPhone", "price": 1200, "qty": 3},
    {"title": "Laptop", "price": 900, "qty": 5},
    {"title": "Oven", "price": 600, "qty": 2},
    {"title": "Gas", "price": 800, "qty": 9},
  ];

  BluetoothScreen({super.key});
  final f = NumberFormat('\$###,###.00', 'en_US');

  @override
  Widget build(BuildContext context) {
    int total = 0;
    total = data
        .map((e) => e['price'] * e['qty'])
        .reduce((value, element) => value + element);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bluetooth Printer"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (c, i) {
                    return ListTile(
                      title: Text(
                        data[i]['title'].toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          "${f.format(data[i]['price'])} x ${data[i]['qty']}"),
                      trailing:
                          Text(f.format(data[i]['price'] * data[i]['qty'])),
                    );
                  })),
          Container(
            color: const Color.fromARGB(255, 213, 213, 213),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  "Total : ${f.format(total)}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 80,
                ),
                Expanded(
                    child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PrintPage(data)));
                  },
                  icon: const Icon(Icons.print),
                  label: const Text("Print"),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
