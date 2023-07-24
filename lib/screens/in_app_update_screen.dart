import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';

class InAppUpdateScreen extends StatefulWidget {
  const InAppUpdateScreen({super.key});

  @override
  State<InAppUpdateScreen> createState() => _InAppUpdateScreenState();
}

class _InAppUpdateScreenState extends State<InAppUpdateScreen> {
  AppUpdateInfo? _updateInfo;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool _flexibleUpdateAvailable = false;

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) {});
  }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("In app Update example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Center(
              child: Text('Update info: $_updateInfo'),
            ),
            ElevatedButton(
              child: const Text('Check for Update'),
              onPressed: () => checkForUpdate(),
            ),
            ElevatedButton(
              onPressed: _updateInfo?.updateAvailability ==
                      UpdateAvailability.updateAvailable
                  ? () {
                      InAppUpdate.performImmediateUpdate()
                          .catchError((e) => showSnack(e.toString()));
                    }
                  : null,
              child: const Text('Perform immediate update'),
            ),
            ElevatedButton(
              onPressed: _updateInfo?.updateAvailability ==
                      UpdateAvailability.updateAvailable
                  ? () {
                      InAppUpdate.startFlexibleUpdate().then((_) {
                        setState(() {
                          _flexibleUpdateAvailable = true;
                        });
                      }).catchError((e) {
                        showSnack(e.toString());
                      });
                    }
                  : null,
              child: const Text('Start flexible update'),
            ),
            ElevatedButton(
              onPressed: !_flexibleUpdateAvailable
                  ? null
                  : () {
                      InAppUpdate.completeFlexibleUpdate().then((_) {
                        showSnack("Success!");
                      }).catchError((e) {
                        showSnack(e.toString());
                      });
                    },
              child: const Text('Complete flexible update'),
            )
          ],
        ),
      ),
    );
  }
}
