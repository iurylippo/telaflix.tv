import '../domain/series_content.dart';

const mockSeriesContent = SeriesContent(
  featured: [
    FeaturedSeriesItem(
      id: 'codigo-das-sombras',
      title: 'Codigo das Sombras',
      subtitle: 'Drama policial',
      metadata: '2026  |  2 temporadas  |  16+',
      colorValue: 0xFF0F766E,
    ),
    FeaturedSeriesItem(
      id: 'rota-88',
      title: 'Rota 88',
      subtitle: 'Road thriller',
      metadata: '2025  |  1 temporada  |  18+',
      colorValue: 0xFF7C2D12,
    ),
    FeaturedSeriesItem(
      id: 'entre-mundos',
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
      id: 'horizonte-final',
      title: 'Horizonte Final',
      subtitle: 'Ficcao cientifica',
      seasonCount: 3,
      colorValue: 0xFF7C3AED,
    ),
    SeriesPosterItem(
      id: 'amanhecer-carmesim',
      title: 'Amanhecer Carmesim',
      subtitle: 'Drama',
      seasonCount: 2,
      colorValue: 0xFFEA580C,
    ),
    SeriesPosterItem(
      id: 'distrito-neon',
      title: 'Distrito Neon',
      subtitle: 'Suspense',
      seasonCount: 5,
      colorValue: 0xFF2563EB,
    ),
    SeriesPosterItem(
      id: 'lendas-do-asfalto',
      title: 'Lendas do Asfalto',
      subtitle: 'Acao',
      seasonCount: 1,
      colorValue: 0xFFDC2626,
    ),
    SeriesPosterItem(
      id: 'codigo-das-sombras',
      title: 'Codigo das Sombras',
      subtitle: 'Drama policial',
      seasonCount: 2,
      colorValue: 0xFF0F766E,
    ),
    SeriesPosterItem(
      id: 'rota-88',
      title: 'Rota 88',
      subtitle: 'Road thriller',
      seasonCount: 1,
      colorValue: 0xFF7C2D12,
    ),
    SeriesPosterItem(
      id: 'entre-mundos',
      title: 'Entre Mundos',
      subtitle: 'Fantasia',
      seasonCount: 3,
      colorValue: 0xFF6D28D9,
    ),
    SeriesPosterItem(
      id: 'vortex-temporal',
      title: 'Vortex Temporal',
      subtitle: 'Sci-fi',
      seasonCount: 4,
      colorValue: 0xFF15803D,
    ),
    SeriesPosterItem(
      id: 'sombra-lunar',
      title: 'Sombra Lunar',
      subtitle: 'Terror',
      seasonCount: 2,
      colorValue: 0xFF4B5563,
    ),
  ],
);

const mockSeriesDetails = <String, SeriesDetailContent>{
  'codigo-das-sombras': SeriesDetailContent(
    id: 'codigo-das-sombras',
    title: 'Codigo das Sombras',
    subtitle: 'Drama policial',
    year: 2026,
    ageRating: '16+',
    synopsis:
        'Em uma cidade onde cada caso revela um segredo obscuro, '
        'o detetive Andre Vargas enfrenta uma rede de corrupcao que '
        'ameaca tudo o que ele jurou proteger. Cada pista o leva mais '
        'fundo nas sombras — mas a verdade pode custar sua alma.',
    colorValue: 0xFF0F766E,
    seasons: [
      SeriesSeason(
        number: 1,
        title: 'Temporada 1',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'O Primeiro Caso',
            duration: '52 min',
            description:
                'Andre Vargas assume o caso de um desaparecimento que '
                'parecia simples, mas logo se revela o inicio de uma '
                'conspiracao que abala toda a delegacia.',
            thumbnailColorValue: 0xFF134E4A,
            progress: 1.0,
          ),
          SeriesEpisode(
            number: 2,
            title: 'Pistas na Escuridao',
            duration: '48 min',
            description:
                'Uma testemunha relutante entrega a Andre a primeira '
                'conexao entre o desaparecimento e a elite politica da '
                'cidade.',
            thumbnailColorValue: 0xFF115959,
            progress: 1.0,
          ),
          SeriesEpisode(
            number: 3,
            title: 'Lealdade Quebrada',
            duration: '55 min',
            description:
                'Um aliado dentro da corporacao se volta contra Andre, '
                'forcando-o a decidir entre seguir o protocolo ou '
                'confiar nos seus instintos.',
            thumbnailColorValue: 0xFF0E6363,
            progress: 0.0,
          ),
          SeriesEpisode(
            number: 4,
            title: 'O Silencio dos Culpados',
            duration: '50 min',
            description:
                'Andre finalmente consegue interrogar o principal '
                'suspeito, mas descobre que o verdadeiro perigo esta '
                'mais perto do que ele imaginava.',
            thumbnailColorValue: 0xFF0D6E6E,
            progress: 0.0,
          ),
        ],
      ),
      SeriesSeason(
        number: 2,
        title: 'Temporada 2',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'Rastros do Passado',
            duration: '54 min',
            description:
                'Apos os eventos da temporada anterior, Andre investiga '
                'um assassinato que reabre feridas antigas e ligacoes com '
                'o crime organizado.',
            thumbnailColorValue: 0xFF0A4A4A,
            progress: 0.65,
          ),
          SeriesEpisode(
            number: 2,
            title: 'Testemunha Protegida',
            duration: '49 min',
            description:
                'A unica testemunha de um homicidio aceita colaborar, '
                'mas apenas se Andre garantir protecao total para sua '
                'familia.',
            thumbnailColorValue: 0xFF0B5757,
            progress: 0.0,
          ),
        ],
      ),
    ],
    cast: [
      SeriesCastMember(
        name: 'Ricardo Tozzi',
        role: 'Andre Vargas',
        avatarColorValue: 0xFF0F766E,
      ),
      SeriesCastMember(
        name: 'Mariana Ximenes',
        role: 'Helena Dantas',
        avatarColorValue: 0xFFB45309,
      ),
      SeriesCastMember(
        name: 'Antonio Fagundes',
        role: 'Delegado Marques',
        avatarColorValue: 0xFF4B5563,
      ),
      SeriesCastMember(
        name: 'Alice Wegmann',
        role: 'Julia Vargas',
        avatarColorValue: 0xFF7C3AED,
      ),
      SeriesCastMember(
        name: 'Murilo Benicio',
        role: 'Conselheiro Mello',
        avatarColorValue: 0xFFDC2626,
      ),
    ],
    related: [
      RelatedSeriesItem(title: 'Distrito Neon', colorValue: 0xFF2563EB),
      RelatedSeriesItem(title: 'Rota 88', colorValue: 0xFF7C2D12),
      RelatedSeriesItem(title: 'Amanhecer Carmesim', colorValue: 0xFFEA580C),
      RelatedSeriesItem(title: 'Horizonte Final', colorValue: 0xFF7C3AED),
    ],
  ),
  'rota-88': SeriesDetailContent(
    id: 'rota-88',
    title: 'Rota 88',
    subtitle: 'Road thriller',
    year: 2025,
    ageRating: '18+',
    synopsis:
        'Oito desconhecidos embarcam em um onibus interestadual. '
        'Quando o veiculo e sequestrado em plena estrada, cada '
        'passageiro precisa decidir em quem confiar — e ate onde '
        'ir para sobreviver.',
    colorValue: 0xFF7C2D12,
    seasons: [
      SeriesSeason(
        number: 1,
        title: 'Temporada 1',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'Embarque',
            duration: '58 min',
            description:
                'O onibus parte da rodoviaria com oito passageiros. '
                'Na primeira parada, um deles nao retorna.',
            thumbnailColorValue: 0xFF6B2710,
            progress: 1.0,
          ),
          SeriesEpisode(
            number: 2,
            title: 'Desvio',
            duration: '45 min',
            description:
                'O motorista toma uma rota alternativa e os passageiros '
                'comecam a suspeitar que algo esta errado.',
            thumbnailColorValue: 0xFF5A1F0C,
            progress: 0.4,
          ),
          SeriesEpisode(
            number: 3,
            title: 'Km 88',
            duration: '52 min',
            description:
                'O onibus para no meio do nada. Os passageiros precisam '
                'se unir contra uma ameaca desconhecida.',
            thumbnailColorValue: 0xFF4A180A,
            progress: 0.0,
          ),
        ],
      ),
    ],
    cast: [
      SeriesCastMember(
        name: 'Caua Reymond',
        role: 'Lucas',
        avatarColorValue: 0xFF7C2D12,
      ),
      SeriesCastMember(
        name: 'Isis Valverde',
        role: 'Clara',
        avatarColorValue: 0xFFB45309,
      ),
      SeriesCastMember(
        name: 'Rodrigo Santoro',
        role: 'Motorista',
        avatarColorValue: 0xFF4B5563,
      ),
      SeriesCastMember(
        name: 'Debora Falabella',
        role: 'Rosa',
        avatarColorValue: 0xFF7C3AED,
      ),
    ],
    related: [
      RelatedSeriesItem(title: 'Codigo das Sombras', colorValue: 0xFF0F766E),
      RelatedSeriesItem(title: 'Lendas do Asfalto', colorValue: 0xFFDC2626),
      RelatedSeriesItem(title: 'Distrito Neon', colorValue: 0xFF2563EB),
    ],
  ),
  'entre-mundos': SeriesDetailContent(
    id: 'entre-mundos',
    title: 'Entre Mundos',
    subtitle: 'Fantasia',
    year: 2026,
    ageRating: '14+',
    synopsis:
        'Elara descobre um portal escondido no sotao de sua avo '
        'e e transportada para um reino onde magia e tecnologia '
        'se fundem. Agora ela precisa dominar seus poderes antes '
        'que a escuridao consuma os dois mundos.',
    colorValue: 0xFF6D28D9,
    seasons: [
      SeriesSeason(
        number: 1,
        title: 'Temporada 1',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'O Portal',
            duration: '60 min',
            description:
                'Elara encontra um diario antigo e um cristal pulsante '
                'que abre um portal para Alem-mundo.',
            thumbnailColorValue: 0xFF5B21B6,
            progress: 1.0,
          ),
          SeriesEpisode(
            number: 2,
            title: 'A Guilda dos Arcanos',
            duration: '50 min',
            description:
                'Elara conhece uma sociedade secreta de magos que '
                'promete ajuda-la, mas nem todos sao o que parecem.',
            thumbnailColorValue: 0xFF4C1D95,
            progress: 1.0,
          ),
        ],
      ),
      SeriesSeason(
        number: 2,
        title: 'Temporada 2',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'O Retorno',
            duration: '56 min',
            description:
                'Elara retorna a Alem-mundo e descobre que meses se '
                'passaram enquanto ela estava fora.',
            thumbnailColorValue: 0xFF3B1784,
            progress: 0.0,
          ),
        ],
      ),
      SeriesSeason(
        number: 3,
        title: 'Temporada 3',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'Alianca Improvavel',
            duration: '62 min',
            description:
                'Antigos inimigos se unem a Elara para enfrentar uma '
                'ameaca que pode destruir ambos os mundos.',
            thumbnailColorValue: 0xFF2E1065,
            progress: 0.0,
          ),
        ],
      ),
    ],
    cast: [
      SeriesCastMember(
        name: 'Bruna Marquezine',
        role: 'Elara',
        avatarColorValue: 0xFF6D28D9,
      ),
      SeriesCastMember(
        name: 'Jesuita Barbosa',
        role: 'Kael',
        avatarColorValue: 0xFF2563EB,
      ),
      SeriesCastMember(
        name: 'Fernanda Montenegro',
        role: 'Avo Cecilia',
        avatarColorValue: 0xFFB45309,
      ),
      SeriesCastMember(
        name: 'Lazaro Ramos',
        role: 'Mestre Orion',
        avatarColorValue: 0xFF15803D,
      ),
    ],
    related: [
      RelatedSeriesItem(title: 'Horizonte Final', colorValue: 0xFF7C3AED),
      RelatedSeriesItem(title: 'Vortex Temporal', colorValue: 0xFF15803D),
      RelatedSeriesItem(title: 'Sombra Lunar', colorValue: 0xFF4B5563),
    ],
  ),
  'horizonte-final': SeriesDetailContent(
    id: 'horizonte-final',
    title: 'Horizonte Final',
    subtitle: 'Ficcao cientifica',
    year: 2025,
    ageRating: '14+',
    synopsis:
        'No ano de 2157, uma nave de exploracao e a ultima '
        'esperanca da humanidade. A tripulacao precisa encontrar '
        'um novo lar antes que a Terra se torne inabitavel.',
    colorValue: 0xFF7C3AED,
    seasons: [
      SeriesSeason(
        number: 1,
        title: 'Temporada 1',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'Lancamento',
            duration: '55 min',
            description:
                'A nave Ulysses parte em direcao ao desconhecido. '
                'Seis meses depois, o primeiro sinal de esperanca.',
            thumbnailColorValue: 0xFF6D28D9,
            progress: 1.0,
          ),
          SeriesEpisode(
            number: 2,
            title: 'Sinais',
            duration: '48 min',
            description:
                'A tripulacao detecta uma anomalia que pode ser '
                'artificial — ou uma armadilha.',
            thumbnailColorValue: 0xFF5B21B6,
            progress: 0.3,
          ),
        ],
      ),
      SeriesSeason(
        number: 2,
        title: 'Temporada 2',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'Novo Mundo',
            duration: '62 min',
            description:
                'A tripulacao pousa em um planeta promissor, mas '
                'descobre que nao estao sozinhos.',
            thumbnailColorValue: 0xFF4C1D95,
            progress: 0.0,
          ),
        ],
      ),
      SeriesSeason(
        number: 3,
        title: 'Temporada 3',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'Contato',
            duration: '58 min',
            description:
                'A primeira comunicacao com uma especie alienigena '
                'muda tudo o que a humanidade sabe sobre o universo.',
            thumbnailColorValue: 0xFF3B1784,
            progress: 0.0,
          ),
        ],
      ),
    ],
    cast: [
      SeriesCastMember(
        name: 'Wagner Moura',
        role: 'Capitao Torres',
        avatarColorValue: 0xFF7C3AED,
      ),
      SeriesCastMember(
        name: 'Taís Araujo',
        role: 'Dra. Ester',
        avatarColorValue: 0xFFDC2626,
      ),
      SeriesCastMember(
        name: 'Selton Mello',
        role: 'Eng. Andrade',
        avatarColorValue: 0xFF2563EB,
      ),
    ],
    related: [
      RelatedSeriesItem(title: 'Vortex Temporal', colorValue: 0xFF15803D),
      RelatedSeriesItem(title: 'Entre Mundos', colorValue: 0xFF6D28D9),
      RelatedSeriesItem(title: 'Codigo das Sombras', colorValue: 0xFF0F766E),
    ],
  ),
  'amanhecer-carmesim': SeriesDetailContent(
    id: 'amanhecer-carmesim',
    title: 'Amanhecer Carmesim',
    subtitle: 'Drama',
    year: 2024,
    ageRating: '16+',
    synopsis:
        'Uma familia do interior lida com as consequencias de '
        'uma tragedia que expoe segredos guardados por geracoes. '
        'Entre o luto e a redencao, cada personagem encontra seu '
        'proprio caminho.',
    colorValue: 0xFFEA580C,
    seasons: [
      SeriesSeason(
        number: 1,
        title: 'Temporada 1',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'O Acidente',
            duration: '50 min',
            description:
                'Uma noite chuvosa muda o destino da familia Almeida '
                'para sempre.',
            thumbnailColorValue: 0xFFC2410C,
            progress: 1.0,
          ),
          SeriesEpisode(
            number: 2,
            title: 'Segredos de Familia',
            duration: '47 min',
            description:
                'A filha mais velha encontra cartas que revelam um '
                'passado que ninguem ousava mencionar.',
            thumbnailColorValue: 0xFF9A3412,
            progress: 0.0,
          ),
        ],
      ),
      SeriesSeason(
        number: 2,
        title: 'Temporada 2',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'Recomecar',
            duration: '53 min',
            description:
                'Um ano depois, a familia tenta se reconstruir, mas '
                'o passado insiste em bater a porta.',
            thumbnailColorValue: 0xFF7C2D12,
            progress: 0.0,
          ),
        ],
      ),
    ],
    cast: [
      SeriesCastMember(
        name: 'Marjorie Estiano',
        role: 'Helena Almeida',
        avatarColorValue: 0xFFEA580C,
      ),
      SeriesCastMember(
        name: 'Tony Ramos',
        role: 'Seu Almeida',
        avatarColorValue: 0xFF4B5563,
      ),
      SeriesCastMember(
        name: 'Camila Morgado',
        role: 'Tia Lucia',
        avatarColorValue: 0xFF7C3AED,
      ),
    ],
    related: [
      RelatedSeriesItem(title: 'Sombra Lunar', colorValue: 0xFF4B5563),
      RelatedSeriesItem(title: 'Codigo das Sombras', colorValue: 0xFF0F766E),
      RelatedSeriesItem(title: 'Rota 88', colorValue: 0xFF7C2D12),
    ],
  ),
  'distrito-neon': SeriesDetailContent(
    id: 'distrito-neon',
    title: 'Distrito Neon',
    subtitle: 'Suspense',
    year: 2026,
    ageRating: '18+',
    synopsis:
        'Em uma metropolis cyberpunk dividida entre o luxo e a '
        'miseria, um hacker descobre uma verdade que pode derrubar '
        'o sistema — mas o sistema nao vai cair sem lutar.',
    colorValue: 0xFF2563EB,
    seasons: [
      SeriesSeason(
        number: 1,
        title: 'Temporada 1',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'Acesso Negado',
            duration: '51 min',
            description:
                'Zero invade o mainframe da Nexus Corp e encontra '
                'dados que nao deveriam existir.',
            thumbnailColorValue: 0xFF1D4ED8,
            progress: 1.0,
          ),
          SeriesEpisode(
            number: 2,
            title: 'Deep Web',
            duration: '49 min',
            description:
                'Para despistar os rastreadores, Zero mergulha nas '
                'camadas mais profundas da rede.',
            thumbnailColorValue: 0xFF1E40AF,
            progress: 0.7,
          ),
        ],
      ),
    ],
    cast: [
      SeriesCastMember(
        name: 'Fabio Porchat',
        role: 'Zero',
        avatarColorValue: 0xFF2563EB,
      ),
      SeriesCastMember(
        name: 'Marina Ruy Barbosa',
        role: 'Nix',
        avatarColorValue: 0xFFEA580C,
      ),
      SeriesCastMember(
        name: 'Marcelo Serrado',
        role: 'CEO Nexus',
        avatarColorValue: 0xFF4B5563,
      ),
    ],
    related: [
      RelatedSeriesItem(title: 'Horizonte Final', colorValue: 0xFF7C3AED),
      RelatedSeriesItem(title: 'Vortex Temporal', colorValue: 0xFF15803D),
      RelatedSeriesItem(title: 'Rota 88', colorValue: 0xFF7C2D12),
    ],
  ),
  'lendas-do-asfalto': SeriesDetailContent(
    id: 'lendas-do-asfalto',
    title: 'Lendas do Asfalto',
    subtitle: 'Acao',
    year: 2025,
    ageRating: '16+',
    synopsis:
        'Nas ruas de Sao Paulo, pilotos clandestinos disputam '
        'o titulo maximo das corridas ilegais. Mas quando o '
        'crime organizado entra no jogo, a velocidade se torna '
        'questao de vida ou morte.',
    colorValue: 0xFFDC2626,
    seasons: [
      SeriesSeason(
        number: 1,
        title: 'Temporada 1',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'Largada',
            duration: '48 min',
            description:
                'Leo desafiou o campeao e venceu. Agora todos '
                'querem um pedaco dele — inclusive os mafiosos.',
            thumbnailColorValue: 0xFFB91C1C,
            progress: 0.0,
          ),
          SeriesEpisode(
            number: 2,
            title: 'Curva Fechada',
            duration: '46 min',
            description:
                'Uma armadilha na pista faz Leo questionar em '
                'quem ele pode confiar.',
            thumbnailColorValue: 0xFF991B1B,
            progress: 0.0,
          ),
        ],
      ),
    ],
    cast: [
      SeriesCastMember(
        name: 'Chay Suede',
        role: 'Leo',
        avatarColorValue: 0xFFDC2626,
      ),
      SeriesCastMember(
        name: 'Paolla Oliveira',
        role: 'Rita',
        avatarColorValue: 0xFFEA580C,
      ),
      SeriesCastMember(
        name: 'Milhem Cortaz',
        role: 'Chefe Russo',
        avatarColorValue: 0xFF4B5563,
      ),
    ],
    related: [
      RelatedSeriesItem(title: 'Rota 88', colorValue: 0xFF7C2D12),
      RelatedSeriesItem(title: 'Distrito Neon', colorValue: 0xFF2563EB),
      RelatedSeriesItem(title: 'Codigo das Sombras', colorValue: 0xFF0F766E),
    ],
  ),
  'vortex-temporal': SeriesDetailContent(
    id: 'vortex-temporal',
    title: 'Vortex Temporal',
    subtitle: 'Sci-fi',
    year: 2024,
    ageRating: '14+',
    synopsis:
        'Um grupo de cientistas descobre um vortice temporal no '
        'fundo do oceano. Cada mergulho revela uma epoca diferente '
        '— e uma nova ameaca ao presente.',
    colorValue: 0xFF15803D,
    seasons: [
      SeriesSeason(
        number: 1,
        title: 'Temporada 1',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'Descoberta',
            duration: '54 min',
            description:
                'O sinal aparece nos sonares. O que esta la embaixo '
                'nao e natural.',
            thumbnailColorValue: 0xFF166534,
            progress: 0.0,
          ),
          SeriesEpisode(
            number: 2,
            title: 'Primeiro Salto',
            duration: '50 min',
            description:
                'A primeira expedicao retorna com dados impossiveis '
                '— e um tripulante a menos.',
            thumbnailColorValue: 0xFF14532D,
            progress: 0.0,
          ),
        ],
      ),
    ],
    cast: [
      SeriesCastMember(
        name: 'Marcos Palmeira',
        role: 'Dr. Freitas',
        avatarColorValue: 0xFF15803D,
      ),
      SeriesCastMember(
        name: 'Leandra Leal',
        role: 'Bia',
        avatarColorValue: 0xFF7C3AED,
      ),
      SeriesCastMember(
        name: 'Enrique Diaz',
        role: 'Prof. Otavio',
        avatarColorValue: 0xFF4B5563,
      ),
    ],
    related: [
      RelatedSeriesItem(title: 'Horizonte Final', colorValue: 0xFF7C3AED),
      RelatedSeriesItem(title: 'Entre Mundos', colorValue: 0xFF6D28D9),
      RelatedSeriesItem(title: 'Distrito Neon', colorValue: 0xFF2563EB),
    ],
  ),
  'sombra-lunar': SeriesDetailContent(
    id: 'sombra-lunar',
    title: 'Sombra Lunar',
    subtitle: 'Terror',
    year: 2025,
    ageRating: '18+',
    synopsis:
        'Uma pequena vila costeira e assombrada por desaparecimentos '
        'que sempre acontecem na lua cheia. Tres adolescentes decidem '
        'investigar — e nunca mais serao os mesmos.',
    colorValue: 0xFF4B5563,
    seasons: [
      SeriesSeason(
        number: 1,
        title: 'Temporada 1',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'A Vila',
            duration: '47 min',
            description:
                'Os primeiros desaparecimentos. Os moradores culpam '
                'a lenda da criatura da lua.',
            thumbnailColorValue: 0xFF374151,
            progress: 0.0,
          ),
          SeriesEpisode(
            number: 2,
            title: 'A Lenda',
            duration: '50 min',
            description:
                'Os adolescentes encontram o diario de uma vitima '
                'de cinquenta anos atras.',
            thumbnailColorValue: 0xFF1F2937,
            progress: 0.0,
          ),
        ],
      ),
      SeriesSeason(
        number: 2,
        title: 'Temporada 2',
        episodes: [
          SeriesEpisode(
            number: 1,
            title: 'Lua Cheia',
            duration: '52 min',
            description:
                'A lua cheia se aproxima e o grupo precisa agir '
                'antes que seja tarde demais.',
            thumbnailColorValue: 0xFF111827,
            progress: 0.0,
          ),
        ],
      ),
    ],
    cast: [
      SeriesCastMember(
        name: 'Klara Castanho',
        role: 'Maya',
        avatarColorValue: 0xFF4B5563,
      ),
      SeriesCastMember(
        name: 'Jose Loreto',
        role: 'Xerife',
        avatarColorValue: 0xFF7C2D12,
      ),
      SeriesCastMember(
        name: 'Taina Muller',
        role: 'Dona Lurdes',
        avatarColorValue: 0xFF7C3AED,
      ),
    ],
    related: [
      RelatedSeriesItem(title: 'Amanhecer Carmesim', colorValue: 0xFFEA580C),
      RelatedSeriesItem(title: 'Rota 88', colorValue: 0xFF7C2D12),
      RelatedSeriesItem(title: 'Entre Mundos', colorValue: 0xFF6D28D9),
    ],
  ),
};
