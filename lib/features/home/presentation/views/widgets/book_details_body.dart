import 'package:bookly1/core/utils/styles.dart';
import 'package:bookly1/features/home/data/models/book_model.dart';
import 'package:bookly1/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly1/features/home/presentation/views/widgets/book_details_body.dart';
import 'package:bookly1/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly1/features/home/presentation/views/widgets/list_view_item.dart';
import 'package:bookly1/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return  CustomScrollView(
      // مستخدمناش single child عشان في expended تحت في الكود ومينفعوش مع بعض و استخدمنا scroll اصلا عشان لو حجم شاشه صغير فا يسكرول

      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: BookDetailsAppBar(),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .30),
                child:  ListViewItem(
                  imageUrl:   Uri.parse(bookModel.volumeInfo.imageLinks!.thumbnail).toString(),
                ),
              ),
              const SizedBox(
                height: 43,
              ),
              Text(
                bookModel.volumeInfo.title ?? '',
                style: Styles.textStyle30.copyWith(
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 6,
              ),
              Opacity(
                opacity: .7,
                child: Text(
                  bookModel.volumeInfo.authors?.first ?? '',
                  style: Styles.textStyle18.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(

                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                   Text(
                    bookModel.volumeInfo.averageRating?.toString() ?? '',
                    style: Styles.textStyle16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    bookModel.volumeInfo.ratingsCount?.toString() ?? '',
                    style: Styles.textStyle14.copyWith(
                        color: Colors.grey[700]
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 37,
              ),
               BooksAction(
                bookModel: bookModel,

              ),
              const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You Can Also Like',
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: SimilarBookListView(),
              ),
            ],
          ),
        )
      ],
    );
  }
}




