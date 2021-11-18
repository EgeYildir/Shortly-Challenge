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

  //Define form key.
  final formKey = GlobalKey<FormState>();

  //Define field states.
  String fieldMessage = 'Shorten a link here ...';
  Color messageColor = Colors.grey;

  Future<http.Response> fetchURL(link) async {
    final response = await http.get(Uri.parse(
        "https://api.shrtco.de/v2/shorten?url=$link")); //Api address is hardcoded!
    Map<String, dynamic> body = jsonDecode(response.body);
    if (body['ok']) {
      var data = body['result'];
      setState(() {
        history.insert(
            0,
            HistoryCard(
              originalUrl: data['original_link'],
              shortenedUrl: data['full_short_link'],
            ));
      });
      return response;
    } else {
      throw Exception("Failed to retrieve link");
    }
  }

  TextEditingController urlController =
      TextEditingController(); //Define a controller for form field.

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
                              child: SvgPicture.asset(
                                "assets/images/logo.svg",
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
                  : Container(
                      margin: const EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: history.length,
                        itemBuilder: (BuildContext context, int index) {
                          return history[index];
                        },
                      ),
                    ),
            ),
            Container(
              color: const Color(0xFF3B3054),
              padding: const EdgeInsets.all(30),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: urlController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: fieldMessage,
                        hintStyle: TextStyle(color: messageColor),
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: const TextStyle(height: 0),
                      ),
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            fieldMessage = "Please add a link here";
                            messageColor =
                                Colors.red; //Warn user when no url is provided.
                          });
                          return "";
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                //Validate the form field.
                                fetchURL(urlController
                                    .text); //Call fetch url with the given input.
                              }
                            },
                            child: const Text(
                              "SHORTEN IT!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF2ACFCF)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
