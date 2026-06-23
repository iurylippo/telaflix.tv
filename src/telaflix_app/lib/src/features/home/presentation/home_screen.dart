import 'package:flutter/material.dart';

import '../../series/presentation/series_screen.dart';
import '../data/mock_home_content.dart';
import 'widgets/continue_watching_card.dart';
import 'widgets/hero_banner.dart';
import 'widgets/home_bottom_nav.dart';
import 'widgets/home_section_shell.dart';
import 'widgets/home_top_bar.dart';
import 'widgets/live_channel_card.dart';
import 'widgets/poster_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final content = mockHomeContent;

    return Scaffold(
      key: const Key('home-screen'),
      backgroundColor: const Color(0xFF09090D),
      bottomNavigationBar: HomeBottomNav(
        selectedIndex: 0,
        onItemSelected: (index) {
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
                  HomeTopBar(greeting: content.greeting),
                  const SizedBox(height: 24),
                  HeroBanner(content: content.hero),
                  const SizedBox(height: 32),
                  HomeSectionShell(
                    title: 'Continuar assistindo',
                    subtitle: 'Retome de onde voce parou',
                    child: SizedBox(
                      height: 280,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: content.continueWatching.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 14),
                        itemBuilder: (context, index) {
                          return ContinueWatchingCard(
                            item: content.continueWatching[index],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  for (final section in content.sections) ...[
                    HomeSectionShell(
                      title: section.title,
                      subtitle: section.subtitle,
                      child: SizedBox(
                        height: 280,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: section.items.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 14),
                          itemBuilder: (context, index) {
                            return PosterCard(item: section.items[index]);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                  HomeSectionShell(
                    title: 'Canais ao vivo',
                    subtitle: 'Programacao em tempo real',
                    child: SizedBox(
                      height: 210,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: content.liveChannels.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 14),
                        itemBuilder: (context, index) {
                          return LiveChannelCard(
                            channel: content.liveChannels[index],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
