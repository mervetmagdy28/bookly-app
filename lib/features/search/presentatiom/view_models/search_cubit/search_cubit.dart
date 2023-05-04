import 'package:bloc/bloc.dart';
import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/models/book_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks({required String bookType})async {
    emit(SearchLoading());

    var result=await searchRepo.fetchSearchBooks(bookType: bookType);

    result.fold((failure) {
      emit(SearchFailure(failure.errMessage));
    } , (books) {
      emit(SearchSuccess(books));
    });

  }

}
