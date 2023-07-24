// import 'package:flutter/material.dart';

// class LoggedPage extends StatelessWidget {
//   // final GoogleSignInAccount? user;
//   final String? user;

//   const LoggedPage({
//     super.key,
//     this.user,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 40,
//             backgroundImage: NetworkImage(user!.photoUrl!),
//           ),
//           Text(
//             "Name:${user!.displayName} ",
//             style: const TextStyle(fontSize: 20, color: Colors.black),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Text(
//             "Email: ${user!.email} ",
//             style: const TextStyle(fontSize: 20, color: Colors.black),
//           ),
//         ],
//       ),
//     );
//   }
// }
