import 'package:flutter/material.dart';

import '../../domain/series_content.dart';

class SeriesCategoryChips extends StatefulWidget {
  const SeriesCategoryChips({
    super.key,
    required this.categories,
  });

  final List<SeriesCategoryItem> categories;

  @override
  State<SeriesCategoryChips> createState() => _SeriesCategoryChipsState();
}

class _SeriesCategoryChipsState extends State<SeriesCategoryChips> {
  late List<SeriesCategoryItem> _items;

  @override
  void initState() {
    super.initState();
    _items = widget.categories.toList();
  }

  @override
  void didUpdateWidget(covariant SeriesCategoryChips oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.categories != widget.categories) {
      _items = widget.categories.toList();
    }
  }

  void _select(int index) {
    setState(() {
      for (var i = 0; i < _items.length; i++) {
        _items[i] = SeriesCategoryItem(
          label: _items[i].label,
          selected: i == index,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final item = _items[index];
          return _ChipItem(
            label: item.label,
            selected: item.selected,
            onTap: () => _select(index),
          );
        },
      ),
    );
  }
}

class _ChipItem extends StatelessWidget {
  const _ChipItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFF36E21) : const Color(0xFF17171D),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: selected ? const Color(0xFFF36E21) : const Color(0xFF262631),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFF8A8A98),
            fontSize: 13,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
