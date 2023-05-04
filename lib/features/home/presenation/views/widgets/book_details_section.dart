import 'package:bookly/costants.dart';
import 'package:bookly/features/home/presenation/views/widgets/rating_row.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/book_model.dart';
import 'custom_image_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width*.15),
          child: CustomImageItem(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail?? errImage),
        ),
        const SizedBox(height: 30,),
         Text(bookModel.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontFamily: kGtSectraFine,),
          maxLines: 3,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6,),
        Opacity(
          opacity: .8,
          child: Text(bookModel.volumeInfo.authors?[0]??'no authors',
            style: Styles.textStyle16.copyWith(fontStyle: FontStyle.italic),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 12,),
         RatingRow(
          mainAxisAlignment: MainAxisAlignment.center,
          countRating: bookModel.volumeInfo.averageRating??250,
          rating: bookModel.volumeInfo.ratingsCount??3.5,
        ),
        const SizedBox(height: 30,),
      ],
    );
  }
}
