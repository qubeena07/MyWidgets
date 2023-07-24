import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrintPage extends StatefulWidget {
  PrintPage(this.data, {super.key});
  List<Map<String, dynamic>> data;

  @override
  State<PrintPage> createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> _devices = [];
  String _devicesMsg = '';
  final f = NumberFormat('\$###,###.00', 'en_US');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {initPrinter()});
  }

  Future<void> initPrinter() async {
    bluetoothPrint.startScan(timeout: const Duration(seconds: 2));
    if (!mounted) return;
    bluetoothPrint.scanResults.listen((val) {
      if (!mounted) return;
      setState(() {
        _devices = val;
      });
      if (_devices.isEmpty) {
        setState(() {
          _devicesMsg = "No Devices";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Printer"),
        backgroundColor: Colors.redAccent,
      ),
      body: _devices.isEmpty
          ? Center(
              child: Text(_devicesMsg.toString()),
            )
          : ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (c, i) {
                return ListTile(
                  title: Text(_devices[i].name ?? "N/A"),
                  leading: const Icon(Icons.print),
                  subtitle: Text(_devices[i].address ?? "N/A"),
                  onTap: () {
                    _startPrint(_devices[i]);
                  },
                );
              }),
    );
  }

  Future<void> _startPrint(BluetoothDevice device) async {
    if (device.address != null) {
      await bluetoothPrint.connect(device);

      Map<String, dynamic> config = {};
      List<LineText> list = [];
      list.add(LineText(
          type: LineText.TYPE_TEXT,
          content: "Grocery App",
          weight: 2,
          width: 2,
          height: 2,
          align: LineText.ALIGN_CENTER,
          linefeed: 1));

      for (var i = 0; i < widget.data.length; i++) {
        list.add(
          LineText(
              type: LineText.TYPE_TEXT,
              content: widget.data[i]['title'],
              weight: 0,
              align: LineText.ALIGN_LEFT,
              linefeed: 1),
        );
        list.add(
          LineText(
              type: LineText.TYPE_TEXT,
              content:
                  "${f.format(widget.data[i]['price'])} x ${widget.data[i]['qty']}",
              align: LineText.ALIGN_LEFT,
              linefeed: 1),
        );
      }
    }
  }
}
