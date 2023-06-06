import 'package:bookly1/core/utils/styles.dart';
import 'package:bookly1/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly1/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly1/features/home/presentation/views/widgets/list_view_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: CustomAppBar(),
          ),
          const ListViewBuilder(),
          SizedBox(
            height: MediaQuery.of(context).size.height /15,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              "Newest Books",
              style: Styles.textStyle18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: BestSellerListView(),
          ),

        ],

      ),
    );
  }
}







