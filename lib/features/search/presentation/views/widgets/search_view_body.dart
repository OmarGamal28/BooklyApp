import 'package:bookly1/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly1/features/search/presentation/views/widgets/custom_search_text.dart';
import 'package:bookly1/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          SearchResultListView(),
        ],
      ),
    );
  }
}
class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    //   Expanded(
    //   child: ListView.builder(
    //     //physics: const NeverScrollableScrollPhysics(),عشان expanded
    //       padding: EdgeInsets.zero,
    //       scrollDirection: Axis.vertical,
    //       shrinkWrap: true,
    //       itemCount: 10,
    //       itemBuilder: (context, index) => const Padding(
    //         padding: EdgeInsets.symmetric(vertical: 10),
    //         child: BestSellerListViewItem(imageUrl: '', bookName: '', authorName: '',
    //
    //         ),
    //       )),
    // );
  }
}

