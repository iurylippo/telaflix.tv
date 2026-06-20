import 'package:flutter/material.dart';

import '../../domain/home_content.dart';

class PosterCard extends StatelessWidget {
  const PosterCard({super.key, required this.item});

  final PosterCardContent item;

  @override
  Widget build(BuildContext context) {
    final accentColor = Color(item.colorValue);

    return SizedBox(
      width: 148,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [accentColor, const Color(0xFF121218)],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xCC111116),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        item.badge,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const Center(
                    child: Icon(
                      Icons.local_movies_rounded,
                      color: Colors.white,
                      size: 42,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
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
        ],
      ),
    );
  }
}
