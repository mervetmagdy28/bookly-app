import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class RatingRowWithoutFavorite extends StatelessWidget {
  const RatingRowWithoutFavorite({Key? key, required this.rating, required this.countRating}) : super(key: key);
  final num rating;
  final num countRating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        const Icon(FontAwesomeIcons.solidStar, size: 16,color: Colors.yellowAccent,),
        Padding(
          padding: const EdgeInsets.only(left: 6.3, right: 5),
          child: Text(rating.toString(), style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),),
        ),
        Text("($countRating)",style: Styles.textStyle16.copyWith(color: const Color(0xff707070)),),
      ],
    );
  }
}

