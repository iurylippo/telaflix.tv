import 'package:flutter/material.dart';

import '../../domain/series_content.dart';

class SeriesPosterCard extends StatelessWidget {
  const SeriesPosterCard({super.key, required this.item});

  final SeriesPosterItem item;

  @override
  Widget build(BuildContext context) {
    final accentColor = Color(item.colorValue);

    final seasonLabel =
        '${item.seasonCount} ${item.seasonCount == 1 ? 'temporada' : 'temporadas'}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [accentColor, const Color(0xFF121218)],
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.tv_rounded,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          item.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          seasonLabel,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Color(0xFF8A8A98), fontSize: 10),
        ),
      ],
    );
  }
}
