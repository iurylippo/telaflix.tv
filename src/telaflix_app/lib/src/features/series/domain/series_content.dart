class SeriesContent {
  const SeriesContent({
    required this.featured,
    required this.categories,
    required this.posters,
  });

  final List<FeaturedSeriesItem> featured;
  final List<SeriesCategoryItem> categories;
  final List<SeriesPosterItem> posters;
}

class FeaturedSeriesItem {
  const FeaturedSeriesItem({
    required this.title,
    required this.subtitle,
    required this.metadata,
    required this.colorValue,
  });

  final String title;
  final String subtitle;
  final String metadata;
  final int colorValue;
}

class SeriesCategoryItem {
  const SeriesCategoryItem({
    required this.label,
    this.selected = false,
  });

  final String label;
  final bool selected;
}

class SeriesPosterItem {
  const SeriesPosterItem({
    required this.title,
    required this.subtitle,
    required this.seasonCount,
    required this.colorValue,
  });

  final String title;
  final String subtitle;
  final int seasonCount;
  final int colorValue;
}
