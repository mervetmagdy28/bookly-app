import 'package:flutter/material.dart';

class SlidingAnimationText extends StatelessWidget {
  const SlidingAnimationText({
    Key? key,
    required this.slidingAnimationText,
  }) : super(key: key);

  final Animation<Offset> slidingAnimationText;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimationText,
      builder: (context,_){return SlideTransition(
        position: slidingAnimationText,
        child: const Align(
            alignment: Alignment.center,child: Text("Read Books Free")),
      );},

    );
  }
}

