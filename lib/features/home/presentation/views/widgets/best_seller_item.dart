import 'package:bookly1/core/utils/routers.dart';
import 'package:bookly1/core/utils/styles.dart';
import 'package:bookly1/features/home/data/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: bookModel);

      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5/4,// يظبط طول وعرض
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
              // Container(
              //   decoration:  BoxDecoration(
              //       borderRadius: BorderRadius.circular(16.0),
              //
              //       image: const DecorationImage(
              //           image: NetworkImage($imageUrl),
              //           fit: BoxFit.fill
              //       )
              //   ),
              // ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   Text(
                     bookModel.volumeInfo.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    bookModel.volumeInfo.authors!.first,
                    style: Styles.textStyle14.copyWith(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,


                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [

                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const Spacer(),
                      const Icon(

                        Icons.star,
                        color: Colors.amber,
                        size: 15.0,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                       Text(
                         bookModel.volumeInfo.averageRating?.toString() ?? '0',
                        style: Styles.textStyle16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                       Text(
                         '(${bookModel.volumeInfo.ratingsCount ?? '0'  })' ,
                        style: Styles.textStyle14.copyWith(
                          color: Colors.grey[700]
                        ),
                      ),

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
