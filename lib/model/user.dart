// import 'package:shimmer_effect/components/utils.dart';

// class UserField {
//   static const String lastMessageTime = 'lastMessageTime';
// }

// class User {
//   final String? idUser;
//   final String? name;
//   final String? urlAvatar;
//   final DateTime? lastMessageTime;

//   const User({
//     this.idUser,
//     this.name,
//     this.urlAvatar,
//     this.lastMessageTime,
//   });

//   User copyWith({
//     required String idUser,
//     required String name,
//     required String urlAvatar,
//     required DateTime lastMessageTime,
//   }) =>
//       User(
//         idUser: idUser ?? this.idUser,
//         name: name ?? this.name,
//         urlAvatar: urlAvatar ?? this.urlAvatar,
//         lastMessageTime: lastMessageTime ?? this.lastMessageTime,
//       );

//   static User fromJson(Map<String, dynamic> json) => User(
//         idUser: json['idUser'],
//         name: json['name'],
//         urlAvatar: json['urlAvatar'],
//         lastMessageTime: Utils.toDateTime(json['lastMessageTime']),
//       );

//   Map<String, dynamic> toJson() => {
//         'idUser': idUser,
//         'name': name,
//         'urlAvatar': urlAvatar,
//         'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime!),
//       };
// }
