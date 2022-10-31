import 'package:flutter/material.dart';
import 'package:netflix_clone/domain/constant.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HorizontalSpace(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
        const Icon(Icons.cast, color: Colors.white),
        const HorizontalSpace(width: 10),
        Container(
          width: 20,
          height: 20,
          color: Colors.blue,
        ),
        const HorizontalSpace(width: 10),
      ],
    );
  }
}
