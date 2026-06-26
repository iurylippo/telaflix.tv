import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

typedef VideoPlayerControllerFactory = VideoPlayerController Function(
  String url,
);

class LiveTvDetailPlayer extends StatefulWidget {
  const LiveTvDetailPlayer({
    super.key,
    required this.streamUrl,
    required this.channelName,
    required this.colorValue,
    this.controllerFactory,
  });

  final String streamUrl;
  final String channelName;
  final int colorValue;
  final VideoPlayerControllerFactory? controllerFactory;

  @override
  State<LiveTvDetailPlayer> createState() => _LiveTvDetailPlayerState();
}

class _LiveTvDetailPlayerState extends State<LiveTvDetailPlayer> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  Future<void> _initController() async {
    final factory = widget.controllerFactory;
    if (factory == null) return;

    final controller = factory(widget.streamUrl);
    _controller = controller;

    try {
      await controller.initialize();
      if (!mounted) return;
      setState(() => _isInitialized = true);
      controller.play();
    } catch (_) {
      if (!mounted) return;
      setState(() => _isInitialized = false);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = Color(widget.colorValue);

    return Container(
      key: const Key('live-tv-player'),
      height: 220,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xFF121218),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor.withValues(alpha: 0.5),
            const Color(0xFF121218),
            const Color(0xFF0A0A0E),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.3),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          if (_controller != null && _isInitialized)
            Positioned.fill(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller!.value.size.width,
                  height: _controller!.value.size.height,
                  child: VideoPlayer(_controller!),
                ),
              ),
            ),
          if (_controller != null && _isInitialized)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.35),
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.5),
                    ],
                  ),
                ),
              ),
            ),
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFDC2626),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.circle, color: Colors.white, size: 8),
                  SizedBox(width: 5),
                  Text(
                    'AO VIVO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Text(
              widget.channelName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: GestureDetector(
              key: const Key('live-tv-fullscreen-button'),
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.fullscreen_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
