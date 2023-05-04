import 'package:flutter/material.dart';
import 'package:shimmer_effect/shimmer_effect.dart';

class ShimmerEffectImages extends StatelessWidget {
  const ShimmerEffectImages({Key? key, required this.size}) : super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      baseColor: Colors.white30,
      highlightColor: Colors.grey,
      child: SizedBox(
        height: MediaQuery.of(context).size.height*size,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 100,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index)=>Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AspectRatio(
                aspectRatio: 1.74/2.7,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}
