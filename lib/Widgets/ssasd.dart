import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(size.width*0.4050633,size.height*0.02520384);
    path_0.cubicTo(size.width*0.4638101,size.height*-0.005953047,size.width*0.5361899,size.height*-0.005953058,size.width*0.5949367,size.height*0.02520384);
    path_0.lineTo(size.width*0.8983684,size.height*0.1861314);
    path_0.cubicTo(size.width*0.9571165,size.height*0.2172884,size.width*0.9933051,size.height*0.2748686,size.width*0.9933051,size.height*0.3371826);
    path_0.lineTo(size.width*0.9933051,size.height*0.6590360);
    path_0.cubicTo(size.width*0.9933051,size.height*0.7213500,size.width*0.9571165,size.height*0.7789302,size.width*0.8983684,size.height*0.8100872);
    path_0.lineTo(size.width*0.5949367,size.height*0.9710151);
    path_0.cubicTo(size.width*0.5361899,size.height*1.002172,size.width*0.4638101,size.height*1.002172,size.width*0.4050633,size.height*0.9710151);
    path_0.lineTo(size.width*0.1016311,size.height*0.8100872);
    path_0.cubicTo(size.width*0.04288405,size.height*0.7789302,size.width*0.006694405,size.height*0.7213500,size.width*0.006694405,size.height*0.6590372);
    path_0.lineTo(size.width*0.006694405,size.height*0.3371826);
    path_0.cubicTo(size.width*0.006694405,size.height*0.2748686,size.width*0.04288405,size.height*0.2172884,size.width*0.1016311,size.height*0.1861314);
    path_0.lineTo(size.width*0.4050633,size.height*0.02520384);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.shader = ui.Gradient.linear(Offset(size.width*0.4936709,size.height*-16.46814), Offset(size.width*0.5000000,size.height*2.160895), [Color(0xff6210E1).withOpacity(1),Color(0xff1400AE).withOpacity(1)], [0.223536,0.555821]);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}