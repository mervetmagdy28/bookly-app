import 'package:bookly/core/utils/router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../../costants.dart';

class RatingRowReadingList extends StatefulWidget {
  const RatingRowReadingList({Key? key, required this.rating, required this.countRating, required this.index}) : super(key: key);
  final num rating;
  final num countRating;
  final String index;

  @override
  State<RatingRowReadingList> createState() => _RatingRowReadingListState();
}

class _RatingRowReadingListState extends State<RatingRowReadingList> {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        const Icon(FontAwesomeIcons.solidStar, size: 16,color: Colors.yellowAccent,),
        Padding(
          padding: const EdgeInsets.only(left: 6.3, right: 5),
          child: Text(widget.rating.toString(), style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),),
        ),
        Text("(${widget.countRating})",style: Styles.textStyle16.copyWith(color: const Color(0xff707070)),),
        IconButton(onPressed: (){
          customAlert(context).show();

          }, icon: const Icon(Icons.delete ,color: Colors.redAccent,))
      ],
    );
  }

  Alert customAlert(BuildContext context) {
    return Alert(
          context: context,
          type: AlertType.warning,
          title: "Delete",
          style: const AlertStyle(backgroundColor: kPrimaryColor,
              titleStyle: Styles.textStyle18,descStyle: Styles.textStyle14,alertBorder: OutlineInputBorder(
           borderSide: BorderSide(color: kPrimaryColor)
          )),
          desc: "Are U sure that you want to delete that book? ",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.of(context).pop(),
              color: kSecondColor,
              child: const Text(
              "NO",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            ),
            DialogButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  favoriteList.doc(widget.index).delete();
                  GoRouter.of(context).replace(AppRouter.readingList);
                });
              },
              gradient: const LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0)
              ]),
              child: const Text(
              "YES",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            )
          ],
        );
  }
}
