import 'package:flutter/material.dart';

class MoviesSearchBar extends StatelessWidget {
  const MoviesSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF17171D),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF262631)),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: Color(0xFF8A8A98), size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Buscar filmes...',
              style: const TextStyle(color: Color(0xFF5A5A6E), fontSize: 14),
            ),
          ),
          const Icon(
            Icons.tune_rounded,
            color: Color(0xFF8A8A98),
            size: 20,
          ),
        ],
      ),
    );
  }
}
