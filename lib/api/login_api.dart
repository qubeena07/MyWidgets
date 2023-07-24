import 'package:google_sign_in/google_sign_in.dart';

class LoginApi {
  final GlobalClass vvv = GlobalClass();

  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future signOut = _googleSignIn.signOut();
  functionn() {
    vvv.fuun();
    vvv.googleSignIn.clientId.toString();
  }
  //   static final GlobalClass _singleton = GlobalClass._internal();

//   factory GlobalClass(){
//     return _singleton;
//   }
//   GlobalClass._internal();
}

class GlobalClass {
  late final GoogleSignIn googleSignIn;
  static final _singleton = GlobalClass._();

  factory GlobalClass() {
    return _singleton;
  }
  GlobalClass._() {
    googleSignIn = GoogleSignIn();
  }

  fuun() {
    return 'l';
  }
}
