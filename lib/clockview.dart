import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';



class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {


@override void initState() {

  Timer.periodic(Duration(seconds: 1),(timer){
    setState(() {

    });
  });

  super.initState();


}



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {


  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xFF444974);

    var OutlineBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;

    var CenterBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;




    var secondHandBrush = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    var minuteHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Colors.blue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 13;

    var hourHandBrush = Paint()
      ..color = Colors.deepOrange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, OutlineBrush);

    var SecHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 100);
    var SecHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 100);
    canvas.drawLine(center,Offset(SecHandX, SecHandY) , secondHandBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 100 * pi / 100);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 100 * pi / 100);
    canvas.drawLine(center,Offset(minHandX, minHandY) , minuteHandBrush);

    var hourHandX = centerX + 60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 100);
    var hourHandY = centerX + 60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 100);
    canvas.drawLine(center,Offset(hourHandX, hourHandY) , hourHandBrush);

    canvas.drawCircle(center, 7, CenterBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
