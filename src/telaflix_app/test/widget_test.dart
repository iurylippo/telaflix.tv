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

    expect(find.byKey(const Key('home-screen')), findsOneWidget);
    expect(find.byKey(const Key('home-top-bar-logo')), findsOneWidget);
    expect(find.byKey(const Key('home-top-bar-search')), findsOneWidget);
    expect(find.byKey(const Key('home-top-bar-avatar')), findsOneWidget);
    expect(find.text('Boa noite, Iury'), findsOneWidget);
    expect(find.text('Amanhecer Vermelho'), findsWidgets);
    expect(find.text('Continuar assistindo'), findsOneWidget);
    expect(find.byKey(const Key('bottom-nav-home')), findsOneWidget);

    final activeHomeNavText = tester.widget<Text>(find.text('Inicio'));
    expect(activeHomeNavText.style?.fontWeight, FontWeight.w700);

    await tester.scrollUntilVisible(
      find.text('Filmes em destaque'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Filmes em destaque'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Canais ao vivo'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Canais ao vivo'), findsOneWidget);
  });
}
