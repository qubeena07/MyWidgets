import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherScreen extends StatefulWidget {
  const UrlLauncherScreen({super.key});

  @override
  State<UrlLauncherScreen> createState() => _UrlLauncherScreenState();
}

class _UrlLauncherScreenState extends State<UrlLauncherScreen> {
  List<String> attachments = [];

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.orange,
          const Color.fromARGB(255, 213, 90, 81).withOpacity(1),
          Colors.deepOrangeAccent.withOpacity(0.5)
        ], begin: Alignment.topRight, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'ranabhatdipika7@gmail.com',
                    query: encodeQueryParameters(<String, String>{
                      'subject': 'Example Subject & Symbols are allowed!',
                      'body': 'hello',
                      'attachments': attachments.toString()
                    }),
                  );

                  await launchUrl(emailLaunchUri);
                },
                child: const Center(
                  child: SizedBox(
                      width: 400, height: 200, child: Text("Send mail")),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  for (var i = 0; i < attachments.length; i++)
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            attachments[i],
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () => {_removeAttachment(i)},
                        )
                      ],
                    ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.attach_file),
                      onPressed: _openImagePicker,
                    ),
                  ),
                  TextButton(
                      child:
                          const Text('Attach file in app documents directory'),
                      onPressed: () {
                        _openImagePicker();
                      }
                      // => _attachFileFromAppDocumentsDirectoy(),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openImagePicker() async {
    final picker = ImagePicker();
    XFile? pick = await picker.pickImage(source: ImageSource.gallery);
    //  getImage(source: );
    if (pick != null) {
      setState(() {
        attachments.add(pick.path);
      });
    }
  }

  void _removeAttachment(int index) {
    setState(() {
      attachments.removeAt(index);
    });
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
// import 'package:image_picker/image_picker.dart';

// class EmailSender extends StatefulWidget {
//   const EmailSender({Key? key}) : super(key: key);

//   @override
//   _EmailSenderState createState() => _EmailSenderState();
// }

// class _EmailSenderState extends State<EmailSender> {
//   List<String> attachments = [];
//   bool isHTML = false;

//   final _recipientController = TextEditingController(
//     text: 'qubeena7@gmail.com',
//   );

//   final _subjectController = TextEditingController(text: 'The subject');

//   final _bodyController = TextEditingController(
//     text: 'Mail body.',
//   );

//   Future<void> send() async {
//     final Email email = Email(
//       body: _bodyController.text,
//       subject: _subjectController.text,
//       recipients: [_recipientController.text],
//       attachmentPaths: attachments,
//       isHTML: isHTML,
//     );

//     String platformResponse;

//     try {
//       await FlutterEmailSender.send(email);
//       platformResponse = 'success';
//     } catch (error) {
//       print(error);
//       platformResponse = error.toString();
//     }

//     if (!mounted) return;

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(platformResponse),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Plugin example app'),
//         actions: <Widget>[
//           IconButton(
//             onPressed: send,
//             icon: const Icon(Icons.send),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _recipientController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Recipient',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _subjectController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Subject',
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: _bodyController,
//                   maxLines: null,
//                   expands: true,
//                   textAlignVertical: TextAlignVertical.top,
//                   decoration: const InputDecoration(
//                       labelText: 'Body', border: OutlineInputBorder()),
//                 ),
//               ),
//             ),
//             CheckboxListTile(
//               contentPadding:
//                   const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
//               title: const Text('HTML'),
//               onChanged: (bool? value) {
//                 if (value != null) {
//                   setState(() {
//                     isHTML = value;
//                   });
//                 }
//               },
//               value: isHTML,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: <Widget>[
//                   for (var i = 0; i < attachments.length; i++)
//                     Row(
//                       children: <Widget>[
//                         Expanded(
//                           child: Text(
//                             attachments[i],
//                             softWrap: false,
//                             overflow: TextOverflow.fade,
//                           ),
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.remove_circle),
//                           onPressed: () => {_removeAttachment(i)},
//                         )
//                       ],
//                     ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: IconButton(
//                       icon: const Icon(Icons.attach_file),
//                       onPressed: _openImagePicker,
//                     ),
//                   ),
//                   TextButton(
//                       child:
//                           const Text('Attach file in app documents directory'),
//                       onPressed: () {
//                         _openImagePicker();
//                       }
//                       // => _attachFileFromAppDocumentsDirectoy(),
//                       ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _openImagePicker() async {
//     final picker = ImagePicker();
//     PickedFile? pick = await picker.getImage(source: ImageSource.gallery);
//     if (pick != null) {
//       setState(() {
//         attachments.add(pick.path);
//       });
//     }
//   }

//   void _removeAttachment(int index) {
//     setState(() {
//       attachments.removeAt(index);
//     });
//   }

//   // Future<void> _attachFileFromAppDocumentsDirectoy() async {
//   //   try {
//   //     final appDocumentDir = await getApplicationDocumentsDirectory();
//   //     final filePath = appDocumentDir.path + '/file.txt';
//   //     final file = File(filePath);
//   //     await file.writeAsString('Text file in app directory');

//   //     setState(() {
//   //       attachments.add(filePath);
//   //     });
//   //   } catch (e) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(
//   //         content: Text('Failed to create file in applicion directory'),
//   //       ),
//   //     );
//   //   }
//   // }
// }
