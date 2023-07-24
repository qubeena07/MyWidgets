import 'package:intl/intl.dart';

class GetGreeting {
  String getGreeting() {
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));
    var message = '';
    if (timeNow <= 11) {
      message = 'Good Morning  👋';
    } else if ((timeNow >= 12) && (timeNow < 16)) {
      message = 'Good Afernoon  👋';
    } else {
      message = 'Good Evening  👋';
    }
    // } else {
    //   message = 'Good Night My Dear';
    // }
    return message;
  }
}
