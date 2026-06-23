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
    required this.id,
    required this.title,
    required this.subtitle,
    required this.seasonCount,
    required this.colorValue,
  });

  final String id;
  final String title;
  final String subtitle;
  final int seasonCount;
  final int colorValue;
}

class SeriesDetailContent {
  const SeriesDetailContent({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.year,
    required this.ageRating,
    required this.synopsis,
    required this.colorValue,
    required this.seasons,
    required this.cast,
    required this.related,
  });

  final String id;
  final String title;
  final String subtitle;
  final int year;
  final String ageRating;
  final String synopsis;
  final int colorValue;
  final List<SeriesSeason> seasons;
  final List<SeriesCastMember> cast;
  final List<RelatedSeriesItem> related;

  int get seasonCount => seasons.length;
  int get episodeCount => seasons.fold(0, (sum, s) => sum + s.episodes.length);

  List<String> get genreTags => [subtitle, '$year', ageRating];
}

class SeriesSeason {
  const SeriesSeason({
    required this.number,
    required this.title,
    required this.episodes,
  });

  final int number;
  final String title;
  final List<SeriesEpisode> episodes;
}

class SeriesEpisode {
  const SeriesEpisode({
    required this.number,
    required this.title,
    required this.duration,
    required this.description,
    required this.thumbnailColorValue,
    this.progress = 0.0,
  });

  final int number;
  final String title;
  final String duration;
  final String description;
  final int thumbnailColorValue;
  final double progress;
}

class SeriesCastMember {
  const SeriesCastMember({
    required this.name,
    required this.role,
    required this.avatarColorValue,
  });

  final String name;
  final String role;
  final int avatarColorValue;
}

class RelatedSeriesItem {
  const RelatedSeriesItem({
    required this.title,
    required this.colorValue,
  });

  final String title;
  final int colorValue;
}
