import 'package:flutter/material.dart';

import '../../../domain/constant.dart';
import '../../../domain/core/color.dart';
import '../homescreen.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Image.network(
                      "https://raw.githubusercontent.com/Shameerpc5029/Netflix-Clone/main/assets/images/logo%20netflix.png",
                      width: 35,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                      icon: const Icon(
                        Icons.cast,
                        color: iconColor,
                        size: 28,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Image.network(
                        "https://raw.githubusercontent.com/sopheamen007/app.mobile.netflix-clone-app-ui/master/assets/images/profile.jpeg",
                        fit: BoxFit.cover,
                        width: 26,
                        height: 26,
                      ),
                      onPressed: () {}),
                ],
              )
            ],
          ),
          const VerticleSpace(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Textt(title: "TV Shows"),
              const Textt(title: "Movies"),
              Row(
                children: const [
                  Textt(title: "Categories"),
                  SizedBox(
                    width: 3,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: iconColor,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
