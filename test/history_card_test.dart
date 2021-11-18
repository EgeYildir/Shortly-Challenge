import 'package:flutter_test/flutter_test.dart';
import 'package:shortly_challenge/screens/components/history_card.dart';

void main() {
  testWidgets('History Card has an original and a shortened url',
      (WidgetTester tester) async {
    await tester.pumpWidget(const HistoryCard(
        originalUrl: 'http://www.youtube.com',
        shortenedUrl: 'https://shrtco.de/dZwxfk'));

    final originalFinder = find.text('http://www.youtube.com');
    final shortenedFinder = find.text('https://shrtco.de/dZwxfk');

    expect(originalFinder, findsOneWidget);
    expect(shortenedFinder, findsOneWidget);
  });
}
