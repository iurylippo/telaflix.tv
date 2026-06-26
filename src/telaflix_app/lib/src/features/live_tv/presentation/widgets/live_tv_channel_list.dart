import 'package:flutter/material.dart';

import '../../domain/live_tv_content.dart';
import 'live_tv_channel_tile.dart';

class LiveTvChannelList extends StatelessWidget {
  const LiveTvChannelList({super.key, required this.channels});

  final List<LiveTvChannelItem> channels;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('live-tv-channel-list'),
      children: [
        for (final channel in channels) ...[
          LiveTvChannelTile(channel: channel),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
