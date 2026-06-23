import 'package:flutter/material.dart';

import '../../domain/series_content.dart';

class SeriesEpisodeList extends StatelessWidget {
  const SeriesEpisodeList({
    super.key,
    required this.seasons,
    required this.selectedSeasonIndex,
    required this.onSeasonChanged,
    required this.episodes,
  });

  final List<SeriesSeason> seasons;
  final int selectedSeasonIndex;
  final ValueChanged<int> onSeasonChanged;
  final List<SeriesEpisode> episodes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Episodios',
            key: Key('episodes-section-title'),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 38,
            child: ListView.separated(
              key: const Key('season-selector'),
              scrollDirection: Axis.horizontal,
              itemCount: seasons.length,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final season = seasons[index];
                final selected = index == selectedSeasonIndex;
                return GestureDetector(
                  onTap: () => onSeasonChanged(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      color: selected
                          ? const Color(0xFFF36E21)
                          : const Color(0xFF17171D),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: selected
                            ? const Color(0xFFF36E21)
                            : const Color(0xFF262631),
                      ),
                    ),
                    child: Text(
                      season.title,
                      style: TextStyle(
                        color: selected ? Colors.white : const Color(0xFF8A8A98),
                        fontSize: 13,
                        fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '${episodes.length} ${episodes.length == 1 ? 'episodio' : 'episodios'}',
            style: const TextStyle(
              color: Color(0xFF8A8A98),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 580,
            child: Container(
              key: const Key('episode-scrollable-container'),
              decoration: BoxDecoration(
                color: const Color(0xFF121218),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF23232C)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ListView.separated(
                  padding: const EdgeInsets.all(14),
                  itemCount: episodes.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, i) => _EpisodeRow(episode: episodes[i]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EpisodeRow extends StatelessWidget {
  const _EpisodeRow({required this.episode});

  final SeriesEpisode episode;

  @override
  Widget build(BuildContext context) {
    final thumbnailColor = Color(episode.thumbnailColorValue);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF121218),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF23232C)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [thumbnailColor, const Color(0xFF101014)],
              ),
            ),
            child: Center(
              child: Icon(
                Icons.play_circle_rounded,
                color: Colors.white.withValues(alpha: 0.6),
                size: 28,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${episode.number}.',
                      style: TextStyle(
                        color: const Color(0xFFF36E21),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        episode.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      episode.duration,
                      style: const TextStyle(
                        color: Color(0xFF5A5A6E),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  episode.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF8A8A98),
                    fontSize: 12,
                    height: 1.35,
                  ),
                ),
                if (episode.progress > 0) ...[
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: LinearProgressIndicator(
                      value: episode.progress,
                      minHeight: 3,
                      backgroundColor: const Color(0xFF23232C),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFFF36E21),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
