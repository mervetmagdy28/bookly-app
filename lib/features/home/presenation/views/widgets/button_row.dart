import 'package:bookly/core/functions/url_launcher.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_button.dart';
class ButtonRow extends StatelessWidget {
  const ButtonRow({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children:  [
          const Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),
              text: "Free",
              textColor: Colors.black,
              fontSize: 20,
            ),
          ),
          const SizedBox(width: .5,),
          Expanded(
            child: CustomButton(
              onPressed: ()async {
                customLauncherUrl(context, bookModel.volumeInfo.previewLink!);
              },
              backgroundColor: Color(0xffef8262),
              borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12)),
              text: getText(bookModel),
              textColor: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
  
  String getText(BookModel bookModel){
    if(bookModel.volumeInfo.previewLink==null){
      return "Not available";
    }else{
      return"Preview";
    }
  }
}
