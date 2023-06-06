import 'package:bookly1/core/utils/routers.dart';
import 'package:bookly1/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly1/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:bookly1/features/home/presentation/views/widgets/list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState >(
      builder: (context, state) {
        if(state is FeaturedBooksSuccess){
          return SizedBox(

            height: MediaQuery
                .of(context)
                .size
                .height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra:state.books[index]);
                      },
                      child: ListViewItem(
                        imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                      ),
                    ),
                  );
                }),
          );
        }else if(state is FeaturedBooksFailure){
          return Text(state.error);
        }else{
          return const Center(child: CircularProgressIndicator());
        }

      },
    );
  }
}
