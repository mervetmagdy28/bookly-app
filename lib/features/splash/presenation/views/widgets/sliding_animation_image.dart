import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
class SlidingAnimationImage extends StatelessWidget {
  const SlidingAnimationImage({
    Key? key,
    required this.slidingAnimationImage,
  }) : super(key: key);

  final Animation<Offset> slidingAnimationImage;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimationImage,
      builder: (context ,_){
        return SlideTransition(
          position: slidingAnimationImage,
          child: Image(image: const AssetImage(AssetsData.logo,),width: MediaQuery.of(context).size.width*.4,fit: BoxFit.fitWidth,),);
      },);
  }
}

