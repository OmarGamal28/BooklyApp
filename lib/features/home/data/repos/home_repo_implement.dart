import 'package:bookly1/core/errors/failure.dart';
import 'package:bookly1/core/utils/api_services.dart';
import 'package:bookly1/features/home/data/models/book_model.dart';
import 'package:bookly1/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async{
    try{
      var data = await apiService.get(endPoint:'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science');
      List<BookModel> book=[];

      for(var item in data['items']){
        book.add(BookModel.fromJson(item));

      }
      return right(book);

    } on Exception catch(e){
      if(e is DioError) {
        return left(ServerException.fromDioError(e));
      }
      return left(ServerException(e.toString()));

    }

  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{
    try{
      var data = await apiService.get(endPoint:'volumes?Filtering=free-ebooks&q=subject:Programming');
      List<BookModel> book=[];


      for(var item in data['items']){
        book.add(BookModel.fromJson(item));
      }
      return right(book);

    } on Exception catch(e){
      if(e is DioError) {
        return left(ServerException.fromDioError(e));
      }
      return left(ServerException(e.toString()));

    }

  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category})async {
    try{
      var data = await apiService.get(endPoint:'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming' );

      List<BookModel> book=[];


      for(var item in data['items']){
        book.add(BookModel.fromJson(item));
      }
      return right(book);



    }on Exception catch(e){
      if(e is DioError){
       return left(ServerException.fromDioError(e)) ;
      }else{
        return left(ServerException(e.toString())) ;
      }


    }
  }




}