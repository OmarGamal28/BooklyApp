
import 'package:bookly1/features/home/data/models/book_model.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}
class SimilarBooksLoadingState extends SimilarBooksState {}
class SimilarBooksSuccessState extends SimilarBooksState {
  List<BookModel> bookModel;
  SimilarBooksSuccessState(this.bookModel);
}
class SimilarBooksErrorState extends SimilarBooksState {
  final String error;
  SimilarBooksErrorState(this.error);
}



