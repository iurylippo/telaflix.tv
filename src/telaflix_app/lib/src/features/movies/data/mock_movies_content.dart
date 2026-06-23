import '../domain/movies_content.dart';

const mockMoviesContent = MoviesContent(
  featured: [
    FeaturedMovieItem(
      id: 'amanhecer-vermelho',
      title: 'Amanhecer Vermelho',
      subtitle: 'Acao',
      metadata: '2026  |  2h 22min  |  16+',
      colorValue: 0xFFDC2626,
    ),
    FeaturedMovieItem(
      id: 'cidade-dourada',
      title: 'Cidade Dourada',
      subtitle: 'Drama',
      metadata: '2025  |  1h 58min  |  14+',
      colorValue: 0xFFB45309,
    ),
    FeaturedMovieItem(
      id: 'oceano-profundo',
      title: 'Oceano Profundo',
      subtitle: 'Suspense',
      metadata: '2026  |  2h 05min  |  18+',
      colorValue: 0xFF2563EB,
    ),
  ],
  categories: [
    MovieCategoryItem(label: 'Todos', selected: true),
    MovieCategoryItem(label: 'Em alta'),
    MovieCategoryItem(label: 'Acao'),
    MovieCategoryItem(label: 'Drama'),
    MovieCategoryItem(label: 'Comedia'),
    MovieCategoryItem(label: 'Terror'),
    MovieCategoryItem(label: 'Sci-fi'),
  ],
  posters: [
    MoviePosterItem(
      id: 'ultimo-refugio',
      title: 'Ultimo Refugio',
      subtitle: 'Ficcao cientifica',
      duration: '2h 18min',
      colorValue: 0xFF7C3AED,
    ),
    MoviePosterItem(
      id: 'noite-fechada',
      title: 'Noite Fechada',
      subtitle: 'Terror',
      duration: '1h 34min',
      colorValue: 0xFF4B5563,
    ),
    MoviePosterItem(
      id: 'dupla-explosiva',
      title: 'Dupla Explosiva',
      subtitle: 'Acao e Comedia',
      duration: '1h 52min',
      colorValue: 0xFFEA580C,
    ),
    MoviePosterItem(
      id: 'memorias-do-vento',
      title: 'Memorias do Vento',
      subtitle: 'Drama',
      duration: '2h 10min',
      colorValue: 0xFF15803D,
    ),
    MoviePosterItem(
      id: 'amanhecer-vermelho',
      title: 'Amanhecer Vermelho',
      subtitle: 'Acao',
      duration: '2h 22min',
      colorValue: 0xFFDC2626,
    ),
    MoviePosterItem(
      id: 'cidade-dourada',
      title: 'Cidade Dourada',
      subtitle: 'Drama',
      duration: '1h 58min',
      colorValue: 0xFFB45309,
    ),
    MoviePosterItem(
      id: 'oceano-profundo',
      title: 'Oceano Profundo',
      subtitle: 'Suspense',
      duration: '2h 05min',
      colorValue: 0xFF2563EB,
    ),
    MoviePosterItem(
      id: 'codigo-inverso',
      title: 'Codigo Inverso',
      subtitle: 'Sci-fi',
      duration: '2h 28min',
      colorValue: 0xFF0F766E,
    ),
    MoviePosterItem(
      id: 'furia-noturna',
      title: 'Furia Noturna',
      subtitle: 'Acao',
      duration: '1h 45min',
      colorValue: 0xFF7C2D12,
    ),
  ],
);

const mockMoviesDetails = <String, MovieDetailContent>{
  'amanhecer-vermelho': MovieDetailContent(
    id: 'amanhecer-vermelho',
    title: 'Amanhecer Vermelho',
    subtitle: 'Acao',
    year: 2026,
    ageRating: '16+',
    synopsis:
        'Em um futuro distópico, um ex-agente das forças especiais '
        'precisa liderar um grupo de resistência contra um regime '
        'totalitário que domina as Américas.',
    durationMinutes: 142,
    colorValue: 0xFFDC2626,
    cast: [
      MovieCastMember(
        name: 'Rodrigo Santoro',
        role: 'Capitao Torres',
        avatarColorValue: 0xFFDC2626,
      ),
      MovieCastMember(
        name: 'Alice Braga',
        role: 'Dra. Mariana',
        avatarColorValue: 0xFFB45309,
      ),
      MovieCastMember(
        name: 'Wagner Moura',
        role: 'General Vargas',
        avatarColorValue: 0xFF4B5563,
      ),
      MovieCastMember(
        name: 'Seu Jorge',
        role: 'Sargento Lima',
        avatarColorValue: 0xFF15803D,
      ),
      MovieCastMember(
        name: 'Fernanda Montenegro',
        role: 'Conselheira Helena',
        avatarColorValue: 0xFF7C3AED,
      ),
    ],
    related: [
      RelatedMovieItem(title: 'Furia Noturna', colorValue: 0xFF7C2D12),
      RelatedMovieItem(title: 'Dupla Explosiva', colorValue: 0xFFEA580C),
      RelatedMovieItem(title: 'Codigo Inverso', colorValue: 0xFF0F766E),
      RelatedMovieItem(title: 'Ultimo Refugio', colorValue: 0xFF7C3AED),
    ],
  ),
  'cidade-dourada': MovieDetailContent(
    id: 'cidade-dourada',
    title: 'Cidade Dourada',
    subtitle: 'Drama',
    year: 2025,
    ageRating: '14+',
    synopsis:
        'Uma jovem fotógrafa retorna à sua cidade natal no interior '
        'de Minas Gerais e descobre segredos familiares que mudam '
        'tudo o que ela sabia sobre sua própria história.',
    durationMinutes: 118,
    colorValue: 0xFFB45309,
    cast: [
      MovieCastMember(
        name: 'Bruna Marquezine',
        role: 'Clara',
        avatarColorValue: 0xFFB45309,
      ),
      MovieCastMember(
        name: 'Tony Ramos',
        role: 'Seu Antonio',
        avatarColorValue: 0xFF4B5563,
      ),
      MovieCastMember(
        name: 'Marjorie Estiano',
        role: 'Tia Rosa',
        avatarColorValue: 0xFF7C3AED,
      ),
      MovieCastMember(
        name: 'Selton Mello',
        role: 'Padre Miguel',
        avatarColorValue: 0xFF2563EB,
      ),
    ],
    related: [
      RelatedMovieItem(title: 'Memorias do Vento', colorValue: 0xFF15803D),
      RelatedMovieItem(title: 'Amanhecer Vermelho', colorValue: 0xFFDC2626),
      RelatedMovieItem(title: 'Noite Fechada', colorValue: 0xFF4B5563),
    ],
  ),
  'oceano-profundo': MovieDetailContent(
    id: 'oceano-profundo',
    title: 'Oceano Profundo',
    subtitle: 'Suspense',
    year: 2026,
    ageRating: '18+',
    synopsis:
        'Uma equipe de mergulhadores encontra destroços de um navio '
        'que nunca foi registrado. O que começa como uma descoberta '
        'arqueológica se transforma em uma luta desesperada pela '
        'sobrevivência nas profundezas.',
    durationMinutes: 125,
    colorValue: 0xFF2563EB,
    cast: [
      MovieCastMember(
        name: 'Caua Reymond',
        role: 'Leo',
        avatarColorValue: 0xFF2563EB,
      ),
      MovieCastMember(
        name: 'Isis Valverde',
        role: 'Marina',
        avatarColorValue: 0xFFEA580C,
      ),
      MovieCastMember(
        name: 'Antonio Fagundes',
        role: 'Dr. Freitas',
        avatarColorValue: 0xFF4B5563,
      ),
      MovieCastMember(
        name: 'Taina Muller',
        role: 'Bia',
        avatarColorValue: 0xFF7C3AED,
      ),
    ],
    related: [
      RelatedMovieItem(title: 'Ultimo Refugio', colorValue: 0xFF7C3AED),
      RelatedMovieItem(title: 'Codigo Inverso', colorValue: 0xFF0F766E),
      RelatedMovieItem(title: 'Noite Fechada', colorValue: 0xFF4B5563),
      RelatedMovieItem(title: 'Amanhecer Vermelho', colorValue: 0xFFDC2626),
    ],
  ),
  'ultimo-refugio': MovieDetailContent(
    id: 'ultimo-refugio',
    title: 'Ultimo Refugio',
    subtitle: 'Ficcao cientifica',
    year: 2025,
    ageRating: '14+',
    synopsis:
        'Em 2087, a Terra se tornou inóspita. Um grupo de colonos '
        'embarca na última nave rumo a Kepler-442b, mas a jornada '
        'revela que o maior perigo não está lá fora.',
    durationMinutes: 138,
    colorValue: 0xFF7C3AED,
    cast: [
      MovieCastMember(
        name: 'Wagner Moura',
        role: 'Capitao Torres',
        avatarColorValue: 0xFF7C3AED,
      ),
      MovieCastMember(
        name: 'Taís Araujo',
        role: 'Eng. Ester',
        avatarColorValue: 0xFFDC2626,
      ),
      MovieCastMember(
        name: 'Lazaro Ramos',
        role: 'Dr. Otavio',
        avatarColorValue: 0xFF15803D,
      ),
    ],
    related: [
      RelatedMovieItem(title: 'Codigo Inverso', colorValue: 0xFF0F766E),
      RelatedMovieItem(title: 'Oceano Profundo', colorValue: 0xFF2563EB),
      RelatedMovieItem(title: 'Amanhecer Vermelho', colorValue: 0xFFDC2626),
    ],
  ),
  'noite-fechada': MovieDetailContent(
    id: 'noite-fechada',
    title: 'Noite Fechada',
    subtitle: 'Terror',
    year: 2024,
    ageRating: '18+',
    synopsis:
        'Três amigos decidem passar o fim de semana em uma cabana '
        'isolada na serra. Quando a noite cai, eles percebem que '
        'não estão sozinhos — e que algo os observa da floresta.',
    durationMinutes: 94,
    colorValue: 0xFF4B5563,
    cast: [
      MovieCastMember(
        name: 'Klara Castanho',
        role: 'Lia',
        avatarColorValue: 0xFF4B5563,
      ),
      MovieCastMember(
        name: 'Jose Loreto',
        role: 'Gustavo',
        avatarColorValue: 0xFF7C2D12,
      ),
      MovieCastMember(
        name: 'Debora Falabella',
        role: 'Cris',
        avatarColorValue: 0xFF7C3AED,
      ),
    ],
    related: [
      RelatedMovieItem(title: 'Oceano Profundo', colorValue: 0xFF2563EB),
      RelatedMovieItem(title: 'Furia Noturna', colorValue: 0xFF7C2D12),
      RelatedMovieItem(title: 'Cidade Dourada', colorValue: 0xFFB45309),
    ],
  ),
  'dupla-explosiva': MovieDetailContent(
    id: 'dupla-explosiva',
    title: 'Dupla Explosiva',
    subtitle: 'Acao e Comedia',
    year: 2026,
    ageRating: '14+',
    synopsis:
        'Um policial certinho e um detetive caótico são forçados '
        'a trabalhar juntos para desmantelar uma rede internacional '
        'de contrabando. O que poderia dar errado?',
    durationMinutes: 112,
    colorValue: 0xFFEA580C,
    cast: [
      MovieCastMember(
        name: 'Fabio Porchat',
        role: 'Detetive Russo',
        avatarColorValue: 0xFFEA580C,
      ),
      MovieCastMember(
        name: 'Marcelo Serrado',
        role: 'Policial Neves',
        avatarColorValue: 0xFF2563EB,
      ),
      MovieCastMember(
        name: 'Paolla Oliveira',
        role: 'Agente Lara',
        avatarColorValue: 0xFFDC2626,
      ),
      MovieCastMember(
        name: 'Milhem Cortaz',
        role: 'Chefe Andrade',
        avatarColorValue: 0xFF4B5563,
      ),
    ],
    related: [
      RelatedMovieItem(title: 'Amanhecer Vermelho', colorValue: 0xFFDC2626),
      RelatedMovieItem(title: 'Furia Noturna', colorValue: 0xFF7C2D12),
      RelatedMovieItem(title: 'Codigo Inverso', colorValue: 0xFF0F766E),
    ],
  ),
  'memorias-do-vento': MovieDetailContent(
    id: 'memorias-do-vento',
    title: 'Memorias do Vento',
    subtitle: 'Drama',
    year: 2025,
    ageRating: '12+',
    synopsis:
        'Um avô e seu neto atravessam o sertão nordestino em uma '
        'jornada de redescoberta musical. Cada parada revela uma '
        'história e uma canção esquecida pelo tempo.',
    durationMinutes: 130,
    colorValue: 0xFF15803D,
    cast: [
      MovieCastMember(
        name: 'Antonio Fagundes',
        role: 'Seu Dito',
        avatarColorValue: 0xFF15803D,
      ),
      MovieCastMember(
        name: 'Chay Suede',
        role: 'Lucas',
        avatarColorValue: 0xFFEA580C,
      ),
      MovieCastMember(
        name: 'Camila Morgado',
        role: 'Dona Lurdes',
        avatarColorValue: 0xFF7C3AED,
      ),
    ],
    related: [
      RelatedMovieItem(title: 'Cidade Dourada', colorValue: 0xFFB45309),
      RelatedMovieItem(title: 'Amanhecer Vermelho', colorValue: 0xFFDC2626),
      RelatedMovieItem(title: 'Ultimo Refugio', colorValue: 0xFF7C3AED),
    ],
  ),
  'codigo-inverso': MovieDetailContent(
    id: 'codigo-inverso',
    title: 'Codigo Inverso',
    subtitle: 'Sci-fi',
    year: 2026,
    ageRating: '14+',
    synopsis:
        'Um programador descobre que pode reverter o tempo através '
        'de linhas de código. Mas cada alteração no passado cria '
        'ramificações imprevisíveis no presente.',
    durationMinutes: 148,
    colorValue: 0xFF0F766E,
    cast: [
      MovieCastMember(
        name: 'Selton Mello',
        role: 'Rafael',
        avatarColorValue: 0xFF0F766E,
      ),
      MovieCastMember(
        name: 'Marina Ruy Barbosa',
        role: 'Alice',
        avatarColorValue: 0xFFEA580C,
      ),
      MovieCastMember(
        name: 'Rodrigo Santoro',
        role: 'CEO Nexus',
        avatarColorValue: 0xFF4B5563,
      ),
    ],
    related: [
      RelatedMovieItem(title: 'Ultimo Refugio', colorValue: 0xFF7C3AED),
      RelatedMovieItem(title: 'Amanhecer Vermelho', colorValue: 0xFFDC2626),
      RelatedMovieItem(title: 'Oceano Profundo', colorValue: 0xFF2563EB),
    ],
  ),
  'furia-noturna': MovieDetailContent(
    id: 'furia-noturna',
    title: 'Furia Noturna',
    subtitle: 'Acao',
    year: 2024,
    ageRating: '18+',
    synopsis:
        'Um motorista de fuga tenta deixar o crime para trás, '
        'mas quando seu irmão é sequestrado, ele precisa participar '
        'de uma última corrida — onde o prêmio é a vida.',
    durationMinutes: 105,
    colorValue: 0xFF7C2D12,
    cast: [
      MovieCastMember(
        name: 'Caua Reymond',
        role: 'Rick',
        avatarColorValue: 0xFF7C2D12,
      ),
      MovieCastMember(
        name: 'Alice Braga',
        role: 'Detetive Sara',
        avatarColorValue: 0xFFDC2626,
      ),
      MovieCastMember(
        name: 'Milhem Cortaz',
        role: 'Pablo',
        avatarColorValue: 0xFF4B5563,
      ),
    ],
    related: [
      RelatedMovieItem(title: 'Amanhecer Vermelho', colorValue: 0xFFDC2626),
      RelatedMovieItem(title: 'Dupla Explosiva', colorValue: 0xFFEA580C),
      RelatedMovieItem(title: 'Noite Fechada', colorValue: 0xFF4B5563),
    ],
  ),
};
