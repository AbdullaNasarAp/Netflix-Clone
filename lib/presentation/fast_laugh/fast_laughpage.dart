import 'package:flutter/material.dart';

class FastLaugh extends StatefulWidget {
  const FastLaugh({Key? key}) : super(key: key);

  @override
  State<FastLaugh> createState() => _FastLaughState();
}

class _FastLaughState extends State<FastLaugh> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("fastlaugh.dart"),
      ),
    );
  }
}
