class LiveTvContent {
  const LiveTvContent({
    required this.featured,
    required this.categories,
    required this.channels,
  });

  final List<FeaturedLiveTvItem> featured;
  final List<LiveTvCategoryItem> categories;
  final List<LiveTvChannelItem> channels;
}

class FeaturedLiveTvItem {
  const FeaturedLiveTvItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.metadata,
    required this.colorValue,
  });

  final String id;
  final String title;
  final String subtitle;
  final String metadata;
  final int colorValue;
}

class LiveTvCategoryItem {
  const LiveTvCategoryItem({
    required this.label,
    this.selected = false,
  });

  final String label;
  final bool selected;
}

class LiveTvChannelItem {
  const LiveTvChannelItem({
    required this.id,
    required this.name,
    required this.currentProgram,
    required this.category,
    required this.colorValue,
    this.live = true,
  });

  final String id;
  final String name;
  final String currentProgram;
  final String category;
  final int colorValue;
  final bool live;
}
