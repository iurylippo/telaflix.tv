import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../home/presentation/widgets/home_bottom_nav.dart';
import '../../movies/presentation/movies_screen.dart';
import '../../series/presentation/series_screen.dart';
import '../domain/live_tv_content.dart';
import 'widgets/live_tv_detail_header.dart';
import 'widgets/live_tv_detail_player.dart';
import 'widgets/live_tv_programming_section.dart';

class LiveTvDetailScreen extends StatelessWidget {
  const LiveTvDetailScreen({
    super.key,
    required this.detail,
    this.playerControllerFactory,
  });

  final LiveTvChannelDetail detail;
  final VideoPlayerController Function(String url)? playerControllerFactory;

  @override
  Widget build(BuildContext context) {
    final accentColor = Color(detail.colorValue);

    return Scaffold(
      key: const Key('live-tv-detail-screen'),
      backgroundColor: const Color(0xFF09090D),
      bottomNavigationBar: HomeBottomNav(
        selectedIndex: 3,
        onItemSelected: (index) {
          if (index == 0) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
          if (index == 1) {
            Navigator.of(context).popUntil((route) => route.isFirst);
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
            Navigator.of(context).popUntil((route) => route.isFirst);
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
            SliverToBoxAdapter(child: LiveTvDetailHeader()),
            SliverToBoxAdapter(
              child: LiveTvDetailPlayer(
                streamUrl: detail.streamUrl,
                channelName: detail.name,
                colorValue: detail.colorValue,
                controllerFactory: playerControllerFactory,
              ),
            ),
            SliverToBoxAdapter(
              child: _ChannelMetadata(detail: detail, accentColor: accentColor),
            ),
            SliverToBoxAdapter(
              child: LiveTvProgrammingSection(schedule: detail.schedule),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}

class _ChannelMetadata extends StatelessWidget {
  const _ChannelMetadata({required this.detail, required this.accentColor});

  final LiveTvChannelDetail detail;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detail.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w800,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFDC2626).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: const Color(0xFFDC2626).withValues(alpha: 0.3),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, color: Color(0xFFDC2626), size: 8),
                    SizedBox(width: 6),
                    Text(
                      'AO VIVO',
                      style: TextStyle(
                        color: Color(0xFFDC2626),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: accentColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  detail.currentProgram,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: accentColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  detail.category,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            detail.description,
            style: const TextStyle(
              color: Color(0xFFB0B0BE),
              fontSize: 14,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}
