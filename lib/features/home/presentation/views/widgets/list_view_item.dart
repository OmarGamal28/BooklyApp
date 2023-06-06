import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.7/4,// يظبط طول وعرض
        child: CachedNetworkImage(

          fit: BoxFit.fill,
            imageUrl: Uri.parse(imageUrl).toString() ,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        )
        // Container(
        //   decoration:  BoxDecoration(
        //     borderRadius: BorderRadius.circular(16.0),
        //
        //       image:  DecorationImage(
        //           image: NetworkImage(imageUrl),
        //           fit: BoxFit.fill
        //       )
        //   ),
        // ),
      ),
    );
  }
}