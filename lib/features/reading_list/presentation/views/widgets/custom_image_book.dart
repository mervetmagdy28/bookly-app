import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/costants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/functions/url_launcher.dart';

class CustomImageBook extends StatelessWidget {
  const CustomImageBook({Key? key, required this.imageUrl, required this.url}) : super(key: key);
  final String imageUrl;
  final String url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        customLauncherUrl(context, url);
      },
      child: AspectRatio(
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
      ),
    );
  }
}