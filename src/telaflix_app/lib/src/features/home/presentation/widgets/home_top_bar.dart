import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key, required this.greeting});

  final String greeting;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/images/logo.png',
                  key: const Key('home-top-bar-logo'),
                  height: 28,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const _TopBarAction(
              key: Key('home-top-bar-search'),
              icon: Icons.search_rounded,
            ),
            const SizedBox(width: 10),
            const _TopBarAvatar(key: Key('home-top-bar-avatar')),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          greeting,
          style: const TextStyle(color: Color(0xFF9A9AA5), fontSize: 13),
        ),
      ],
    );
  }
}

class _TopBarAvatar extends StatelessWidget {
  const _TopBarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFF36E21),
        border: Border.all(color: const Color(0x33FFFFFF)),
      ),
      alignment: Alignment.center,
      child: const Text(
        'I',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _TopBarAction extends StatelessWidget {
  const _TopBarAction({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xFF17171D),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF262631)),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
