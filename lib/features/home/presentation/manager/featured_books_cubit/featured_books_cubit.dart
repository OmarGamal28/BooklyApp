import 'package:bloc/bloc.dart';
import 'package:bookly1/features/home/data/repos/home_repo.dart';
import 'package:bookly1/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:meta/meta.dart';


class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks()async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold((l) {
      emit(FeaturedBooksFailure(l.errorMessage));

    }, (r) {
      emit(FeaturedBooksSuccess(r));

    });

  }
}
