import 'package:dynamic_background/domain/models/painter_data/lava_painter_data.dart';
import 'package:dynamic_background/widgets/views/dynamic_bg.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicBg(
      duration: const Duration(seconds: 35),
      painterData: LavaPainterData(
        width: 250.0,
        widthTolerance: 75.0,
        growAndShrink: true,
        growthRate: 10.0,
        growthRateTolerance: 5.0,
        blurLevel: 25.0,
        numBlobs: 5,
        backgroundColor: Color.fromRGBO(88, 81, 219, 1),
        colors: [
          Color.fromRGBO(88, 81, 219, 1),
          Color.fromRGBO(131, 58, 180, 1),
          Color.fromRGBO(193, 53, 132, 1),
          Color.fromRGBO(225, 48, 108, 1),
          Color.fromRGBO(253, 29, 29, 1),
          Color.fromRGBO(245, 96, 64, 1),
          Color.fromRGBO(247, 119, 55, 1),
          Color.fromRGBO(252, 175, 69, 1),
          Color.fromRGBO(255, 220, 128, 1),
        ],
        allSameColor: false,
        fadeBetweenColors: true,
        changeColorsTogether: false,
        speed: 20.0,
        speedTolerance: 5.0,
      ),
      child: Container(),
    );
  }
}
