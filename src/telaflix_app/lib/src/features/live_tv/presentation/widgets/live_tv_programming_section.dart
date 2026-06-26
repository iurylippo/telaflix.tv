import 'package:flutter/material.dart';

import '../../domain/live_tv_content.dart';

class LiveTvProgrammingSection extends StatelessWidget {
  const LiveTvProgrammingSection({super.key, required this.schedule});

  final List<LiveTvProgramItem> schedule;

  @override
  Widget build(BuildContext context) {
    final currentProgram = schedule.where((p) => p.isCurrent).firstOrNull;
    final upcoming = schedule.where((p) => !p.isCurrent).toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Column(
        key: const Key('live-tv-programming-section'),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Programacao',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          if (currentProgram != null)
            _ProgramRow(
              key: const Key('live-tv-current-program'),
              program: currentProgram,
              accentColor: const Color(0xFFF36E21),
              isCurrent: true,
            ),
          ...upcoming.map(
            (program) => _ProgramRow(
              program: program,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgramRow extends StatelessWidget {
  const _ProgramRow({
    super.key,
    required this.program,
    this.accentColor,
    this.isCurrent = false,
  });

  final LiveTvProgramItem program;
  final Color? accentColor;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    final borderColor =
        accentColor ?? const Color(0xFF23232C);
    final bgColor = isCurrent
        ? const Color(0xFF1A1A24)
        : const Color(0xFF121218);

    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 64,
            child: Text(
              program.startTime,
              style: TextStyle(
                color: accentColor ?? const Color(0xFF8A8A98),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  program.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: accentColor ?? Colors.white,
                    fontSize: 14,
                    fontWeight:
                        isCurrent ? FontWeight.w700 : FontWeight.w600,
                  ),
                ),
                if (program.description.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    program.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF8A8A98),
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
