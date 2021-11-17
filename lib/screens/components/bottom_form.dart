import 'package:flutter/material.dart';

class BottomForm extends StatelessWidget {
  const BottomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF3B3054),
      padding: const EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Shorten a link here ...',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "SHORTEN IT!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFF2ACFCF)),
            ),
          ),
        ],
      ),
    );
  }
}
