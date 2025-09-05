import 'package:flutter/material.dart';

class VideoVoteAverage extends StatelessWidget {
  final double voteAverage;
  const VideoVoteAverage({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 20,
          color: Colors.amber,
        ),
        Text(
          ' ${voteAverage.toStringAsFixed(1)}',
        ),
      ],
    );
  }
}
