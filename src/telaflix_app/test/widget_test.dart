import 'package:flutter_test/flutter_test.dart';

import 'package:telaflix_app/src/app/app.dart';

void main() {
  testWidgets('displays Telaflix.TV app name', (WidgetTester tester) async {
    await tester.pumpWidget(const TelaflixApp());

    expect(find.text('Telaflix.TV'), findsWidgets);
  });
}
