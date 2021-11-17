import 'package:flutter/material.dart';

String buttonText = "COPY";

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key, this.originalLink = "", this.shortenedLink = ""})
      : super(key: key);

  final String originalLink, shortenedLink;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(originalLink),
            ],
          ),
          Text(shortenedLink),
          ElevatedButton(
            onPressed: () {
              buttonText = "COPIED!";
            },
            child: Text(buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }
}
