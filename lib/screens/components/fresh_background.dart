import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FreshBackground extends StatelessWidget {
  const FreshBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      padding: const EdgeInsets.only(top: 20),
      color: const Color(0xFFEFF1F7),
      width: 100,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 35, bottom: 20),
            child: const Text(
              "Shortly",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF35323E),
              ),
            ),
          ),
          SvgPicture.asset(
            "assets/images/illustration.svg",
          ),
          const Text(
            "Let's get started!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF35323E),
            ),
          ),
          const Text(
            "Paste your first link into \n the field to shorten it",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF35323E),
            ),
          ),
        ],
      ),
    );
  }
}
