class HomeContent {
  const HomeContent({
    required this.greeting,
    required this.hero,
    required this.continueWatching,
    required this.sections,
    required this.liveChannels,
  });

  final String greeting;
  final HeroBannerContent hero;
  final List<ContinueWatchingItem> continueWatching;
  final List<PosterSection> sections;
  final List<LiveChannelContent> liveChannels;
}

class HeroBannerContent {
  const HeroBannerContent({
    required this.eyebrow,
    required this.title,
    required this.description,
    required this.metadata,
    required this.primaryActionLabel,
    required this.secondaryActionLabel,
  });

  final String eyebrow;
  final String title;
  final String description;
  final String metadata;
  final String primaryActionLabel;
  final String secondaryActionLabel;
}

class ContinueWatchingItem {
  const ContinueWatchingItem({
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.durationLabel,
    required this.colorValue,
  });

  final String title;
  final String subtitle;
  final double progress;
  final String durationLabel;
  final int colorValue;
}

class PosterSection {
  const PosterSection({
    required this.title,
    required this.subtitle,
    required this.items,
  });

  final String title;
  final String subtitle;
  final List<PosterCardContent> items;
}

class PosterCardContent {
  const PosterCardContent({
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.colorValue,
  });

  final String title;
  final String subtitle;
  final String badge;
  final int colorValue;
}

class LiveChannelContent {
  const LiveChannelContent({
    required this.name,
    required this.program,
    required this.tag,
    required this.colorValue,
  });

  final String name;
  final String program;
  final String tag;
  final int colorValue;
}
