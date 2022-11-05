import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:splathon_app/styles/color.dart';

Widget charactorImage(String url) {
  return SizedBox(
    width: 22,
    height: 22,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(11.0),
      child: CachedNetworkImage(
        placeholder: (contect, url) => CircularProgressIndicator(
          color: _randomColor(),
        ),
        errorWidget: (contect, url, error) => const Icon(Icons.error),
        imageUrl: url,
        fadeOutDuration: const Duration(milliseconds: 0),
        fadeInDuration: const Duration(milliseconds: 0),
      ),
    ),
  );
}

Random _imageRandom = Random();
Color _randomColor() {
  switch (_imageRandom.nextInt(4)) {
    case 0:
      return splaBlueColor;
    case 1:
      return splaYellowColor;
    case 2:
      return winColor;
    default:
      return loseColor;
  }
}
