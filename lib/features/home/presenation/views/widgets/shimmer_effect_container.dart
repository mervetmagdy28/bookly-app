import 'package:flutter/material.dart';
import 'package:shimmer_effect/shimmer_effect.dart';

class ShimmerEffectContainer extends StatelessWidget {
  const ShimmerEffectContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      baseColor: Colors.white30,
      highlightColor: Colors.grey,
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index)=>Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: SizedBox(
            height: 120,
            child: Row(
              children: [
                AspectRatio(
                    aspectRatio: 1.74/2.7,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)
                      ),
                    )
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 25,
                      width: MediaQuery.of(context).size.width-150,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width-200,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width-250,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 5,
                          width: MediaQuery.of(context).size.width-300,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Container(
                          height: 5,
                          width: MediaQuery.of(context).size.width-300,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
