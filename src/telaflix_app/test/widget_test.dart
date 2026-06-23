import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:telaflix_app/src/app/app.dart';
import 'package:telaflix_app/src/features/series/data/mock_series_content.dart';
import 'package:telaflix_app/src/features/series/presentation/series_detail_screen.dart';
import 'package:telaflix_app/src/features/series/presentation/series_screen.dart';

void main() {
  group('Splash and Login', () {
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

    testWidgets('logs in and renders home screen with bottom nav', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const TelaflixApp());
      await tester.pump(const Duration(seconds: 4));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

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
      expect(find.byKey(const Key('bottom-nav-filmes')), findsOneWidget);
      expect(find.byKey(const Key('bottom-nav-series')), findsOneWidget);
      expect(find.byKey(const Key('bottom-nav-tv')), findsOneWidget);
      expect(find.byKey(const Key('bottom-nav-profile')), findsOneWidget);

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Filmes'), findsOneWidget);
      expect(find.text('Series'), findsOneWidget);
      expect(find.text('TV'), findsOneWidget);
      expect(find.text('Perfil'), findsOneWidget);

      final homeText = tester.widget<Text>(find.text('Home'));
      expect(homeText.style?.fontWeight, FontWeight.w700);

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

    testWidgets('toggles password visibility', (
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
    });

    testWidgets('tapping Series nav navigates to Series screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const TelaflixApp());
      await tester.pump(const Duration(seconds: 4));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.text('Entrar'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.byKey(const Key('home-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-series')));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.byKey(const Key('series-screen')), findsOneWidget);
    });
  });

  group('Series screen', () {
    testWidgets('renders series screen with all sections', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: SeriesScreen()),
      );

      expect(find.byKey(const Key('series-screen')), findsOneWidget);
      expect(find.text('Series em Destaque'), findsOneWidget);
      expect(find.text('Explorar Series'), findsOneWidget);
      expect(find.text('Todas'), findsOneWidget);
      expect(find.text('Em alta'), findsOneWidget);
      expect(find.text('Drama'), findsAtLeast(1));
      expect(find.text('Acao'), findsAtLeast(1));
      expect(find.text('Anime'), findsOneWidget);
      expect(find.text('Comedia'), findsOneWidget);
      expect(find.text('Terror'), findsAtLeast(1));
    });

    testWidgets('Series bottom nav has Series active', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: SeriesScreen()),
      );

      expect(find.byKey(const Key('bottom-nav-home')), findsOneWidget);
      expect(find.byKey(const Key('bottom-nav-series')), findsOneWidget);
      expect(find.byKey(const Key('bottom-nav-profile')), findsOneWidget);

      final seriesNavText = tester.widget<Text>(find.text('Series'));
      expect(seriesNavText.style?.fontWeight, FontWeight.w700);
    });

    testWidgets('navigates back to Home from Series via bottom nav', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const TelaflixApp());
      await tester.pump(const Duration(seconds: 4));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.text('Entrar'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.byKey(const Key('bottom-nav-series')));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.byKey(const Key('series-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-home')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('home-screen')), findsOneWidget);
    });

    testWidgets('poster grid does not overflow on narrow screen', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        const MaterialApp(home: SeriesScreen()),
      );

      expect(find.byKey(const Key('series-screen')), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('renders season count on poster cards', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: SeriesScreen()),
      );

      expect(find.text('3 temporadas'), findsWidgets);
      expect(find.text('1 temporada'), findsWidgets);
    });

    testWidgets('tapping featured card navigates to detail screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: SeriesScreen()),
      );

      await tester.tap(find.text('Codigo das Sombras').first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('series-detail-screen')), findsOneWidget);
      expect(find.byKey(const Key('detail-title')), findsOneWidget);
      expect(find.byKey(const Key('detail-synopsis')), findsOneWidget);
    });

    testWidgets('tapping poster card navigates to detail screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: SeriesScreen()),
      );

      await tester.scrollUntilVisible(
        find.text('Horizonte Final'),
        200,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pump();

      await tester.tap(find.text('Horizonte Final').first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('series-detail-screen')), findsOneWidget);
      expect(find.byKey(const Key('detail-title')), findsOneWidget);
      expect(find.text('Horizonte Final'), findsOneWidget);
    });

    testWidgets('detail screen shows all main sections', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 1600);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final detail = mockSeriesDetails['codigo-das-sombras']!;

      await tester.pumpWidget(
        MaterialApp(
          home: SeriesDetailScreen(detail: detail),
        ),
      );

      expect(find.byKey(const Key('series-detail-screen')), findsOneWidget);
      expect(find.byKey(const Key('detail-title')), findsOneWidget);
      expect(find.text('Codigo das Sombras'), findsOneWidget);
      expect(find.byKey(const Key('detail-synopsis')), findsOneWidget);
      expect(find.byKey(const Key('detail-genre-chips')), findsOneWidget);
      expect(find.byKey(const Key('detail-hero-poster')), findsOneWidget);
      expect(find.byKey(const Key('detail-cta-button')), findsOneWidget);
      expect(find.text('Continuar assistindo'), findsOneWidget);

      await tester.scrollUntilVisible(
        find.byKey(const Key('episodes-section-title')),
        300,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.byKey(const Key('episodes-section-title')), findsOneWidget);
      expect(find.byKey(const Key('season-selector')), findsOneWidget);
      expect(find.text('Temporada 1'), findsOneWidget);
      expect(find.text('Temporada 2'), findsOneWidget);

      await tester.scrollUntilVisible(
        find.byKey(const Key('cast-section-title')),
        300,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.byKey(const Key('cast-section-title')), findsOneWidget);

      await tester.scrollUntilVisible(
        find.byKey(const Key('related-section-title')),
        300,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.byKey(const Key('related-section-title')), findsOneWidget);
    });

    testWidgets('season switching updates episode list', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 1200);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final detail = mockSeriesDetails['codigo-das-sombras']!;

      await tester.pumpWidget(
        MaterialApp(
          home: SeriesDetailScreen(detail: detail),
        ),
      );

      await tester.scrollUntilVisible(
        find.byKey(const Key('season-selector')),
        300,
        scrollable: find.byType(Scrollable).first,
      );

      expect(find.byKey(const Key('season-selector')), findsOneWidget);
      expect(find.text('4 episodios'), findsOneWidget);

      await tester.tap(find.text('Temporada 2'));
      await tester.pump();

      expect(find.text('2 episodios'), findsOneWidget);
      expect(find.text('Rastros do Passado'), findsOneWidget);
      expect(find.text('Testemunha Protegida'), findsOneWidget);
    });

    testWidgets('episode list has a fixed-height scrollable container', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 1600);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final detail = mockSeriesDetails['codigo-das-sombras']!;

      await tester.pumpWidget(
        MaterialApp(
          home: SeriesDetailScreen(detail: detail),
        ),
      );

      await tester.scrollUntilVisible(
        find.byKey(const Key('episode-scrollable-container')),
        300,
        scrollable: find.byType(Scrollable).first,
      );

      expect(find.byKey(const Key('episode-scrollable-container')), findsOneWidget);

      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byKey(const Key('episode-scrollable-container')),
          matching: find.byType(SizedBox),
        ).first,
      );
      expect(sizedBox.height, 580);

      final nestedScrollable = find.descendant(
        of: find.byKey(const Key('episode-scrollable-container')),
        matching: find.byType(Scrollable),
      );
      expect(nestedScrollable, findsWidgets);
    });

    testWidgets('back button returns to series screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: SeriesScreen()),
      );

      await tester.tap(find.text('Codigo das Sombras').first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('series-detail-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('detail-back-button')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('series-detail-screen')), findsNothing);
      expect(find.byKey(const Key('series-screen')), findsOneWidget);
    });

    testWidgets('detail bottom nav has Series active', (
      WidgetTester tester,
    ) async {
      final detail = mockSeriesDetails['codigo-das-sombras']!;

      await tester.pumpWidget(
        MaterialApp(
          home: SeriesDetailScreen(detail: detail),
        ),
      );

      expect(find.byKey(const Key('bottom-nav-series')), findsOneWidget);

      final seriesNavText = tester.widget<Text>(find.text('Series').last);
      expect(seriesNavText.style?.fontWeight, FontWeight.w700);
    });

    testWidgets('detail does not overflow on narrow screen', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final detail = mockSeriesDetails['codigo-das-sombras']!;

      await tester.pumpWidget(
        MaterialApp(
          home: SeriesDetailScreen(detail: detail),
        ),
      );

      expect(find.byKey(const Key('series-detail-screen')), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
