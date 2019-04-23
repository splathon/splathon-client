import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget CharactorImage(String url) {
  return Container(
    width: 22,
    height: 22,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(11.0),
      child:CachedNetworkImage(
        placeholder: (contect, url) => CircularProgressIndicator(),
        errorWidget: (contect, url, error) => Icon(Icons.error),
        imageUrl: url,
      ),
    ),
  );
}
    