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

class LiveTvProgramItem {
  const LiveTvProgramItem({
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.description,
    this.isCurrent = false,
  });

  final String startTime;
  final String endTime;
  final String title;
  final String description;
  final bool isCurrent;
}

class LiveTvChannelDetail {
  const LiveTvChannelDetail({
    required this.id,
    required this.name,
    required this.streamUrl,
    required this.currentProgram,
    required this.category,
    required this.description,
    required this.colorValue,
    required this.schedule,
  });

  final String id;
  final String name;
  final String streamUrl;
  final String currentProgram;
  final String category;
  final String description;
  final int colorValue;
  final List<LiveTvProgramItem> schedule;
}
