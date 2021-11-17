import 'package:flutter/material.dart';
import 'package:shortly_challenge/screens/components/bottom_form.dart';
import 'package:shortly_challenge/screens/components/fresh_background.dart';
import 'package:shortly_challenge/screens/components/history_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const <Widget>[
            Expanded(
              child: FreshBackground(),
            ),
            //HistoryCard(),
            BottomForm(),
          ],
        ),
      ),
    );
  }
}
