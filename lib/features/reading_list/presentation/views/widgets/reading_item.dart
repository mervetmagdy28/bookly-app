import 'package:bookly/costants.dart';
import 'package:bookly/features/reading_list/data/book_model_firestore.dart';
import 'package:bookly/features/reading_list/presentation/views/widgets/custom_image_book.dart';
import 'package:bookly/features/reading_list/presentation/views/widgets/rating_row_reading_list.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';


class ReadingItem extends StatelessWidget {
  const ReadingItem({Key? key, required this.book, required this.index,}) : super(key: key);
  final BookModelFireStore book;
  final String index;

  @override
  Widget build(BuildContext context) {
     return  SizedBox(
       height: 150,
       child: Row(
         children:[
           CustomImageBook(imageUrl: book.image!, url: book.imageLink!,),
           const SizedBox(width: 30,),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children:[
                 SizedBox(
                   width: MediaQuery.of(context).size.width*.5,
                   child: Text(book.name!,
                     style: Styles.textStyle20.copyWith(fontFamily: kGtSectraFine,),
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
                 const SizedBox(height: 3,),
                 Text(book.author!,
                   style: Styles.textStyle14,
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                 ),
                 const SizedBox(height: 3,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("Free", style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),),
                     RatingRowReadingList(rating: book.ratingAverage!,countRating: book.ratingCount!,index:index),
                   ],)
               ],
             ),
           )
         ],
       ),
     );
  }
}
