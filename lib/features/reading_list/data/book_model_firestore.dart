import 'package:bookly/costants.dart';
import 'package:bookly/features/home/data/models/book_model.dart';

class BookModelFireStore{
  String? image;
  String? imageLink;
  String? name;
  String? author;
  num? ratingAverage;
  num? ratingCount;

  BookModelFireStore({ this.imageLink,  this.image,  this.name,  this.author,  this.ratingAverage,  this.ratingCount});

    BookModelFireStore modelsEquality(BookModel? bookModel){
      BookModelFireStore bookModelFireStore= BookModelFireStore(
          imageLink: bookModel?.volumeInfo.previewLink??'',
          image: bookModel?.volumeInfo.imageLinks?.thumbnail??errImage,
          name: bookModel?.volumeInfo.title??'BOOK',
          author: bookModel?.volumeInfo.authors![0]??'no author',
          ratingAverage: bookModel?.volumeInfo.averageRating??3,
          ratingCount: bookModel?.volumeInfo.ratingsCount??100
      );

      return bookModelFireStore;
    }
}