import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  VideoListItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _Controller;

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

  void _playVideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= video.length) return;
    _Controller = VideoPlayerController.network(video[index])
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => _Controller.play());
  }

  List video = [
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            child: Container(
                color: Colors.deepPurple,
                child: _Controller.value.isInitialized
                    ? Column(
                        children: <Widget>[
                          SizedBox(
                              child: _Controller.value.isInitialized
                                  ? AspectRatio(
                                      aspectRatio:
                                          _Controller.value.aspectRatio,
                                      child: VideoPlayer(_Controller),
                                    )
                                  : Container())
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ))),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                    icon: const Icon(
                      Icons.volume_off,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Column(
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://raw.githubusercontent.com/sopheamen007/app.mobile.netflix-clone-app-ui/master/assets/images/profile.jpeg"),
                  ),
                  VideoAction(
                    title: "LOL",
                    icon: Icons.emoji_emotions,
                  ),
                  VideoAction(
                    title: "My List",
                    icon: Icons.add,
                  ),
                  VideoAction(
                    title: "Share",
                    icon: Icons.near_me,
                  ),
                  VideoAction(
                    title: "Play",
                    icon: Icons.play_arrow,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class VideoAction extends StatelessWidget {
  const VideoAction({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
