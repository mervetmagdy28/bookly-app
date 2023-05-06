import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/costants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../reading_list/data/book_model_firestore.dart';
import '../../../data/models/book_model.dart';

class RatingRow extends StatefulWidget {
  const RatingRow({Key? key, this.mainAxisAlignment=MainAxisAlignment.start, required this.rating, required this.countRating, required this.book}) : super(key: key);
  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final num countRating;
  final BookModel book;

  @override
  State<RatingRow> createState() => _RatingRowState();
}

class _RatingRowState extends State<RatingRow> {
  Color favoriteColor=Colors.white;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      children:  [
        const Icon(FontAwesomeIcons.solidStar, size: 16,color: Colors.yellowAccent,),
        Padding(
          padding: const EdgeInsets.only(left: 6.3, right: 5),
          child: Text(widget.rating.toString(), style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),),
        ),
        Text("(${widget.countRating})",style: Styles.textStyle16.copyWith(color: const Color(0xff707070)),),
        IconButton(onPressed: (){
         // print(auth.currentUser!.uid);

          setState(() {
                favoriteColor=Colors.red;
               addBook(bookModel: widget.book);
          });
        }, icon: Icon(Icons.favorite,color: favoriteColor, ))
      ],
    );
  }
  void addBook({required BookModel? bookModel}) {
    BookModelFireStore book = BookModelFireStore().modelsEquality(bookModel);
    favoriteList.add({
      'book image':book.image??errImage,
      'book name':book.name,
      'book author':book.author??'no authors',
      'book rating':book.ratingAverage??3,
      'book count rating':book.ratingCount??100,
      'book link':book.imageLink??'',
      'uid':auth.currentUser!.uid
    });
  }
}
