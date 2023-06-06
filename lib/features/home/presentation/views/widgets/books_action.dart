import 'package:bookly1/core/widgets/custom_button.dart';
import 'package:bookly1/features/home/data/models/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel}) : super(key: key);
  final  BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text:'free',
              backGroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),


              ),


            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async{
                Uri url =Uri.parse(bookModel.volumeInfo.previewLink!);


                if (await canLaunchUrl(url)){
                  await launchUrl(url);
                } else {
                  print('cant');
                }
              },
              text:'Preview',
              backGroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),

              ),


            ),
          ),
        ],
      ),
    );
  }
}
