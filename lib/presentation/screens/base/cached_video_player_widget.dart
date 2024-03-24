import 'package:flutter/material.dart';
import 'package:shater/util/api_constant.dart';
import 'package:shater/util/images.dart';
import 'package:video_player/video_player.dart';

class CachedVideoPlayerWidget extends StatefulWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;

  const CachedVideoPlayerWidget({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  State<CachedVideoPlayerWidget> createState() =>
      _CachedVideoPlayerWidgetState();
}

class _CachedVideoPlayerWidgetState extends State<CachedVideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(ApiConstant.baseUrl + "/${widget.url}"),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Center(
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.black54,
                  size: 50,
                ),
              ),
            )
          ]);
        } else {
          return Image.asset(
            IMAGES.loadingGif,
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          );
        }
      },
    );
  }
}
