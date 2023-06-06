import 'package:bookly1/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly1/features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:bookly1/features/home/presentation/views/widgets/list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.bookModel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListViewItem(

                      imageUrl:
                         Uri.parse(state.bookModel[index].volumeInfo.imageLinks!.thumbnail).toString()  ,
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksErrorState) {
          return Text(state.error);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
