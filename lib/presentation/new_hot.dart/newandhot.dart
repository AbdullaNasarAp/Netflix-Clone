import 'package:flutter/material.dart';

class NewAndHot extends StatefulWidget {
  const NewAndHot({Key? key}) : super(key: key);

  @override
  State<NewAndHot> createState() => _NewAndHotState();
}

class _NewAndHotState extends State<NewAndHot> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("fastandhot.dart"),
      ),
    );
  }
}
