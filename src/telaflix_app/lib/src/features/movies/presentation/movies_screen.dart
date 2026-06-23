import 'package:flutter/material.dart';

import '../../home/presentation/widgets/home_bottom_nav.dart';
import '../../series/presentation/series_screen.dart';
import '../data/mock_movies_content.dart';
import 'movies_detail_screen.dart';
import 'widgets/featured_movie_card.dart';
import 'widgets/movies_category_chips.dart';
import 'widgets/movies_poster_grid.dart';
import 'widgets/movies_search_bar.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  static const _bottomNavKey = Key('bottom-nav');

  void _openDetail(BuildContext context, String movieId) {
    final detail = mockMoviesDetails[movieId];
    if (detail == null) return;

    Navigator.of(context).push(
      PageRouteBuilder<void>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            MoviesDetailScreen(detail: detail),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final content = mockMoviesContent;

    return Scaffold(
      key: const Key('movies-screen'),
      backgroundColor: const Color(0xFF09090D),
      bottomNavigationBar: HomeBottomNav(
        key: _bottomNavKey,
        selectedIndex: 1,
        onItemSelected: (index) {
          if (index == 0) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
          if (index == 2) {
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
        },
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              sliver: SliverList.list(
                children: [
                  const MoviesSearchBar(),
                  const SizedBox(height: 24),
                  const _SectionTitle(title: 'Filmes em Destaque'),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: content.featured.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        final item = content.featured[index];
                        return FeaturedMovieCard(
                          item: item,
                          onTap: () => _openDetail(context, item.id),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 28),
                  MoviesCategoryChips(categories: content.categories),
                  const SizedBox(height: 28),
                  const _SectionTitle(title: 'Explorar Filmes'),
                  const SizedBox(height: 14),
                  MoviesPosterGrid(
                    posters: content.posters,
                    onPosterSelected: (item) =>
                        _openDetail(context, item.id),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
