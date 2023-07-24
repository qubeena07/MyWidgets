class CallMeSingleton {
  static CallMeSingleton? _callMeSingleton;
  CallMeSingleton._();

  static Future<CallMeSingleton> instance() async {
    _callMeSingleton ??= CallMeSingleton._();
    return _callMeSingleton!;
  }
}


// void main() {
//   GlobalClass a = GlobalClass();
//   GlobalClass b = GlobalClass();
//   if(a==b){
//     print("true");
//   }else{
//     print("false");
//   }

 
// }
// class GlobalClass{
//   static final GlobalClass _singleton = GlobalClass._internal();
  
//   factory GlobalClass(){
//     return _singleton;
//   }
//   GlobalClass._internal();
  
// }
