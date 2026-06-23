import 'package:flutter/material.dart';

import '../../domain/series_content.dart';

class SeriesDetailHero extends StatelessWidget {
  const SeriesDetailHero({super.key, required this.detail});

  final SeriesDetailContent detail;

  @override
  Widget build(BuildContext context) {
    final accentColor = Color(detail.colorValue);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            key: const Key('detail-hero-poster'),
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [accentColor, const Color(0xFF121218), const Color(0xFF0A0A0E)],
              ),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.3),
                  blurRadius: 40,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.tv_rounded,
                color: Colors.white.withValues(alpha: 0.5),
                size: 64,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            key: const Key('detail-genre-chips'),
            spacing: 8,
            runSpacing: 8,
            children: detail.genreTags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: accentColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Text(
            detail.title,
            key: const Key('detail-title'),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w800,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${detail.seasonCount} ${detail.seasonCount == 1 ? 'temporada' : 'temporadas'}  |  ${detail.year}  |  ${detail.ageRating}',
            style: const TextStyle(
              color: Color(0xFF8A8A98),
              fontSize: 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            detail.synopsis,
            key: const Key('detail-synopsis'),
            style: const TextStyle(
              color: Color(0xFFB0B0BE),
              fontSize: 14,
              height: 1.55,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              key: const Key('detail-cta-button'),
              onPressed: () {},
              icon: const Icon(Icons.play_arrow_rounded, size: 24),
              label: const Text(
                'Continuar assistindo',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.3,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF36E21),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
