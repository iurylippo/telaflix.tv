import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
    this.selectedIndex = 0,
    this.onItemSelected,
  });

  final int selectedIndex;
  final ValueChanged<int>? onItemSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF121218),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFF23232C)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                key: const Key('bottom-nav-home'),
                icon: Icons.home_filled,
                label: 'Home',
                selected: selectedIndex == 0,
                onTap: () => onItemSelected?.call(0),
              ),
              _NavItem(
                key: const Key('bottom-nav-filmes'),
                icon: Icons.movie_rounded,
                label: 'Filmes',
                selected: selectedIndex == 1,
                onTap: () => onItemSelected?.call(1),
              ),
              _NavItem(
                key: const Key('bottom-nav-series'),
                icon: Icons.tv_rounded,
                label: 'Series',
                selected: selectedIndex == 2,
                onTap: () => onItemSelected?.call(2),
              ),
              _NavItem(
                key: const Key('bottom-nav-tv'),
                icon: Icons.live_tv_rounded,
                label: 'TV',
                selected: selectedIndex == 3,
                onTap: () => onItemSelected?.call(3),
              ),
              _NavItem(
                key: const Key('bottom-nav-profile'),
                icon: Icons.person_rounded,
                label: 'Perfil',
                selected: selectedIndex == 4,
                onTap: () => onItemSelected?.call(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    super.key,
    required this.icon,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? Colors.white : const Color(0xFF848493);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
