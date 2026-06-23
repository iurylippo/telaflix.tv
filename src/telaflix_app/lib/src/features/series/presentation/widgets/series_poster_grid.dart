import 'package:flutter/material.dart';

import '../../domain/series_content.dart';
import 'series_poster_card.dart';

class SeriesPosterGrid extends StatelessWidget {
  const SeriesPosterGrid({
    super.key,
    required this.posters,
    this.onPosterSelected,
  });

  final List<SeriesPosterItem> posters;
  final ValueChanged<SeriesPosterItem>? onPosterSelected;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        const crossAxisCount = 3;
        const horizontalSpacing = 12.0;
        const verticalSpacing = 16.0;
        final cardWidth =
            (availableWidth - (crossAxisCount - 1) * horizontalSpacing) /
                crossAxisCount;
        const cardAspectRatio = 0.64;
        final cardHeight = cardWidth / cardAspectRatio;

        final rows = (posters.length / crossAxisCount).ceil();
        final totalHeight = rows * cardHeight + (rows - 1) * verticalSpacing;

        return SizedBox(
          height: totalHeight,
          child: Wrap(
            spacing: horizontalSpacing,
            runSpacing: verticalSpacing,
            children: [
              for (final poster in posters)
                SizedBox(
                  width: cardWidth,
                  height: cardHeight,
                  child: SeriesPosterCard(
                    item: poster,
                    onTap: onPosterSelected != null
                        ? () => onPosterSelected!(poster)
                        : null,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
