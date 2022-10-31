import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widget/app_bar_widget.dart';

class NewAndHot extends StatefulWidget {
  const NewAndHot({Key? key}) : super(key: key);

  @override
  State<NewAndHot> createState() => _NewAndHotState();
}

class _NewAndHotState extends State<NewAndHot> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(title: "Hot & New")),
        body: Center(
          child: Text("fastandhot.dart"),
        ),
      ),
    );
  }
}
