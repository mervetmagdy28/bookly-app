import 'package:bloc/bloc.dart';
import 'package:bookly/features/reading_list/data/book_model_firestore.dart';
import 'package:meta/meta.dart';

import '../../../../../costants.dart';
import '../../../../home/data/models/book_model.dart';

part 'reading_list_state.dart';

class ReadingListCubit extends Cubit<ReadingListState> {
  ReadingListCubit() : super(ReadingListInitial());

  void addBook({required BookModelFireStore? book}) {
    favoriteList.add({
      'book image':book?.image??errImage,
      'book name':book?.name,
      'book author':book?.author??'no authors',
      'book rating':book?.ratingAverage??3,
      'book count rating':book?.ratingCount??100,
      'book link':book?.imageLink??''
    });
  }

}
