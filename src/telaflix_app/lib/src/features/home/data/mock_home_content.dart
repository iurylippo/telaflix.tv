import '../domain/home_content.dart';

const mockHomeContent = HomeContent(
  greeting: 'Boa noite, Iury',
  hero: HeroBannerContent(
    eyebrow: 'ESTREIA DA SEMANA',
    title: 'Amanhecer Vermelho',
    description:
        'Uma saga sci-fi sobre sobrevivencia, lealdade e revolucao em uma colonia marciana dividida por castas.',
    metadata: '2026  |  Ficcao cientifica  |  2h 08min',
    primaryActionLabel: 'Assistir agora',
    secondaryActionLabel: 'Minha lista',
  ),
  continueWatching: [
    ContinueWatchingItem(
      title: 'Horizonte Final',
      subtitle: 'T1:E05  |  O chamado',
      progress: 0.72,
      durationLabel: '28 min restantes',
      colorValue: 0xFF7C3AED,
    ),
    ContinueWatchingItem(
      title: 'Amanhecer Vermelho',
      subtitle: 'Filme  |  Reproduzindo',
      progress: 0.34,
      durationLabel: '1h 22min restantes',
      colorValue: 0xFFF36E21,
    ),
  ],
  sections: [
    PosterSection(
      title: 'Filmes em destaque',
      subtitle: 'Titulos em alta nesta semana',
      items: [
        PosterCardContent(
          title: 'Distrito Neon',
          subtitle: 'Suspense',
          badge: 'Novo',
          colorValue: 0xFF2563EB,
        ),
        PosterCardContent(
          title: 'Amanhecer Vermelho',
          subtitle: 'Ficcao cientifica',
          badge: 'Top 10',
          colorValue: 0xFFEA580C,
        ),
        PosterCardContent(
          title: 'Lendas do Asfalto',
          subtitle: 'Acao',
          badge: 'HD',
          colorValue: 0xFFDC2626,
        ),
      ],
    ),
    PosterSection(
      title: 'Series para maratonar',
      subtitle: 'Episodios novos liberados hoje',
      items: [
        PosterCardContent(
          title: 'Codigo das Sombras',
          subtitle: 'Drama policial',
          badge: '4K',
          colorValue: 0xFF0F766E,
        ),
        PosterCardContent(
          title: 'Rota 88',
          subtitle: 'Road thriller',
          badge: 'Novo',
          colorValue: 0xFF7C2D12,
        ),
        PosterCardContent(
          title: 'Entre Mundos',
          subtitle: 'Fantasia',
          badge: 'Top 10',
          colorValue: 0xFF6D28D9,
        ),
      ],
    ),
  ],
  liveChannels: [
    LiveChannelContent(
      name: 'Telaflix One',
      program: 'Ao vivo agora',
      tag: 'Cinema e series',
      colorValue: 0xFFEF4444,
    ),
    LiveChannelContent(
      name: 'Action Max',
      program: 'Maratona de acao',
      tag: 'Canal 12',
      colorValue: 0xFF3B82F6,
    ),
    LiveChannelContent(
      name: 'Kids Club',
      program: 'Desenhos sem intervalo',
      tag: 'Canal 18',
      colorValue: 0xFFF59E0B,
    ),
  ],
);
