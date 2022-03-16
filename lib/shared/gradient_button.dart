import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'radiant_gradient_mask.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({required this.titleButton});
  final String titleButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: Row(
        children: <Widget>[
          GradientText(
            titleButton,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            colors: const <Color>[
              Color.fromARGB(255, 192, 254, 207),
              Color.fromARGB(255, 30, 213, 169),
            ],
          ),
          const RadiantGradientMask(
            child: Icon(
              Icons.expand_more,
              color: Colors.white,
            ),
          ),
        ],
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(3, 37, 65, 1)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(120.0, 40.0)),
      ),
    );
  }
}
