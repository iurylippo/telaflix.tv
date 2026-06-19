import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:telaflix_app/src/app/app.dart';

void main() {
  testWidgets('shows splash screen before navigating to login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TelaflixApp());

    expect(find.byKey(const Key('splash-logo')), findsOneWidget);
    expect(find.byKey(const Key('splash-loader')), findsOneWidget);
    expect(find.text('Acesse sua conta'), findsNothing);

    await tester.pump(const Duration(seconds: 2));

    expect(find.byKey(const Key('splash-logo')), findsOneWidget);
    expect(find.byKey(const Key('splash-loader')), findsOneWidget);
    expect(find.text('Acesse sua conta'), findsNothing);

    await tester.pump(const Duration(seconds: 2));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.byKey(const Key('splash-logo')), findsNothing);
    expect(find.byKey(const Key('splash-loader')), findsNothing);
    expect(find.text('Acesse sua conta'), findsOneWidget);
    expect(find.byKey(const Key('login-field')), findsOneWidget);
    expect(find.byKey(const Key('password-field')), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
    expect(find.text('© 2024 Telaflix Entertainment'), findsOneWidget);
  });

  testWidgets('toggles password visibility and enters home from login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TelaflixApp());
    await tester.pump(const Duration(seconds: 4));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    final passwordField = tester.widget<EditableText>(
      find.byType(EditableText).last,
    );
    expect(passwordField.obscureText, isTrue);

    await tester.tap(find.byKey(const Key('toggle-password-visibility')));
    await tester.pump();

    final visiblePasswordField = tester.widget<EditableText>(
      find.byType(EditableText).last,
    );
    expect(visiblePasswordField.obscureText, isFalse);

    await tester.tap(find.text('Entrar'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Telaflix.TV'), findsWidgets);
  });
}
