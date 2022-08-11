import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 590,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderHomePainert(),
      ),
    );
  }
}

class _HeaderHomePainert extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // paint.color = const Color(0xff373851);
    paint.color = const Color(0xff144570);

    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.62,
        size.width * 0.6, size.height * 0.45);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.35, size.width, size.height * 0.39);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderHomeNaranja extends StatelessWidget {
  const HeaderHomeNaranja({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPainterNaranja(),
      ),
    );
  }
}

class _HeaderPainterNaranja extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // paint.color = const Color(0xffED6948);
    paint.color = const Color(0xff84828F);

    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();
    path.moveTo(size.width * 0.7, 0);
    path.quadraticBezierTo(
        size.width * 0.7, size.height * 1.0, size.width, size.height * 1.0);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderHomeMorado extends StatelessWidget {
  const HeaderHomeMorado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPainterMorado(),
      ),
    );
  }
}

class _HeaderPainterMorado extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // paint.color = const Color(0xff6C4DDC);
    paint.color = const Color(0xffF4B909);

    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();
    path.moveTo(size.width * 0.3, 0);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.8,
        size.width * 0.6, size.height * 0.7);
    path.quadraticBezierTo(
        size.width * 0.9, size.height * 0.6, size.width, size.height * 1);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
