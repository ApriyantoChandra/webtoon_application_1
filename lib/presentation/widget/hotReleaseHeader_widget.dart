import 'package:flutter/material.dart';
import 'package:webtoon_application_1/utils/color.dart';

class HotReleaseHeaderWidget extends StatelessWidget {
  const HotReleaseHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Trending !',
                  style: TextStyle(
                      color: kTextSecondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Text(
                'Read latest Trending comics',
                style: TextStyle(color: kTextSecondColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
