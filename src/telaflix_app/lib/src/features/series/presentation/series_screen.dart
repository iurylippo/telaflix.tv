import 'package:flutter/material.dart';

import '../../home/presentation/widgets/home_bottom_nav.dart';
import '../data/mock_series_content.dart';
import 'widgets/featured_series_card.dart';
import 'widgets/series_category_chips.dart';
import 'widgets/series_poster_grid.dart';
import 'widgets/series_search_bar.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({super.key});

  static const _bottomNavKey = Key('bottom-nav');

  @override
  Widget build(BuildContext context) {
    final content = mockSeriesContent;

    return Scaffold(
      key: const Key('series-screen'),
      backgroundColor: const Color(0xFF09090D),
      bottomNavigationBar: HomeBottomNav(
        key: _bottomNavKey,
        selectedIndex: 2,
        onItemSelected: (index) {
          if (index == 0) {
            Navigator.of(context).pop();
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
                  const SeriesSearchBar(),
                  const SizedBox(height: 24),
                  const _SectionTitle(title: 'Series em Destaque'),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: content.featured.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        return FeaturedSeriesCard(
                          item: content.featured[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 28),
                  SeriesCategoryChips(categories: content.categories),
                  const SizedBox(height: 28),
                  const _SectionTitle(title: 'Explorar Series'),
                  const SizedBox(height: 14),
                  SeriesPosterGrid(posters: content.posters),
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
