import 'package:bloc/bloc.dart';
import 'package:bookly1/features/home/data/repos/home_repo.dart';
import 'package:bookly1/features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly1/features/home/presentation/manager/newset_books_cubit/newset_books_state.dart';
import 'package:meta/meta.dart';


class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());
 final HomeRepo homeRepo;

 Future<void> fetchNewsetBooks()async{
   emit(NewsetBooksLoading());
   var result = await homeRepo.fetchBestSellerBooks();
   result.fold((l) {
     emit(NewsetBooksFailure(l.errorMessage));

   }, (r) {
     emit(NewsetBooksSuccess(r));

   });
 }
}
