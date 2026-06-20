# IXSTREAM-12 Home Screen Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the placeholder Telaflix.TV `HomeScreen` with a Flutter-native, mobile-first home experience that matches the approved HTML direction and opens after login using local mock data.

**Architecture:** Keep the feature local and simple. `HomeScreen` composes focused presentation widgets, `home_content.dart` defines the small immutable data shapes used by the screen, and `mock_home_content.dart` holds all static content for this first version. Update the existing widget test to preserve the `SplashScreen -> LoginScreen -> HomeScreen` flow while asserting the new home sections.

**Tech Stack:** Flutter, Material 3, widget tests with `flutter_test`

---

### File Structure

**Create:**
- `src/telaflix_app/lib/src/features/home/domain/home_content.dart` - immutable data classes for hero, continue-watching item, featured movie, live channel, and screen aggregate.
- `src/telaflix_app/lib/src/features/home/data/mock_home_content.dart` - local mock content returned as a single `HomeContent` instance.
- `src/telaflix_app/lib/src/features/home/presentation/widgets/home_bottom_nav.dart` - fixed bottom navigation with active `Home` state.
- `src/telaflix_app/lib/src/features/home/presentation/widgets/home_hero_section.dart` - top hero artwork, metadata chips, description, and CTAs.
- `src/telaflix_app/lib/src/features/home/presentation/widgets/home_poster_card.dart` - vertical featured poster card.
- `src/telaflix_app/lib/src/features/home/presentation/widgets/home_top_bar.dart` - logo, search action, and avatar row.
- `src/telaflix_app/lib/src/features/home/presentation/widgets/live_channel_card.dart` - live TV preview card.
- `src/telaflix_app/lib/src/features/home/presentation/widgets/media_section.dart` - reusable horizontal section shell.
- `src/telaflix_app/lib/src/features/home/presentation/widgets/progress_media_card.dart` - continue-watching card with progress bar.

**Modify:**
- `src/telaflix_app/lib/src/features/home/presentation/home_screen.dart` - replace placeholder scaffold with the composed screen.
- `src/telaflix_app/test/widget_test.dart` - update placeholder expectation to concrete home assertions and keep login flow coverage.
- `.agents/workflow/current.md` - record the implementation plan path and later mark planning complete.

### Task 1: Define Home Mock Data Shapes

**Files:**
- Create: `src/telaflix_app/lib/src/features/home/domain/home_content.dart`
- Create: `src/telaflix_app/lib/src/features/home/data/mock_home_content.dart`
- Test reference: `src/telaflix_app/test/widget_test.dart`

- [ ] **Step 1: Write the failing test updates for concrete home content**

Replace the home assertion in `src/telaflix_app/test/widget_test.dart` so the second test expects the new sections instead of the placeholder title:

```dart
    expect(find.text('ASCENSAO NEBULAR'), findsOneWidget);
    expect(find.text('Continuar assistindo'), findsOneWidget);
    expect(find.text('Filmes em destaque'), findsOneWidget);
    expect(find.text('Canais ao vivo'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
```

- [ ] **Step 2: Run the widget test to verify it fails**

Run: `flutter test test/widget_test.dart`

Expected: FAIL because the placeholder home does not render the new text content.

- [ ] **Step 3: Create the data classes**

Create `src/telaflix_app/lib/src/features/home/domain/home_content.dart`:

```dart
class HomeContent {
  const HomeContent({
    required this.hero,
    required this.continueWatching,
    required this.featuredMovies,
    required this.liveChannels,
  });

  final HeroContent hero;
  final List<ContinueWatchingItem> continueWatching;
  final List<FeaturedMovie> featuredMovies;
  final List<LiveChannel> liveChannels;
}

class HeroContent {
  const HeroContent({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.badges,
  });

  final String title;
  final String imageUrl;
  final String description;
  final List<String> badges;
}

class ContinueWatchingItem {
  const ContinueWatchingItem({
    required this.title,
    required this.imageUrl,
    required this.remainingLabel,
    required this.progress,
  });

  final String title;
  final String imageUrl;
  final String remainingLabel;
  final double progress;
}

class FeaturedMovie {
  const FeaturedMovie({
    required this.title,
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;
}

class LiveChannel {
  const LiveChannel({
    required this.title,
    required this.imageUrl,
    required this.icon,
  });

  final String title;
  final String imageUrl;
  final String icon;
}
```

- [ ] **Step 4: Add the approved mock content**

Create `src/telaflix_app/lib/src/features/home/data/mock_home_content.dart`:

```dart
import '../domain/home_content.dart';

const mockHomeContent = HomeContent(
  hero: HeroContent(
    title: 'ASCENSAO NEBULAR',
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCcjWzZH2WNVvahdTRPC866SktKHTaeM7hzQ6vOxrxaJwIoEvET9QisYDVej_0pbUxwZLq8n_fIj44g3o77HVOS8Y-s2Vmxu0vvg1f3LOngduPRqQn2wY0kwJJ4vIAWcb6hQZTaPBpDb-YWOFe5OjLI4CLQAk2GGH_FcfeZT5IN2LUJWe5lfryje7X_pnLs0Qap4zc-39ntnlSev88sRrk_CbAPqPR1sUTbtXQB0O_RvaN0tPcDS-pcsCMinFOJ7rpdcHgs-OVwICk',
    description:
        'Em um futuro onde o oxigenio e a moeda mais valiosa, um engenheiro renegado descobre uma conspiracao que pode mudar o destino da humanidade para sempre.',
    badges: ['2024', '2h 15m', '4K HDR', 'Acao'],
  ),
  continueWatching: [
    ContinueWatchingItem(
      title: 'Velocidade Maxima: A Fuga',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDJuW3cpc6JpCBG8boD5KKdLAY9Lrs-fg32y8xc3qwMlHCxEEMDSL6yBBYlJYFbhyxXUn9tMrI18XvrcA69aCnyYXvVslDyU_2i2t0lUQ2HOMk7kVjU1qiOQtFnZLODJPqJiDtlQjzV8ofQKMu5cBqHVN24VvtKUJT7Pnx1Ychv4TMxDbQe42NYAcWHXpo80ULGdhv6zFw5yeG9Vz8bD-c-QTvAxfXhLk9Hc-NmpJxuY1ZjO6vXOo5zFKUmaMBKN8ZAMJg_cDxpb0M',
      remainingLabel: '45 min restantes',
      progress: 0.65,
    ),
    ContinueWatchingItem(
      title: 'Biodome: Cronicas de Gaia',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuApEqAhoUaEtsBV3-OjKZm3_GEBc7-96tmlEd9Eh0KU3WOIPdwtM3eKxnD57IPjPx8t941ysRJCv1LTSU3CIPFvu_e_DgW-ZDN_RDtAfpuWBNwwhWguT928mg1TIGpL-IHlmg3QRyz90GNinIBDhZmFwshRYOuuf-jFtDT_kwoeciRrlRIAEMAgR-0XJQKDowaBnVciE9MCYth9O2OD3niGoWfTZDueWrK_X_V4vm8nfsf64QLdt0CjCdSX0x7fi2J1xKi2sJdHZkg',
      remainingLabel: '1h 12 min restantes',
      progress: 0.2,
    ),
  ],
  featuredMovies: [
    FeaturedMovie(title: 'O Ultimo Cyberpunk', imageUrl: 'https://picsum.photos/320/480?1'),
    FeaturedMovie(title: 'Horizonte Perdido', imageUrl: 'https://picsum.photos/320/480?2'),
    FeaturedMovie(title: 'Codigo de Silencio', imageUrl: 'https://picsum.photos/320/480?3'),
    FeaturedMovie(title: 'Reinado de Ferro', imageUrl: 'https://picsum.photos/320/480?4'),
    FeaturedMovie(title: 'A Sombra da Cidade', imageUrl: 'https://picsum.photos/320/480?5'),
  ],
  liveChannels: [
    LiveChannel(
      title: 'TelaNews 24h',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAfIh64Bsz1L6urfWLeZToCu4G8tE8tIJbyuItshrpEGT_xcHlyNiYODYVaLr6qYMQcV8b04CKMKrDj9hPJap0Lap5shrOh0qLns9f3jmHK0ms-LdF43Q8UnBsyQEHJ72bURfdrgctU87pK82T27j-iGuP6CDTpKyV8N1qcP7BT0A8FNaI6PcPVRehQcNre555OdN-vaB4ly3v2XI65337ZLFNxVi70f3w5oP8X-BRp3xgPyQtpKG5vYR4CtBXalXcA0-JJdsKuEhc',
      icon: 'public',
    ),
    LiveChannel(
      title: 'Esportes Prime',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCjpm9Ki1zR4hFOGLuSpsGaq_owF9LkxyS3HPnKyYQOzn8lLavR2oasFdbeYzBg92pNZ5z8H8U8hUSr6tcRHyvyHL8PAQnmKBcxU5DmKpRW_k8MWG8IvXn_CziDIAyJp16qJOn34qG1-e5j4KLsx-Tg1A4kuk29b5dNFu2uGtLA-lp9qmIlo6kHuk1EJzEcHapEUaJonV-IIGilfrzv7q_CCmPBY2QUMYFMJmsfYe_4nyxIocfbrkPTO3PwFXtzt_fdOW1xZdjCv2g',
      icon: 'sports_soccer',
    ),
  ],
);
```

- [ ] **Step 5: Run the widget test again**

Run: `flutter test test/widget_test.dart`

Expected: still FAIL, now because `HomeScreen` still renders the placeholder UI.

### Task 2: Build Reusable Home Presentation Widgets

**Files:**
- Create: `src/telaflix_app/lib/src/features/home/presentation/widgets/media_section.dart`
- Create: `src/telaflix_app/lib/src/features/home/presentation/widgets/home_top_bar.dart`
- Create: `src/telaflix_app/lib/src/features/home/presentation/widgets/home_hero_section.dart`
- Create: `src/telaflix_app/lib/src/features/home/presentation/widgets/progress_media_card.dart`
- Create: `src/telaflix_app/lib/src/features/home/presentation/widgets/home_poster_card.dart`
- Create: `src/telaflix_app/lib/src/features/home/presentation/widgets/live_channel_card.dart`
- Create: `src/telaflix_app/lib/src/features/home/presentation/widgets/home_bottom_nav.dart`

- [ ] **Step 1: Create the reusable horizontal section shell**

Create `media_section.dart` with a heading row and horizontal list content slot:

```dart
import 'package:flutter/material.dart';

class MediaSection extends StatelessWidget {
  const MediaSection({
    super.key,
    required this.title,
    required this.child,
    this.trailing,
  });

  final String title;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
}
```

- [ ] **Step 2: Create the top bar widget**

Include `Image.asset('assets/images/logo.png')`, a search `IconButton`, and a circular network avatar placeholder using `ClipOval`.

- [ ] **Step 3: Create the hero section widget**

Build `home_hero_section.dart` with:

```dart
class HomeHeroSection extends StatelessWidget {
  const HomeHeroSection({super.key, required this.hero});

  final HeroContent hero;
}
```

Inside it, render a tall `Stack` with a background `Image.network`, a dark bottom gradient overlay, the title, a `Wrap` of badge chips, the description, and two rounded buttons labeled `Assistir agora` and `Detalhes`.

- [ ] **Step 4: Create the continue-watching card**

Build `progress_media_card.dart` using a 16:9 image, hoverless tap feedback with `InkWell`, title, remaining label, and a bottom progress bar driven by `item.progress`.

- [ ] **Step 5: Create the featured poster card**

Build `home_poster_card.dart` using a 2:3 aspect ratio image, rounded corners, and a title label under the image.

- [ ] **Step 6: Create the live channel card**

Build `live_channel_card.dart` with a top-left `AO VIVO` badge, image background, bottom gradient overlay, and channel title row.

- [ ] **Step 7: Create the fixed bottom nav**

Build `home_bottom_nav.dart` as a safe-area aware bar with five items and `Home` highlighted using the primary accent color.

### Task 3: Compose the New Home Screen

**Files:**
- Modify: `src/telaflix_app/lib/src/features/home/presentation/home_screen.dart`
- Import from: `src/telaflix_app/lib/src/features/home/data/mock_home_content.dart`
- Import from: `src/telaflix_app/lib/src/features/home/presentation/widgets/*.dart`

- [ ] **Step 1: Replace the placeholder scaffold**

Change `home_screen.dart` to a composed screen that reads `mockHomeContent` and renders the new sections:

```dart
import 'package:flutter/material.dart';

import '../data/mock_home_content.dart';
import 'widgets/home_bottom_nav.dart';
import 'widgets/home_hero_section.dart';
import 'widgets/home_poster_card.dart';
import 'widgets/home_top_bar.dart';
import 'widgets/live_channel_card.dart';
import 'widgets/media_section.dart';
import 'widgets/progress_media_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final content = mockHomeContent;

    return Scaffold(
      backgroundColor: const Color(0xFF07070A),
      bottomNavigationBar: const HomeBottomNav(),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: HomeHeroSection(hero: content.hero)),
              SliverToBoxAdapter(
                child: Transform.translate(
                  offset: const Offset(0, -48),
                  child: Column(
                    children: [
                      MediaSection(
                        title: 'Continuar assistindo',
                        trailing: const Icon(Icons.chevron_right, color: Color(0xFFFFB3AE)),
                        child: SizedBox(
                          height: 210,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => ProgressMediaCard(item: content.continueWatching[index]),
                            separatorBuilder: (context, index) => const SizedBox(width: 16),
                            itemCount: content.continueWatching.length,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      MediaSection(
                        title: 'Filmes em destaque',
                        child: SizedBox(
                          height: 250,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => HomePosterCard(movie: content.featuredMovies[index]),
                            separatorBuilder: (context, index) => const SizedBox(width: 16),
                            itemCount: content.featuredMovies.length,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      MediaSection(
                        title: 'Canais ao vivo',
                        trailing: const _LiveIndicator(),
                        child: SizedBox(
                          height: 180,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => LiveChannelCard(channel: content.liveChannels[index]),
                            separatorBuilder: (context, index) => const SizedBox(width: 16),
                            itemCount: content.liveChannels.length,
                          ),
                        ),
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Positioned(top: 0, left: 0, right: 0, child: SafeArea(child: HomeTopBar())),
        ],
      ),
    );
  }
}
```

- [ ] **Step 2: Add a tiny private live indicator helper**

Keep `_LiveIndicator` private inside `home_screen.dart` to avoid creating another file for a single badge row.

- [ ] **Step 3: Run the widget test**

Run: `flutter test test/widget_test.dart`

Expected: likely FAIL once or twice on missing text visibility, image loading noise, or insufficient pumping after navigation.

- [ ] **Step 4: Adjust text keys or layout hooks if needed for stable tests**

If direct text expectations prove flaky because of capitalization or repeated labels, add explicit keys such as:

```dart
const Key('home-hero-title')
const Key('home-section-continue-watching')
const Key('home-section-featured')
const Key('home-section-live')
const Key('home-bottom-nav-home')
```

Prefer keys only where they improve test stability.

### Task 4: Finalize Tests and Verify the Flow

**Files:**
- Modify: `src/telaflix_app/test/widget_test.dart`

- [ ] **Step 1: Keep the splash test intact**

Retain the first test's current assertions for splash and login, since those behaviors are already covered and should not regress.

- [ ] **Step 2: Tighten the login-to-home test around the new screen**

Update the second test so it verifies navigation into the actual home experience:

```dart
  testWidgets('toggles password visibility and enters home from login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TelaflixApp());
    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();

    final passwordField = tester.widget<EditableText>(
      find.byType(EditableText).last,
    );
    expect(passwordField.obscureText, isTrue);

    await tester.tap(find.byKey(const Key('toggle-password-visibility')));
    await tester.pump();

    final visiblePasswordField = tester.widget<EditableText>(
      find.byType(EditableText).last,
    );
    expect(visiblePasswordField.obscureText, isFalse);

    await tester.tap(find.text('Entrar'));
    await tester.pumpAndSettle();

    expect(find.text('ASCENSAO NEBULAR'), findsOneWidget);
    expect(find.text('Continuar assistindo'), findsOneWidget);
    expect(find.text('Filmes em destaque'), findsOneWidget);
    expect(find.text('Canais ao vivo'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
  });
```

- [ ] **Step 3: Run widget tests until green**

Run: `flutter test test/widget_test.dart`

Expected: PASS

- [ ] **Step 4: Run the full package test suite**

Run: `flutter test`

Expected: PASS

- [ ] **Step 5: Run static analysis**

Run: `dart analyze`

Expected: PASS with no errors.

### Task 5: Sync Workflow Documentation

**Files:**
- Modify: `.agents/workflow/current.md`
- Reference: `docs/prds/IXSTREAM-12-implement-flutter-native-home-screen.md`

- [ ] **Step 1: Record the implementation plan path**

Add this line under `## Plan` in `.agents/workflow/current.md`:

```md
- Implementation plan: `docs/superpowers/plans/2026-06-19-ixstream-12-home-screen.md`
```

- [ ] **Step 2: Mark planning complete after review**

When the plan is approved, update:

```md
- Status: Planning Complete
- [x] Plan approved
```

- [ ] **Step 3: Keep acceptance criteria aligned during implementation**

As implementation completes, mirror the PRD acceptance criteria status and test/lint results in workflow notes before any commit or push step.

### Spec Coverage Check

- Placeholder replacement: covered by Task 3.
- Post-login navigation retention: covered by Task 4.
- Hero, shelves, live section, and bottom nav: covered by Tasks 2 and 3.
- Mocked local data separation: covered by Task 1.
- Widget coverage: covered by Task 4.
- Workflow/doc sync: covered by Task 5.
