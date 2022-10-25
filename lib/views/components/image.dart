import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget charactorImage(String url) {
  return SizedBox(
    width: 22,
    height: 22,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(11.0),
      child: CachedNetworkImage(
        placeholder: (contect, url) => const CircularProgressIndicator(),
        errorWidget: (contect, url, error) => const Icon(Icons.error),
        imageUrl: url,
      ),
    ),
  );
}
