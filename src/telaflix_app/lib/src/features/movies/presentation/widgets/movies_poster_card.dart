import 'package:flutter/material.dart';

import '../../domain/movies_content.dart';

class MoviesPosterCard extends StatelessWidget {
  const MoviesPosterCard({super.key, required this.item, this.onTap});

  final MoviePosterItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final accentColor = Color(item.colorValue);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
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
                  Icons.movie_rounded,
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
            item.duration,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFF8A8A98), fontSize: 10),
          ),
        ],
      ),
    );
  }
}
