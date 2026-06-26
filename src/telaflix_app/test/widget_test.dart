import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:telaflix_app/src/app/app.dart';
import 'package:telaflix_app/src/features/live_tv/data/mock_live_tv_content.dart';
import 'package:telaflix_app/src/features/live_tv/presentation/live_tv_detail_screen.dart';
import 'package:telaflix_app/src/features/live_tv/presentation/live_tv_screen.dart';
import 'package:telaflix_app/src/features/movies/data/mock_movies_content.dart';
import 'package:telaflix_app/src/features/movies/presentation/movies_detail_screen.dart';
import 'package:telaflix_app/src/features/movies/presentation/movies_screen.dart';
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

    testWidgets('tapping Movies nav navigates to Movies screen', (
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

      await tester.tap(find.byKey(const Key('bottom-nav-filmes')));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.byKey(const Key('movies-screen')), findsOneWidget);
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

    testWidgets('SeriesScreen -> MoviesScreen ao tocar bottom-nav-filmes', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: SeriesScreen()),
      );

      expect(find.byKey(const Key('series-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-filmes')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('movies-screen')), findsOneWidget);
    });

    testWidgets('SeriesDetailScreen -> MoviesScreen', (
      WidgetTester tester,
    ) async {
      final detail = mockSeriesDetails['codigo-das-sombras']!;

      await tester.pumpWidget(
        MaterialApp(
          home: SeriesDetailScreen(detail: detail),
        ),
      );

      expect(find.byKey(const Key('series-detail-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-filmes')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('movies-screen')), findsOneWidget);
    });
  });

  group('Movies screen', () {
    testWidgets('renders movies screen with all sections', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: MoviesScreen()),
      );

      expect(find.byKey(const Key('movies-screen')), findsOneWidget);
      expect(find.text('Filmes em Destaque'), findsOneWidget);
      expect(find.text('Explorar Filmes'), findsOneWidget);
      expect(find.text('Todos'), findsOneWidget);
      expect(find.text('Em alta'), findsOneWidget);
      expect(find.text('Acao'), findsAtLeast(1));
      expect(find.text('Drama'), findsAtLeast(1));
      expect(find.text('Comedia'), findsOneWidget);
      expect(find.text('Terror'), findsAtLeast(1));
      expect(find.text('Sci-fi'), findsAtLeast(1));
    });

    testWidgets('Movies bottom nav has Movies active', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: MoviesScreen()),
      );

      expect(find.byKey(const Key('bottom-nav-home')), findsOneWidget);
      expect(find.byKey(const Key('bottom-nav-filmes')), findsOneWidget);
      expect(find.byKey(const Key('bottom-nav-profile')), findsOneWidget);

      final moviesNavText = tester.widget<Text>(find.text('Filmes'));
      expect(moviesNavText.style?.fontWeight, FontWeight.w700);
    });

    testWidgets('navigates back to Home from Movies via bottom nav', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const TelaflixApp());
      await tester.pump(const Duration(seconds: 4));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.text('Entrar'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.byKey(const Key('bottom-nav-filmes')));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.byKey(const Key('movies-screen')), findsOneWidget);

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
        const MaterialApp(home: MoviesScreen()),
      );

      expect(find.byKey(const Key('movies-screen')), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('renders duration instead of season count on poster cards', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: MoviesScreen()),
      );

      expect(find.text('2h 22min'), findsWidgets);
      expect(find.text('1h 58min'), findsWidgets);
      expect(find.text('1h 34min'), findsOneWidget);
      expect(find.textContaining('temporada'), findsNothing);
    });

    testWidgets('tapping featured card navigates to detail screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: MoviesScreen()),
      );

      await tester.tap(find.text('Amanhecer Vermelho').first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('movies-detail-screen')), findsOneWidget);
      expect(find.byKey(const Key('detail-title')), findsOneWidget);
      expect(find.byKey(const Key('detail-synopsis')), findsOneWidget);
    });

    testWidgets('tapping poster card navigates to detail screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: MoviesScreen()),
      );

      await tester.scrollUntilVisible(
        find.text('Ultimo Refugio'),
        200,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pump();

      await tester.tap(find.text('Ultimo Refugio').first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('movies-detail-screen')), findsOneWidget);
      expect(find.byKey(const Key('detail-title')), findsOneWidget);
      expect(find.text('Ultimo Refugio'), findsOneWidget);
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

      final detail = mockMoviesDetails['amanhecer-vermelho']!;

      await tester.pumpWidget(
        MaterialApp(
          home: MoviesDetailScreen(detail: detail),
        ),
      );

      expect(find.byKey(const Key('movies-detail-screen')), findsOneWidget);
      expect(find.byKey(const Key('detail-title')), findsOneWidget);
      expect(find.text('Amanhecer Vermelho'), findsOneWidget);
      expect(find.byKey(const Key('detail-synopsis')), findsOneWidget);
      expect(find.byKey(const Key('detail-genre-chips')), findsOneWidget);
      expect(find.byKey(const Key('detail-hero-poster')), findsOneWidget);
      expect(find.byKey(const Key('detail-cta-button')), findsOneWidget);
      expect(find.text('Assistir agora'), findsOneWidget);

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

    testWidgets('detail screen has no season selector or episode list', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 1200);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final detail = mockMoviesDetails['amanhecer-vermelho']!;

      await tester.pumpWidget(
        MaterialApp(
          home: MoviesDetailScreen(detail: detail),
        ),
      );

      expect(find.byKey(const Key('season-selector')), findsNothing);
      expect(find.byKey(const Key('episodes-section-title')), findsNothing);
      expect(find.byKey(const Key('episode-scrollable-container')), findsNothing);
      expect(find.textContaining('Temporada'), findsNothing);
      expect(find.textContaining('episodios'), findsNothing);
    });

    testWidgets('back button returns to movies screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: MoviesScreen()),
      );

      await tester.tap(find.text('Amanhecer Vermelho').first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('movies-detail-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('detail-back-button')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('movies-detail-screen')), findsNothing);
      expect(find.byKey(const Key('movies-screen')), findsOneWidget);
    });

    testWidgets('detail bottom nav has Movies active', (
      WidgetTester tester,
    ) async {
      final detail = mockMoviesDetails['amanhecer-vermelho']!;

      await tester.pumpWidget(
        MaterialApp(
          home: MoviesDetailScreen(detail: detail),
        ),
      );

      expect(find.byKey(const Key('bottom-nav-filmes')), findsOneWidget);

      final moviesNavText = tester.widget<Text>(find.text('Filmes').last);
      expect(moviesNavText.style?.fontWeight, FontWeight.w700);
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

      final detail = mockMoviesDetails['amanhecer-vermelho']!;

      await tester.pumpWidget(
        MaterialApp(
          home: MoviesDetailScreen(detail: detail),
        ),
      );

      expect(find.byKey(const Key('movies-detail-screen')), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('MoviesScreen -> SeriesScreen ao tocar bottom-nav-series', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: MoviesScreen()),
      );

      expect(find.byKey(const Key('movies-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-series')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('series-screen')), findsOneWidget);
    });

    testWidgets('MoviesDetailScreen -> SeriesScreen', (
      WidgetTester tester,
    ) async {
      final detail = mockMoviesDetails['amanhecer-vermelho']!;

      await tester.pumpWidget(
        MaterialApp(
          home: MoviesDetailScreen(detail: detail),
        ),
      );

      expect(find.byKey(const Key('movies-detail-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-series')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('series-screen')), findsOneWidget);
    });
  });

  group('Bottom nav regression', () {
    testWidgets('Home -> Movies -> Series -> Home returns to Home, not Movies', (
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

      await tester.tap(find.byKey(const Key('bottom-nav-filmes')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byKey(const Key('movies-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-series')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byKey(const Key('series-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-home')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('home-screen')), findsOneWidget);
      expect(find.byKey(const Key('movies-screen')), findsNothing);
      expect(find.byKey(const Key('series-screen')), findsNothing);
    });

    testWidgets('Home -> Series -> Movies -> Home returns to Home, not Series', (
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
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byKey(const Key('series-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-filmes')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byKey(const Key('movies-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-home')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('home-screen')), findsOneWidget);
      expect(find.byKey(const Key('movies-screen')), findsNothing);
      expect(find.byKey(const Key('series-screen')), findsNothing);
    });
  });

  group('Live TV screen', () {
    testWidgets('renders live tv screen with all sections', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: LiveTvScreen()),
      );

      expect(find.byKey(const Key('live-tv-screen')), findsOneWidget);
      expect(find.text('TV Ao Vivo'), findsOneWidget);
      expect(find.text('Destaques'), findsOneWidget);
      expect(find.text('Canais'), findsOneWidget);
      expect(find.text('Todos'), findsOneWidget);
      expect(find.text('Abertos'), findsOneWidget);
      expect(find.text('Filmes'), findsAtLeast(1));
      expect(find.text('Esportes'), findsAtLeast(1));
      expect(find.text('Noticias'), findsOneWidget);
      expect(find.text('Kids'), findsOneWidget);
    });

    testWidgets('Live TV bottom nav has TV active', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: LiveTvScreen()),
      );

      expect(find.byKey(const Key('bottom-nav-home')), findsOneWidget);
      expect(find.byKey(const Key('bottom-nav-tv')), findsOneWidget);
      expect(find.byKey(const Key('bottom-nav-profile')), findsOneWidget);

      final tvNavText = tester.widget<Text>(find.text('TV'));
      expect(tvNavText.style?.fontWeight, FontWeight.w700);
    });

    testWidgets('navigates back to Home from TV via bottom nav', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const TelaflixApp());
      await tester.pump(const Duration(seconds: 4));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.text('Entrar'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.byKey(const Key('bottom-nav-tv')));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.byKey(const Key('live-tv-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-home')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('home-screen')), findsOneWidget);
    });

    testWidgets('does not overflow on narrow screen', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        const MaterialApp(home: LiveTvScreen()),
      );

      expect(find.byKey(const Key('live-tv-screen')), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('category chips are interactive', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: LiveTvScreen()),
      );

      final todosText = tester.widget<Text>(find.text('Todos'));
      expect(todosText.style?.fontWeight, FontWeight.w700);

      await tester.tap(find.text('Esportes'));
      await tester.pump();

      final esportesText = tester.widget<Text>(find.text('Esportes'));
      expect(esportesText.style?.fontWeight, FontWeight.w700);
    });

    testWidgets('Home bottom nav TV navigates to TV screen', (
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

      await tester.tap(find.byKey(const Key('bottom-nav-tv')));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.byKey(const Key('live-tv-screen')), findsOneWidget);
    });

    testWidgets('MoviesScreen -> TV ao tocar bottom-nav-tv', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: MoviesScreen()),
      );

      expect(find.byKey(const Key('movies-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-tv')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('live-tv-screen')), findsOneWidget);
    });

    testWidgets('SeriesScreen -> TV ao tocar bottom-nav-tv', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: SeriesScreen()),
      );

      expect(find.byKey(const Key('series-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-tv')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('live-tv-screen')), findsOneWidget);
    });

    testWidgets('MoviesDetailScreen -> TV', (
      WidgetTester tester,
    ) async {
      final detail = mockMoviesDetails['amanhecer-vermelho']!;

      await tester.pumpWidget(
        MaterialApp(
          home: MoviesDetailScreen(detail: detail),
        ),
      );

      expect(find.byKey(const Key('movies-detail-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-tv')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('live-tv-screen')), findsOneWidget);
    });

    testWidgets('SeriesDetailScreen -> TV', (
      WidgetTester tester,
    ) async {
      final detail = mockSeriesDetails['codigo-das-sombras']!;

      await tester.pumpWidget(
        MaterialApp(
          home: SeriesDetailScreen(detail: detail),
        ),
      );

      expect(find.byKey(const Key('series-detail-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-tv')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('live-tv-screen')), findsOneWidget);
    });

    testWidgets('search bar renders with placeholder', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: LiveTvScreen()),
      );

      expect(find.byKey(const Key('live-tv-search-bar')), findsOneWidget);
      expect(find.text('Buscar canais ou programas...'), findsOneWidget);
    });

    testWidgets('featured cards render horizontal list', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: LiveTvScreen()),
      );

      expect(find.byKey(const Key('live-tv-featured-list')), findsOneWidget);
      expect(find.text('Globo'), findsOneWidget);
      expect(find.text('ESPN Brasil'), findsWidgets);
    });

    testWidgets('LiveTvScreen -> MoviesScreen ao tocar bottom-nav-filmes', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: LiveTvScreen()),
      );

      expect(find.byKey(const Key('live-tv-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-filmes')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('movies-screen')), findsOneWidget);
    });

    testWidgets('LiveTvScreen -> SeriesScreen ao tocar bottom-nav-series', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: LiveTvScreen()),
      );

      expect(find.byKey(const Key('live-tv-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-series')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('series-screen')), findsOneWidget);
    });

    testWidgets('channel list renders channels', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: LiveTvScreen()),
      );

      await tester.scrollUntilVisible(
        find.byKey(const Key('live-tv-channel-list')),
        200,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pump();

      expect(find.byKey(const Key('live-tv-channel-list')), findsOneWidget);
      expect(find.text('Renascer'), findsOneWidget);
      expect(find.text('SportsCenter'), findsOneWidget);
    });

    testWidgets('tapping featured card navigates to detail screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: LiveTvScreen()),
      );

      await tester.tap(find.text('Globo').first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('live-tv-detail-screen')), findsOneWidget);
      expect(find.byKey(const Key('live-tv-player')), findsOneWidget);
      expect(find.text('Globo'), findsWidgets);
      expect(find.text('Renascer'), findsWidgets);
    });

    testWidgets('tapping channel tile navigates to detail screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: LiveTvScreen()),
      );

      await tester.scrollUntilVisible(
        find.byKey(const Key('live-tv-channel-globo')),
        200,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pump();

      await tester.tap(find.byKey(const Key('live-tv-channel-globo')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('live-tv-detail-screen')), findsOneWidget);
      expect(find.byKey(const Key('live-tv-player')), findsOneWidget);
      expect(find.text('Globo'), findsWidgets);
    });

    testWidgets('telecine-premium featured card resolves to detail', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: LiveTvScreen()),
      );

      await tester.tap(find.text('Telecine Premium').first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('live-tv-detail-screen')), findsOneWidget);
      expect(find.text('Interestelar'), findsWidgets);
    });

    testWidgets('detail screen shows player and fullscreen button', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 812);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final detail = mockLiveTvDetails['globo']!;

      await tester.pumpWidget(
        MaterialApp(
          home: LiveTvDetailScreen(
            detail: detail,
            playerControllerFactory: null,
          ),
        ),
      );

      expect(find.byKey(const Key('live-tv-detail-screen')), findsOneWidget);
      expect(find.byKey(const Key('live-tv-player')), findsOneWidget);
      expect(find.byKey(const Key('live-tv-fullscreen-button')), findsOneWidget);
    });

    testWidgets('detail screen shows channel metadata', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 812);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final detail = mockLiveTvDetails['globo']!;

      await tester.pumpWidget(
        MaterialApp(
          home: LiveTvDetailScreen(
            detail: detail,
            playerControllerFactory: null,
          ),
        ),
      );

      expect(find.text('Globo'), findsWidgets);
      expect(find.text('Renascer'), findsWidgets);
      expect(find.text('Novela'), findsOneWidget);
      expect(find.text('AO VIVO'), findsWidgets);
    });

    testWidgets('detail screen shows programming section with current program', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 1200);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final detail = mockLiveTvDetails['globo']!;

      await tester.pumpWidget(
        MaterialApp(
          home: LiveTvDetailScreen(
            detail: detail,
            playerControllerFactory: null,
          ),
        ),
      );

      await tester.scrollUntilVisible(
        find.byKey(const Key('live-tv-programming-section')),
        300,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pump();

      expect(find.byKey(const Key('live-tv-programming-section')), findsOneWidget);
      expect(find.byKey(const Key('live-tv-current-program')), findsOneWidget);
      expect(find.text('Programacao'), findsOneWidget);
      expect(find.text('21:00'), findsOneWidget);
      expect(find.text('Jornal Nacional'), findsOneWidget);
      expect(find.text('BBB 25'), findsOneWidget);
    });

    testWidgets('programming section highlights current program', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 1200);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final detail = mockLiveTvDetails['globo']!;

      await tester.pumpWidget(
        MaterialApp(
          home: LiveTvDetailScreen(
            detail: detail,
            playerControllerFactory: null,
          ),
        ),
      );

      await tester.scrollUntilVisible(
        find.byKey(const Key('live-tv-current-program')),
        300,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pump();

      expect(find.byKey(const Key('live-tv-current-program')), findsOneWidget);

      final currentProgramRow = find.descendant(
        of: find.byKey(const Key('live-tv-current-program')),
        matching: find.byType(Container),
      ).first;
      final container = tester.widget<Container>(currentProgramRow);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, const Color(0xFF1A1A24));
    });

    testWidgets('back button returns to live tv screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: LiveTvScreen()),
      );

      await tester.tap(find.text('Globo').first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('live-tv-detail-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('detail-back-button')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('live-tv-detail-screen')), findsNothing);
      expect(find.byKey(const Key('live-tv-screen')), findsOneWidget);
    });

    testWidgets('detail bottom nav has TV active', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 812);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final detail = mockLiveTvDetails['globo']!;

      await tester.pumpWidget(
        MaterialApp(
          home: LiveTvDetailScreen(
            detail: detail,
            playerControllerFactory: null,
          ),
        ),
      );

      expect(find.byKey(const Key('bottom-nav-tv')), findsOneWidget);

      final tvNavText = tester.widget<Text>(find.text('TV').last);
      expect(tvNavText.style?.fontWeight, FontWeight.w700);
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

      final detail = mockLiveTvDetails['globo']!;

      await tester.pumpWidget(
        MaterialApp(
          home: LiveTvDetailScreen(
            detail: detail,
            playerControllerFactory: null,
          ),
        ),
      );

      expect(find.byKey(const Key('live-tv-detail-screen')), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('LiveTvDetailScreen -> MoviesScreen via bottom nav', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 812);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final detail = mockLiveTvDetails['globo']!;

      await tester.pumpWidget(
        MaterialApp(
          home: LiveTvDetailScreen(
            detail: detail,
            playerControllerFactory: null,
          ),
        ),
      );

      expect(find.byKey(const Key('live-tv-detail-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-filmes')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('movies-screen')), findsOneWidget);
    });

    testWidgets('LiveTvDetailScreen -> SeriesScreen via bottom nav', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 812);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final detail = mockLiveTvDetails['globo']!;

      await tester.pumpWidget(
        MaterialApp(
          home: LiveTvDetailScreen(
            detail: detail,
            playerControllerFactory: null,
          ),
        ),
      );

      expect(find.byKey(const Key('live-tv-detail-screen')), findsOneWidget);

      await tester.tap(find.byKey(const Key('bottom-nav-series')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byKey(const Key('series-screen')), findsOneWidget);
    });
  });
}
