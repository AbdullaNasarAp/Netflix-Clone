import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/fast_laugh/widgets/videolist_item.dart';

class FastLaugh extends StatefulWidget {
  const FastLaugh({Key? key}) : super(key: key);

  @override
  State<FastLaugh> createState() => _FastLaughState();
}

class _FastLaughState extends State<FastLaugh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
      scrollDirection: Axis.vertical,
      children: List.generate(
          10,
          (index) => VideoListItem(
                index: index,
              )),
    )));
  }
}
