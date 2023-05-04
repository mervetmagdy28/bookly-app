import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_service.dart';

class SearchRepoImpl implements SearchRepo{
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({required String bookType})async {
    try{
      var data=await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:$bookType');
      List<BookModel> books=[];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    }catch (e){
      if (e is DioError) {
        return left(ServerFailure.fromDioError(dioError: e));
      } return left(ServerFailure(e.toString()));
    }

  }

}