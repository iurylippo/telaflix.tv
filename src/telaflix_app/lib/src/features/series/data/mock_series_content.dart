import '../domain/series_content.dart';

const mockSeriesContent = SeriesContent(
  featured: [
    FeaturedSeriesItem(
      title: 'Codigo das Sombras',
      subtitle: 'Drama policial',
      metadata: '2026  |  2 temporadas  |  16+',
      colorValue: 0xFF0F766E,
    ),
    FeaturedSeriesItem(
      title: 'Rota 88',
      subtitle: 'Road thriller',
      metadata: '2025  |  1 temporada  |  18+',
      colorValue: 0xFF7C2D12,
    ),
    FeaturedSeriesItem(
      title: 'Entre Mundos',
      subtitle: 'Fantasia',
      metadata: '2026  |  3 temporadas  |  14+',
      colorValue: 0xFF6D28D9,
    ),
  ],
  categories: [
    SeriesCategoryItem(label: 'Todas', selected: true),
    SeriesCategoryItem(label: 'Em alta'),
    SeriesCategoryItem(label: 'Drama'),
    SeriesCategoryItem(label: 'Acao'),
    SeriesCategoryItem(label: 'Anime'),
    SeriesCategoryItem(label: 'Comedia'),
    SeriesCategoryItem(label: 'Terror'),
  ],
  posters: [
    SeriesPosterItem(
      title: 'Horizonte Final',
      subtitle: 'Ficcao cientifica',
      seasonCount: 3,
      colorValue: 0xFF7C3AED,
    ),
    SeriesPosterItem(
      title: 'Amanhecer Carmesim',
      subtitle: 'Drama',
      seasonCount: 2,
      colorValue: 0xFFEA580C,
    ),
    SeriesPosterItem(
      title: 'Distrito Neon',
      subtitle: 'Suspense',
      seasonCount: 5,
      colorValue: 0xFF2563EB,
    ),
    SeriesPosterItem(
      title: 'Lendas do Asfalto',
      subtitle: 'Acao',
      seasonCount: 1,
      colorValue: 0xFFDC2626,
    ),
    SeriesPosterItem(
      title: 'Codigo das Sombras',
      subtitle: 'Drama policial',
      seasonCount: 2,
      colorValue: 0xFF0F766E,
    ),
    SeriesPosterItem(
      title: 'Rota 88',
      subtitle: 'Road thriller',
      seasonCount: 1,
      colorValue: 0xFF7C2D12,
    ),
    SeriesPosterItem(
      title: 'Entre Mundos',
      subtitle: 'Fantasia',
      seasonCount: 3,
      colorValue: 0xFF6D28D9,
    ),
    SeriesPosterItem(
      title: 'Vortex Temporal',
      subtitle: 'Sci-fi',
      seasonCount: 4,
      colorValue: 0xFF15803D,
    ),
    SeriesPosterItem(
      title: 'Sombra Lunar',
      subtitle: 'Terror',
      seasonCount: 2,
      colorValue: 0xFF4B5563,
    ),
  ],
);
