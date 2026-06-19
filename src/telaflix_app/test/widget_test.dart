import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:telaflix_app/src/app/app.dart';

void main() {
  testWidgets('shows splash screen before navigating home', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TelaflixApp());

    expect(find.byKey(const Key('splash-logo')), findsOneWidget);
    expect(find.byKey(const Key('splash-loader')), findsOneWidget);
    expect(find.text('Telaflix.TV'), findsNothing);

    await tester.pump(const Duration(seconds: 2));

    expect(find.byKey(const Key('splash-logo')), findsOneWidget);
    expect(find.byKey(const Key('splash-loader')), findsOneWidget);
    expect(find.text('Telaflix.TV'), findsNothing);

    await tester.pump(const Duration(seconds: 2));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.byKey(const Key('splash-logo')), findsNothing);
    expect(find.byKey(const Key('splash-loader')), findsNothing);
    expect(find.text('Telaflix.TV'), findsWidgets);
  });
}
