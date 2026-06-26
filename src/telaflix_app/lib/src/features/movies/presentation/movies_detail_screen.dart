import 'package:flutter/material.dart';

import '../../home/presentation/widgets/home_bottom_nav.dart';
import '../../live_tv/presentation/live_tv_screen.dart';
import '../../series/presentation/series_screen.dart';
import '../domain/movies_content.dart';
import 'widgets/movies_cast_section.dart';
import 'widgets/movies_detail_header.dart';
import 'widgets/movies_detail_hero.dart';
import 'widgets/related_movies_section.dart';

class MoviesDetailScreen extends StatelessWidget {
  const MoviesDetailScreen({super.key, required this.detail});

  final MovieDetailContent detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('movies-detail-screen'),
      backgroundColor: const Color(0xFF09090D),
      bottomNavigationBar: HomeBottomNav(
        selectedIndex: 1,
        onItemSelected: (index) {
          if (index == 0) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
          if (index == 2) {
            Navigator.of(context)
                .popUntil((route) => route.isFirst);
            Navigator.of(context).push(
              PageRouteBuilder<void>(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const SeriesScreen(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
          }
          if (index == 3) {
            Navigator.of(context)
                .popUntil((route) => route.isFirst);
            Navigator.of(context).push(
              PageRouteBuilder<void>(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const LiveTvScreen(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
          }
        },
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: MoviesDetailHeader()),
            SliverToBoxAdapter(
              child: MoviesDetailHero(detail: detail),
            ),
            SliverToBoxAdapter(
              child: MoviesCastSection(cast: detail.cast),
            ),
            SliverToBoxAdapter(
              child: RelatedMoviesSection(related: detail.related),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
