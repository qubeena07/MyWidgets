import 'dart:math';

import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //      CustomPaint(
          //   size: Size(
          //       200,
          //       (200 * 0.85)
          //           .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          //   painter: RPSCustomPainter(),
          // )

          CustomPaint(
        painter: PaintCircle(),
        child: Container(),
      ),
    );
  }
}

class PaintCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.brown
      ..strokeWidth = 5
      ..shader = const LinearGradient(colors: [Colors.red, Colors.yellow])
          .createShader(Offset(0, size.height) & size)
      ..style = PaintingStyle.fill;

    // ..strokeCap = StrokeCap.round;

    var height = size.height;
    var width = size.width;

    var p1 = const Offset(0, 0);
    // var p2 = const Offset(50, 100);
    var p2 = Offset(width, height);

    var center = Offset(width / 2, height / 2);
    double radius = 180.0;

    var rect = Rect.fromCenter(center: center, width: width, height: width);

    var path = Path();
    // path.moveTo(width/2, height/2); //kaha bata suru garne

    // canvas.drawLine(p1, p2, paint);
    // canvas.drawCircle(center, radius, paint);

    // Offset center = Offset(size.width / 2, size.height / 2);

    // canvas.drawCircle(center, 100, paint);

    // canvas.drawArc(rect, 0, (90 * pi) / 180, true, paint);

    // path.lineTo(0, height); // kaha samma draw garne
    // path.quadraticBezierTo(200, 200, width, 0);

    // path.moveTo(0, height);
    // path.quadraticBezierTo(width / 2, height / 2, width, height);

    // path.c

    canvas.drawCircle(center, radius, paint);
    var center3 = const Offset(200, 550);
    var mouthRect = Rect.fromCircle(center: center3, radius: radius - 70);

    canvas.drawArc(
        mouthRect,
        (210 * pi) / 180,
        (120 * pi) / 180,
        false,
        paint = Paint()
          ..color = Colors.white
          ..strokeWidth = 5
          ..style = PaintingStyle.stroke);
    double radius1 = 25.0;
    var center1 = const Offset(140, 350);

    canvas.drawCircle(
        center1,
        radius1,
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 5
          ..style = PaintingStyle.fill);
    double radius2 = 25.0;
    var center2 = const Offset(250, 350);

    canvas.drawCircle(
        center2,
        radius2,
        Paint()
          ..color = Colors.green
          ..strokeWidth = 5
          ..style = PaintingStyle.fill);

//

    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4529365, size.height * 0.8138824);
    path_0.lineTo(size.width * 0.9598150, size.height * 0.4671547);
    path_0.lineTo(size.width * 0.9050950, size.height * 0.4298841);
    path_0.lineTo(size.width * 0.4529335, size.height * 0.7393412);
    path_0.lineTo(size.width * 0.3770965, size.height * 0.6873882);
    path_0.lineTo(size.width * 0.09869650, size.height * 0.4987741);
    path_0.lineTo(size.width * 0.09869650, size.height * 0.4118076);
    path_0.lineTo(size.width * 0.4519765, size.height * 0.6523706);
    path_0.lineTo(size.width * 0.9588550, size.height * 0.3056429);
    path_0.lineTo(size.width * 0.5479750, size.height * 0.02554859);
    path_0.lineTo(size.width * 0.04013670, size.height * 0.3722782);
    path_0.lineTo(size.width * 0.04013670, size.height * 0.6952882);
    path_0.lineTo(size.width * 0.3473365, size.height * 0.9031000);
    path_0.lineTo(size.width * 0.4529400, size.height * 0.9742588);
    path_0.lineTo(size.width * 0.9598200, size.height * 0.6275294);
    path_0.lineTo(size.width * 0.9050950, size.height * 0.5902588);
    path_0.lineTo(size.width * 0.4529365, size.height * 0.9008471);
    path_0.lineTo(size.width * 0.3771000, size.height * 0.8488882);
    path_0.lineTo(size.width * 0.09870000, size.height * 0.6602765);
    path_0.lineTo(size.width * 0.09870000, size.height * 0.5733094);
    path_0.lineTo(size.width * 0.3483000, size.height * 0.7427235);
    path_0.lineTo(size.width * 0.4529365, size.height * 0.8138824);
    path_0.close();
    path_0.moveTo(size.width * 0.3982200, size.height * 0.3474371);
    path_0.cubicTo(
        size.width * 0.4135815,
        size.height * 0.3384006,
        size.width * 0.4279785,
        size.height * 0.3338865,
        size.width * 0.4404620,
        size.height * 0.3316259);
    path_0.cubicTo(
        size.width * 0.4577385,
        size.height * 0.3293647,
        size.width * 0.4817385,
        size.height * 0.3304988,
        size.width * 0.5134200,
        size.height * 0.3338865);
    path_0.cubicTo(
        size.width * 0.5287800,
        size.height * 0.3361476,
        size.width * 0.5441450,
        size.height * 0.3361476,
        size.width * 0.5585400,
        size.height * 0.3338865);
    path_0.cubicTo(
        size.width * 0.5729350,
        size.height * 0.3316259,
        size.width * 0.5854200,
        size.height * 0.3259771,
        size.width * 0.5969350,
        size.height * 0.3192018);
    path_0.cubicTo(
        size.width * 0.6084550,
        size.height * 0.3112924,
        size.width * 0.6151800,
        size.height * 0.3022641,
        size.width * 0.6161350,
        size.height * 0.2932276);
    path_0.cubicTo(
        size.width * 0.6170950,
        size.height * 0.2841912,
        size.width * 0.6113350,
        size.height * 0.2751553,
        size.width * 0.5998150,
        size.height * 0.2672529);
    path_0.cubicTo(
        size.width * 0.5902150,
        size.height * 0.2604776,
        size.width * 0.5796500,
        size.height * 0.2570900,
        size.width * 0.5671800,
        size.height * 0.2570900);
    path_0.cubicTo(
        size.width * 0.5594950,
        size.height * 0.2570900,
        size.width * 0.5518150,
        size.height * 0.2582165,
        size.width * 0.5441350,
        size.height * 0.2604776);
    path_0.cubicTo(
        size.width * 0.5354950,
        size.height * 0.2638653,
        size.width * 0.5239700,
        size.height * 0.2627388,
        size.width * 0.5163000,
        size.height * 0.2570900);
    path_0.lineTo(size.width * 0.4711795, size.height * 0.2265941);
    path_0.cubicTo(
        size.width * 0.4654205,
        size.height * 0.2220800,
        size.width * 0.4654205,
        size.height * 0.2164312,
        size.width * 0.4721370,
        size.height * 0.2130435);
    path_0.cubicTo(
        size.width * 0.4980585,
        size.height * 0.1972324,
        size.width * 0.5258950,
        size.height * 0.1915824,
        size.width * 0.5566200,
        size.height * 0.1938447);
    path_0.cubicTo(
        size.width * 0.5911800,
        size.height * 0.1972324,
        size.width * 0.6238150,
        size.height * 0.2096559,
        size.width * 0.6555000,
        size.height * 0.2311153);
    path_0.cubicTo(
        size.width * 0.6891000,
        size.height * 0.2537012,
        size.width * 0.7073350,
        size.height * 0.2785506,
        size.width * 0.7102200,
        size.height * 0.3033976);
    path_0.cubicTo(
        size.width * 0.7131000,
        size.height * 0.3282447,
        size.width * 0.6996600,
        size.height * 0.3508329,
        size.width * 0.6708600,
        size.height * 0.3700306);
    path_0.cubicTo(
        size.width * 0.6535850,
        size.height * 0.3824547,
        size.width * 0.6315000,
        size.height * 0.3892294,
        size.width * 0.6055850,
        size.height * 0.3926171);
    path_0.cubicTo(
        size.width * 0.5796600,
        size.height * 0.3960047,
        size.width * 0.5547050,
        size.height * 0.3948782,
        size.width * 0.5297450,
        size.height * 0.3892294);
    path_0.cubicTo(
        size.width * 0.5143850,
        size.height * 0.3869682,
        size.width * 0.5019100,
        size.height * 0.3869682,
        size.width * 0.4923070,
        size.height * 0.3903559);
    path_0.cubicTo(
        size.width * 0.4855840,
        size.height * 0.3926171,
        size.width * 0.4779100,
        size.height * 0.3948700,
        size.width * 0.4702290,
        size.height * 0.3993924);
    path_0.cubicTo(
        size.width * 0.4644700,
        size.height * 0.4027800,
        size.width * 0.4548675,
        size.height * 0.4027800,
        size.width * 0.4491090,
        size.height * 0.3982653);
    path_0.lineTo(size.width * 0.3991870, size.height * 0.3643812);
    path_0.cubicTo(
        size.width * 0.3914995,
        size.height * 0.3587324,
        size.width * 0.3914995,
        size.height * 0.3519494,
        size.width * 0.3982230,
        size.height * 0.3474353);
    path_0.lineTo(size.width * 0.3982200, size.height * 0.3474371);
    path_0.close();
    path_0.moveTo(size.width * 0.3137385, size.height * 0.4061682);
    path_0.lineTo(size.width * 0.3396600, size.height * 0.3880959);
    path_0.cubicTo(
        size.width * 0.3482985,
        size.height * 0.3824476,
        size.width * 0.3627020,
        size.height * 0.3824476,
        size.width * 0.3713400,
        size.height * 0.3880959);
    path_0.lineTo(size.width * 0.4116600, size.height * 0.4152041);
    path_0.cubicTo(
        size.width * 0.4202985,
        size.height * 0.4208524,
        size.width * 0.4202985,
        size.height * 0.4310153,
        size.width * 0.4116600,
        size.height * 0.4366647);
    path_0.lineTo(size.width * 0.3857385, size.height * 0.4547371);
    path_0.cubicTo(
        size.width * 0.3771000,
        size.height * 0.4603859,
        size.width * 0.3626965,
        size.height * 0.4603859,
        size.width * 0.3540585,
        size.height * 0.4547371);
    path_0.lineTo(size.width * 0.3137385, size.height * 0.4276294);
    path_0.cubicTo(
        size.width * 0.3051000,
        size.height * 0.4208465,
        size.width * 0.3051000,
        size.height * 0.4118182,
        size.width * 0.3137385,
        size.height * 0.4061682);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff636366).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
