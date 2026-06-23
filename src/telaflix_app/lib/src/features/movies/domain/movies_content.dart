class MoviesContent {
  const MoviesContent({
    required this.featured,
    required this.categories,
    required this.posters,
  });

  final List<FeaturedMovieItem> featured;
  final List<MovieCategoryItem> categories;
  final List<MoviePosterItem> posters;
}

class FeaturedMovieItem {
  const FeaturedMovieItem({
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

class MovieCategoryItem {
  const MovieCategoryItem({
    required this.label,
    this.selected = false,
  });

  final String label;
  final bool selected;
}

class MoviePosterItem {
  const MoviePosterItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.colorValue,
  });

  final String id;
  final String title;
  final String subtitle;
  final String duration;
  final int colorValue;
}

class MovieDetailContent {
  const MovieDetailContent({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.year,
    required this.ageRating,
    required this.synopsis,
    required this.durationMinutes,
    required this.colorValue,
    required this.cast,
    required this.related,
  });

  final String id;
  final String title;
  final String subtitle;
  final int year;
  final String ageRating;
  final String synopsis;
  final int durationMinutes;
  final int colorValue;
  final List<MovieCastMember> cast;
  final List<RelatedMovieItem> related;

  List<String> get genreTags => [subtitle, '$year', ageRating];
}

class MovieCastMember {
  const MovieCastMember({
    required this.name,
    required this.role,
    required this.avatarColorValue,
  });

  final String name;
  final String role;
  final int avatarColorValue;
}

class RelatedMovieItem {
  const RelatedMovieItem({
    required this.title,
    required this.colorValue,
  });

  final String title;
  final int colorValue;
}
