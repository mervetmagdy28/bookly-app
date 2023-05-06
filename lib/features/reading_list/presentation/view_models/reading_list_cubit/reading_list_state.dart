part of 'reading_list_cubit.dart';

@immutable
abstract class ReadingListState {}

class ReadingListInitial extends ReadingListState {}
class ReadingListEmpty extends ReadingListState {}
class ReadingListLoading extends ReadingListState {}
class ReadingListSuccess extends ReadingListState {
  final List<BookModel> books;
  ReadingListSuccess({required this.books});
}
class ReadingListFailure extends ReadingListState {
  final String errMessage;
  ReadingListFailure(this.errMessage);
}
