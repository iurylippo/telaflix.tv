import 'package:flutter/material.dart';

import '../../domain/series_content.dart';

class FeaturedSeriesCard extends StatelessWidget {
  const FeaturedSeriesCard({super.key, required this.item, this.onTap});

  final FeaturedSeriesItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final accentColor = Color(item.colorValue);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 300,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [accentColor, const Color(0xFF121218), const Color(0xFF0A0A0E)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x4D000000),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    accentColor.withValues(alpha: 0.5),
                    const Color(0xFF101014),
                  ],
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.tv_rounded,
                  color: Colors.white.withValues(alpha: 0.7),
                  size: 44,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFF8A8A98), fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            item.metadata,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFF5A5A6E), fontSize: 11),
          ),
        ],
      ),
      ),
    );
  }
}
