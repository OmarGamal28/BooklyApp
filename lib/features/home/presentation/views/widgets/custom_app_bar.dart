import 'package:bookly1/core/utils/assets.dart';
import 'package:bookly1/core/utils/routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:40,bottom: 20.0,),
      child: Row(
        children: [
          Image.asset(AssetsData.logo,height: 18.0,),
          const Spacer(),
          IconButton(onPressed: () {
            GoRouter.of(context).push(AppRouter.kSearchView);

          },
              icon:const Icon(
                Icons.search,
                size: 24.0,
              )


          )
        ],
      ),
    );
  }
}
