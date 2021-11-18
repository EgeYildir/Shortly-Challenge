import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({Key? key, this.originalUrl = "", this.shortenedUrl = ""})
      : super(key: key);

  final String originalUrl, shortenedUrl;

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  String buttonText = "COPY";

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  widget.originalUrl,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFF35323E),
                  ),
                ),
                Align(
                  //Align not working as intended!
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/images/del.svg')),
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            Row(
              children: <Widget>[
                Text(
                  widget.shortenedUrl,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFF35323E),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Clipboard.setData(
                            ClipboardData(text: widget.shortenedUrl));
                        buttonText = "COPIED!";
                      });
                    },
                    child: Text(buttonText,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
