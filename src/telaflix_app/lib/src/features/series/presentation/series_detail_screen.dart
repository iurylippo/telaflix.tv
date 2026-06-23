import 'package:flutter/material.dart';

import '../../home/presentation/widgets/home_bottom_nav.dart';
import '../domain/series_content.dart';
import 'widgets/series_cast_section.dart';
import 'widgets/series_detail_header.dart';
import 'widgets/series_detail_hero.dart';
import 'widgets/series_episode_list.dart';
import 'widgets/related_series_section.dart';

class SeriesDetailScreen extends StatefulWidget {
  const SeriesDetailScreen({super.key, required this.detail});

  final SeriesDetailContent detail;

  @override
  State<SeriesDetailScreen> createState() => _SeriesDetailScreenState();
}

class _SeriesDetailScreenState extends State<SeriesDetailScreen> {
  int _selectedSeasonIndex = 0;

  @override
  Widget build(BuildContext context) {
    final detail = widget.detail;
    final selectedSeason = detail.seasons[_selectedSeasonIndex];

    return Scaffold(
      key: const Key('series-detail-screen'),
      backgroundColor: const Color(0xFF09090D),
      bottomNavigationBar: HomeBottomNav(
        selectedIndex: 2,
        onItemSelected: (index) {
          if (index == 0) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        },
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: SeriesDetailHeader()),
            SliverToBoxAdapter(
              child: SeriesDetailHero(detail: detail),
            ),
            SliverToBoxAdapter(
              child: SeriesEpisodeList(
                seasons: detail.seasons,
                selectedSeasonIndex: _selectedSeasonIndex,
                onSeasonChanged: (index) {
                  setState(() => _selectedSeasonIndex = index);
                },
                episodes: selectedSeason.episodes,
              ),
            ),
            SliverToBoxAdapter(
              child: SeriesCastSection(cast: detail.cast),
            ),
            SliverToBoxAdapter(
              child: RelatedSeriesSection(related: detail.related),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
