import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
          enabledBorder:  buildOutlineInputBorder(),
          focusedBorder:  buildOutlineInputBorder(),

          hintText: 'Search',
          suffixIcon: IconButton(

            onPressed: () {  },
            icon:const Icon(
                Icons.search
            ) ,
          )
      ),

    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
          color: Colors.white
      ),
      borderRadius: BorderRadius.circular(10),


    );
  }
}
