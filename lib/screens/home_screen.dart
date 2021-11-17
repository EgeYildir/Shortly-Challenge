import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shortly_challenge/screens/components/history_card.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final history = [];
  String fullUrl = "";
  String shortenedUrl = "";

  Future<http.Response> fetchURL(link) async {
    final response =
        await http.get(Uri.parse("https://api.shrtco.de/v2/shorten?url=$link"));
    if (response.statusCode == 201) {
      Map<String, dynamic> body = jsonDecode(response.body);
      var data = body['result'];
      setState(() {
        history.insert(
            0,
            HistoryCard(
              originalLink: data['original_link'],
              shortenedLink: data['short_link'],
            ));
      });
      return response;
    } else {
      throw Exception("Failed to retrieve link");
    }
  }

  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: history.isEmpty
                  ? Container(
                      constraints: const BoxConstraints.expand(),
                      padding: const EdgeInsets.only(top: 20),
                      color: const Color(0xFFEFF1F7),
                      width: 100,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 35, bottom: 20),
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
                      ),
                    )
                  : ListView.builder(
                      itemCount: history.length,
                      itemBuilder: (BuildContext context, int index) {
                        return history[index];
                      },
                    ),
            ),
            Container(
              color: const Color(0xFF3B3054),
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: urlController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Shorten a link here ...',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      fetchURL(urlController.text);
                    },
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
            ),
          ],
        ),
      ),
    );
  }
}
