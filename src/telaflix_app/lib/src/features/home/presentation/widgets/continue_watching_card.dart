import 'package:flutter/material.dart';

import '../../domain/home_content.dart';

class ContinueWatchingCard extends StatelessWidget {
  const ContinueWatchingCard({super.key, required this.item});

  final ContinueWatchingItem item;

  @override
  Widget build(BuildContext context) {
    final accentColor = Color(item.colorValue);

    return Container(
      width: 252,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF16161C),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF242430)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [accentColor, const Color(0xFF0F1016)],
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.play_circle_fill_rounded,
                color: Colors.white,
                size: 52,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFF9A9AA5), fontSize: 12),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: item.progress,
              minHeight: 6,
              backgroundColor: const Color(0xFF272733),
              valueColor: AlwaysStoppedAnimation<Color>(accentColor),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.durationLabel,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFFD5D5DD), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
