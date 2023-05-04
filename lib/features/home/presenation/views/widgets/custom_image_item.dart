import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/costants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageItem extends StatelessWidget {
  const CustomImageItem({Key? key, required this.imageUrl}) : super(key: key);
 final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.74/2.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imageUrl,
          placeholder: (context, url) => const CustomLoadingIndicator(),
          errorWidget: (context, url, error) => Image.network(
            errImage,
            fit: BoxFit.fill,
          ),
        ),
      )
    );
  }
}