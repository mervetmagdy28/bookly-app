part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchSuccess extends SearchState {
  final List<BookModel> books;
  SearchSuccess(this.books);
}
class SearchFailure extends SearchState {
  final String errMessage;
  SearchFailure(this.errMessage);
}
