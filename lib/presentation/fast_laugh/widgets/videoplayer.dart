import 'package:flutter/material.dart';
import 'package:netflix_clone/api_model/movie_model.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer1 extends StatefulWidget {
  const VideoPlayer1(VideoPlayerController controller, {Key? key})
      : super(key: key);

  @override
  State<VideoPlayer1> createState() => _VideoPlayer1State();
}

class _VideoPlayer1State extends State<VideoPlayer1> {
  late VideoPlayerController _Controller;
  List<Results>? movie3;
  bool isLoading = true;

  List Video = [
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
  ];

  @override
  void initState() {
    super.initState();
    _playVideo(init: true);
  }

  @override
  void dispose() {
    _Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.deepPurple,
        height: 300,
        child: _Controller.value.isInitialized
            ? Column(
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    child: VideoPlayer(_Controller),
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ));
  }

  void _playVideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= movie3!.length) return;
    _Controller = VideoPlayerController.network(Video[index])
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => _Controller.play());
  }
}
