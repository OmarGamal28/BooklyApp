
import 'package:bookly1/features/home/data/models/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsetBooksState extends Equatable {
  const NewsetBooksState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewsetBooksInitial extends NewsetBooksState {}
class NewsetBooksLoading extends NewsetBooksState {}
class NewsetBooksFailure extends NewsetBooksState {
  final String error;
  const NewsetBooksFailure(this.error);
}
class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookModel> book;
  const NewsetBooksSuccess(this.book);

}

