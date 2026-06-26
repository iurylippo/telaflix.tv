import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../home/presentation/widgets/home_bottom_nav.dart';
import '../../movies/presentation/movies_screen.dart';
import '../../series/presentation/series_screen.dart';
import '../data/mock_live_tv_content.dart';
import 'live_tv_detail_screen.dart';
import 'widgets/live_tv_category_chips.dart';
import 'widgets/live_tv_channel_list.dart';
import 'widgets/live_tv_featured_card.dart';
import 'widgets/live_tv_search_bar.dart';

class LiveTvScreen extends StatelessWidget {
  const LiveTvScreen({super.key});

  static const _bottomNavKey = Key('bottom-nav');

  void _openDetail(BuildContext context, String channelId) {
    final detail = mockLiveTvDetails[channelId];
    if (detail == null) return;
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            LiveTvDetailScreen(
              detail: detail,
              playerControllerFactory:
                  (url) => VideoPlayerController.networkUrl(Uri.parse(url)),
            ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final content = mockLiveTvContent;

    return Scaffold(
      key: const Key('live-tv-screen'),
      backgroundColor: const Color(0xFF09090D),
      bottomNavigationBar: HomeBottomNav(
        key: _bottomNavKey,
        selectedIndex: 3,
        onItemSelected: (index) {
          if (index == 0) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
          if (index == 1) {
            Navigator.of(context).push(
              PageRouteBuilder<void>(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const MoviesScreen(),
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
                  const Text(
                    'TV Ao Vivo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const LiveTvSearchBar(),
                  const SizedBox(height: 24),
                  const _SectionTitle(title: 'Destaques'),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      key: const Key('live-tv-featured-list'),
                      scrollDirection: Axis.horizontal,
                      itemCount: content.featured.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        final item = content.featured[index];
                        return LiveTvFeaturedCard(
                          item: item,
                          onTap: () => _openDetail(context, item.id),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 28),
                  LiveTvCategoryChips(categories: content.categories),
                  const SizedBox(height: 28),
                  const _SectionTitle(title: 'Canais'),
                  const SizedBox(height: 14),
                  LiveTvChannelList(
                    channels: content.channels,
                    onChannelSelected: (channel) =>
                        _openDetail(context, channel.id),
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
