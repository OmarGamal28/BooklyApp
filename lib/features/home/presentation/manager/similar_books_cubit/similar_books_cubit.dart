
import 'package:bookly1/features/home/data/repos/home_repo.dart';
import 'package:bookly1/features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  static SimilarBooksCubit get(context)=> BlocProvider.of(context);
  final HomeRepo homeRepo;


  Future<void> fetchSimilarBooks(String category)async{
    emit(SimilarBooksLoadingState());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((l) {
      emit(SimilarBooksErrorState(l.errorMessage));

    }, (r) {
      emit(SimilarBooksSuccessState(r));

    });

  }
}
