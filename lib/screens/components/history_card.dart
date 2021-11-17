import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({Key? key, this.originalLink = "", this.shortenedLink = ""})
      : super(key: key);

  final String originalLink, shortenedLink;

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  String buttonText = "COPY";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(widget.originalLink),
            ],
          ),
          Text(widget.shortenedLink),
          ElevatedButton(
            onPressed: () {
              setState(() {
                Clipboard.setData(ClipboardData(text: widget.shortenedLink));
                buttonText = "COPIED!";
              });
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
