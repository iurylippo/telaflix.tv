import 'package:flutter/material.dart';

import '../../domain/home_content.dart';

class LiveChannelCard extends StatelessWidget {
  const LiveChannelCard({super.key, required this.channel});

  final LiveChannelContent channel;

  @override
  Widget build(BuildContext context) {
    final accentColor = Color(channel.colorValue);

    return Container(
      width: 208,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF16161C),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFF242430)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: accentColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  channel.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    accentColor.withValues(alpha: 0.9),
                    const Color(0xFF101014),
                  ],
                ),
              ),
              child: const Center(
                child: Icon(Icons.live_tv_rounded, color: Colors.white, size: 38),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            channel.program,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            channel.tag,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFF9A9AA5), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
