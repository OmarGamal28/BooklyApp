import 'package:bookly1/features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly1/features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly1/features/home/presentation/manager/newset_books_cubit/newset_books_state.dart';
import 'package:bookly1/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: state.book.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: BestSellerListViewItem(
                      bookModel:state.book[index],

                    ),
                  ),
          );
        } else if (state is NewsetBooksFailure) {
          return Text(state.error);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
