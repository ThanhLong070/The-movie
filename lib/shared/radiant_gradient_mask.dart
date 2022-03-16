import 'package:flutter/material.dart';

class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const RadialGradient(
        colors: <Color>[
          Color.fromARGB(255, 192, 254, 207),
          Color.fromARGB(255, 30, 213, 169),
        ],
      ).createShader(bounds),
      child: child,
    );
  }
}
