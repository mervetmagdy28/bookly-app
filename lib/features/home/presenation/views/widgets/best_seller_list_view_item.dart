import 'package:bookly/core/utils/router.dart';
import 'package:bookly/features/home/presenation/views/widgets/rating_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../costants.dart';
import '../../../data/models/book_model.dart';
import 'custom_image_item.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.bookDetailsView, extra: bookModel,);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children:[
            CustomImageItem(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??errImage),
            const SizedBox(width: 30,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.5,
                    child: Text(bookModel.volumeInfo.title!,
                      style: Styles.textStyle20.copyWith(fontFamily: kGtSectraFine,),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3,),
                  Text(bookModel.volumeInfo.authors?[0]??'no authors',
                    style: Styles.textStyle14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                   const SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Free", style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),),
                      RatingRow(rating: bookModel.volumeInfo.averageRating?.toInt()??0,countRating: bookModel.volumeInfo.ratingsCount??0),
                    ],)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
