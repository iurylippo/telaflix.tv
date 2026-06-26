import '../domain/live_tv_content.dart';

const _sampleStreamUrl =
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

const mockLiveTvContent = LiveTvContent(
  featured: [
    FeaturedLiveTvItem(
      id: 'globo',
      title: 'Globo',
      subtitle: 'Novela das 9',
      metadata: 'Agora  |  Novela  |  Ao vivo',
      colorValue: 0xFF2563EB,
    ),
    FeaturedLiveTvItem(
      id: 'espn',
      title: 'ESPN Brasil',
      subtitle: 'Brasileirao Serie A',
      metadata: 'Agora  |  Esporte  |  Ao vivo',
      colorValue: 0xFFDC2626,
    ),
    FeaturedLiveTvItem(
      id: 'telecine-premium',
      title: 'Telecine Premium',
      subtitle: 'O Poderoso Chefao',
      metadata: 'Agora  |  Filme  |  Ao vivo',
      colorValue: 0xFFB45309,
    ),
  ],
  categories: [
    LiveTvCategoryItem(label: 'Todos', selected: true),
    LiveTvCategoryItem(label: 'Abertos'),
    LiveTvCategoryItem(label: 'Filmes'),
    LiveTvCategoryItem(label: 'Esportes'),
    LiveTvCategoryItem(label: 'Noticias'),
    LiveTvCategoryItem(label: 'Kids'),
  ],
  channels: [
    LiveTvChannelItem(
      id: 'globo',
      name: 'Globo',
      currentProgram: 'Renascer',
      category: 'Novela',
      colorValue: 0xFF2563EB,
    ),
    LiveTvChannelItem(
      id: 'sbt',
      name: 'SBT',
      currentProgram: 'Programa Silvio Santos',
      category: 'Entretenimento',
      colorValue: 0xFF7C3AED,
    ),
    LiveTvChannelItem(
      id: 'record',
      name: 'Record',
      currentProgram: 'Jornal da Record',
      category: 'Noticia',
      colorValue: 0xFF15803D,
    ),
    LiveTvChannelItem(
      id: 'band',
      name: 'Band',
      currentProgram: 'Jogo Aberto',
      category: 'Esporte',
      colorValue: 0xFFEA580C,
    ),
    LiveTvChannelItem(
      id: 'espn',
      name: 'ESPN Brasil',
      currentProgram: 'SportsCenter',
      category: 'Esporte',
      colorValue: 0xFFDC2626,
    ),
    LiveTvChannelItem(
      id: 'telecine-premium',
      name: 'Telecine Premium',
      currentProgram: 'Interestelar',
      category: 'Filme',
      colorValue: 0xFFB45309,
    ),
    LiveTvChannelItem(
      id: 'cartoon',
      name: 'Cartoon Network',
      currentProgram: 'Hora de Aventura',
      category: 'Kids',
      colorValue: 0xFF0F766E,
    ),
    LiveTvChannelItem(
      id: 'discovery',
      name: 'Discovery',
      currentProgram: 'Largados e Pelados',
      category: 'Reality',
      colorValue: 0xFF7C2D12,
    ),
    LiveTvChannelItem(
      id: 'megapix',
      name: 'Megapix',
      currentProgram: 'Velozes e Furiosos 8',
      category: 'Filme',
      colorValue: 0xFF4B5563,
    ),
    LiveTvChannelItem(
      id: 'gnt',
      name: 'GNT',
      currentProgram: 'Saia Justa',
      category: 'Talk Show',
      colorValue: 0xFFEA580C,
    ),
  ],
);

const mockLiveTvDetails = <String, LiveTvChannelDetail>{
  'globo': LiveTvChannelDetail(
    id: 'globo',
    name: 'Globo',
    streamUrl: _sampleStreamUrl,
    currentProgram: 'Renascer',
    category: 'Novela',
    description:
        'A novela das 9 que esta conquistando o Brasil. Acompanhe as tramas '
        'emocionantes com grandes atuacoes e producao de qualidade.',
    colorValue: 0xFF2563EB,
    schedule: [
      LiveTvProgramItem(
        startTime: '21:00',
        endTime: '22:00',
        title: 'Renascer',
        description: 'Capitulo de hoje: reviravolta na fazenda.',
        isCurrent: true,
      ),
      LiveTvProgramItem(
        startTime: '22:00',
        endTime: '23:00',
        title: 'Jornal Nacional',
        description: 'As principais noticias do Brasil e do mundo.',
      ),
      LiveTvProgramItem(
        startTime: '23:00',
        endTime: '00:00',
        title: 'BBB 25',
        description: 'Acompanhe o reality show mais famoso do pais.',
      ),
      LiveTvProgramItem(
        startTime: '00:00',
        endTime: '01:00',
        title: 'Programa do Jo',
        description: 'Entrevistas e musica ao vivo.',
      ),
    ],
  ),
  'sbt': LiveTvChannelDetail(
    id: 'sbt',
    name: 'SBT',
    streamUrl: _sampleStreamUrl,
    currentProgram: 'Programa Silvio Santos',
    category: 'Entretenimento',
    description:
        'O classico programa de auditorio que marcou geracoes. Diversao para '
        'toda a familia com quadros inesqueciveis.',
    colorValue: 0xFF7C3AED,
    schedule: [
      LiveTvProgramItem(
        startTime: '20:00',
        endTime: '22:00',
        title: 'Programa Silvio Santos',
        description: 'Quadros classicos e muitas risadas.',
        isCurrent: true,
      ),
      LiveTvProgramItem(
        startTime: '22:00',
        endTime: '23:00',
        title: 'The Noite',
        description: 'Talk show com Danilo Gentili.',
      ),
      LiveTvProgramItem(
        startTime: '23:00',
        endTime: '00:30',
        title: 'Operacao Mesquita',
        description: 'Humor e entrevistas.',
      ),
    ],
  ),
  'record': LiveTvChannelDetail(
    id: 'record',
    name: 'Record',
    streamUrl: _sampleStreamUrl,
    currentProgram: 'Jornal da Record',
    category: 'Noticia',
    description:
        'Jornalismo independente com cobertura completa dos principais '
        'acontecimentos do Brasil e do mundo.',
    colorValue: 0xFF15803D,
    schedule: [
      LiveTvProgramItem(
        startTime: '19:00',
        endTime: '20:00',
        title: 'Jornal da Record',
        description: 'As principais noticias do dia.',
        isCurrent: true,
      ),
      LiveTvProgramItem(
        startTime: '20:00',
        endTime: '21:00',
        title: 'A Fazenda',
        description: 'Realidade rural com famosos.',
      ),
      LiveTvProgramItem(
        startTime: '21:00',
        endTime: '22:00',
        title: 'Top Chef Brasil',
        description: 'Competicao culinaria de alto nivel.',
      ),
    ],
  ),
  'band': LiveTvChannelDetail(
    id: 'band',
    name: 'Band',
    streamUrl: _sampleStreamUrl,
    currentProgram: 'Jogo Aberto',
    category: 'Esporte',
    description:
        'Cobertura esportiva completa com debates, noticias e transmissoes '
        'ao vivo dos principais campeonatos.',
    colorValue: 0xFFEA580C,
    schedule: [
      LiveTvProgramItem(
        startTime: '14:00',
        endTime: '15:30',
        title: 'Jogo Aberto',
        description: 'Debate esportivo com os principais contratados.',
        isCurrent: true,
      ),
      LiveTvProgramItem(
        startTime: '15:30',
        endTime: '17:00',
        title: 'Os Donos da Bola',
        description: 'Mais debate e noticias do esporte.',
      ),
      LiveTvProgramItem(
        startTime: '17:00',
        endTime: '18:00',
        title: 'Brasil Urgente',
        description: 'Jornalismo policial e comunitario.',
      ),
    ],
  ),
  'espn': LiveTvChannelDetail(
    id: 'espn',
    name: 'ESPN Brasil',
    streamUrl: _sampleStreamUrl,
    currentProgram: 'SportsCenter',
    category: 'Esporte',
    description:
        'O canal lider mundial em esportes. Noticias, analises e transmissoes '
        'ao vivo dos maiores eventos esportivos do planeta.',
    colorValue: 0xFFDC2626,
    schedule: [
      LiveTvProgramItem(
        startTime: '20:00',
        endTime: '21:30',
        title: 'SportsCenter',
        description: 'As principais noticias e analises do esporte mundial.',
        isCurrent: true,
      ),
      LiveTvProgramItem(
        startTime: '21:30',
        endTime: '23:00',
        title: 'Futebol Ao Vivo',
        description: 'Brasileirao Serie A: transmissao da rodada.',
      ),
      LiveTvProgramItem(
        startTime: '23:00',
        endTime: '00:00',
        title: 'ESPN FC',
        description: 'Debate sobre futebol internacional.',
      ),
      LiveTvProgramItem(
        startTime: '00:00',
        endTime: '01:00',
        title: 'NBA Action',
        description: 'Melhores momentos da NBA.',
      ),
    ],
  ),
  'telecine-premium': LiveTvChannelDetail(
    id: 'telecine-premium',
    name: 'Telecine Premium',
    streamUrl: _sampleStreamUrl,
    currentProgram: 'Interestelar',
    category: 'Filme',
    description:
        'O melhor do cinema direto na sua tela. Telecine Premium traz os '
        'maiores lancamentos e classicos do cinema mundial.',
    colorValue: 0xFFB45309,
    schedule: [
      LiveTvProgramItem(
        startTime: '20:00',
        endTime: '23:00',
        title: 'Interestelar',
        description:
            'Astronautas viajam atraves de um buraco de minhoca em busca '
            'de um novo lar para a humanidade.',
        isCurrent: true,
      ),
      LiveTvProgramItem(
        startTime: '23:00',
        endTime: '01:30',
        title: 'Duna',
        description: 'A jornada de Paul Atreides no planeta Arrakis.',
      ),
      LiveTvProgramItem(
        startTime: '01:30',
        endTime: '03:30',
        title: 'Mad Max: Estrada da Furia',
        description: 'Acao frenetica em um mundo pos-apocaliptico.',
      ),
    ],
  ),
  'cartoon': LiveTvChannelDetail(
    id: 'cartoon',
    name: 'Cartoon Network',
    streamUrl: _sampleStreamUrl,
    currentProgram: 'Hora de Aventura',
    category: 'Kids',
    description:
        'Diversao garantida com as melhores animacoes. Aventura, humor e '
        'muita acao para a garotada.',
    colorValue: 0xFF0F766E,
    schedule: [
      LiveTvProgramItem(
        startTime: '15:00',
        endTime: '16:00',
        title: 'Hora de Aventura',
        description: 'Finn e Jake em mais uma aventura epica.',
        isCurrent: true,
      ),
      LiveTvProgramItem(
        startTime: '16:00',
        endTime: '17:00',
        title: 'Apenas um Show',
        description: 'As loucuras de Mordecai e Rigby.',
      ),
      LiveTvProgramItem(
        startTime: '17:00',
        endTime: '18:00',
        title: 'Steven Universo',
        description: 'As Crystal Gems protegem a Terra.',
      ),
    ],
  ),
  'discovery': LiveTvChannelDetail(
    id: 'discovery',
    name: 'Discovery',
    streamUrl: _sampleStreamUrl,
    currentProgram: 'Largados e Pelados',
    category: 'Reality',
    description:
        'Explore o mundo com documentarios e realities imperdiveis. Natureza, '
        'ciencia, tecnologia e muito mais.',
    colorValue: 0xFF7C2D12,
    schedule: [
      LiveTvProgramItem(
        startTime: '21:00',
        endTime: '22:30',
        title: 'Largados e Pelados',
        description: 'Sobrevivencia extrema em locais remotos.',
        isCurrent: true,
      ),
      LiveTvProgramItem(
        startTime: '22:30',
        endTime: '23:30',
        title: 'Aeroesportes',
        description: 'Documentario sobre esportes radicais aereos.',
      ),
      LiveTvProgramItem(
        startTime: '23:30',
        endTime: '00:30',
        title: 'Mistérios do Oceano',
        description: 'Exploracao das profundezas marinhas.',
      ),
    ],
  ),
  'megapix': LiveTvChannelDetail(
    id: 'megapix',
    name: 'Megapix',
    streamUrl: _sampleStreamUrl,
    currentProgram: 'Velozes e Furiosos 8',
    category: 'Filme',
    description:
        'Filmes de acao, aventura e muita emocao. O melhor do cinema de '
        'entretenimento para toda a familia.',
    colorValue: 0xFF4B5563,
    schedule: [
      LiveTvProgramItem(
        startTime: '19:00',
        endTime: '21:30',
        title: 'Velozes e Furiosos 8',
        description: 'Dominic Toretto enfrenta uma nova ameaca.',
        isCurrent: true,
      ),
      LiveTvProgramItem(
        startTime: '21:30',
        endTime: '23:30',
        title: 'Transformers: O Ultimo Cavaleiro',
        description: 'A batalha final entre Autobots e Decepticons.',
      ),
      LiveTvProgramItem(
        startTime: '23:30',
        endTime: '01:30',
        title: 'John Wick 3: Parabellum',
        description: 'John Wick enfrenta assassinos do mundo todo.',
      ),
    ],
  ),
  'gnt': LiveTvChannelDetail(
    id: 'gnt',
    name: 'GNT',
    streamUrl: _sampleStreamUrl,
    currentProgram: 'Saia Justa',
    category: 'Talk Show',
    description:
        'Programacao inteligente e sofisticada. Talk shows, series e '
        'documentarios que inspiram e emocionam.',
    colorValue: 0xFFEA580C,
    schedule: [
      LiveTvProgramItem(
        startTime: '22:00',
        endTime: '23:00',
        title: 'Saia Justa',
        description: 'Debate feminino sobre temas atuais.',
        isCurrent: true,
      ),
      LiveTvProgramItem(
        startTime: '23:00',
        endTime: '00:00',
        title: 'Papo de Segunda',
        description: 'Conversas sobre comportamento e sociedade.',
      ),
      LiveTvProgramItem(
        startTime: '00:00',
        endTime: '01:00',
        title: 'Que Historia e Essa?',
        description: 'Historias reais contadas pelos protagonistas.',
      ),
    ],
  ),
};
