import 'package:bookly/features/reading_list/data/book_model_firestore.dart';
import 'package:bookly/features/reading_list/presentation/views/widgets/reading_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../costants.dart';


class ReadingListViewBody extends StatelessWidget {
   ReadingListViewBody({Key? key}) : super(key: key);
  var firebaseUser = auth.currentUser!;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: favoriteList.where('uid',isEqualTo: firebaseUser.uid).snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
          if(snapshot.hasData&&snapshot.data!.docs.isNotEmpty){
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  BookModelFireStore book = getBooks(snapshot, index);
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ReadingItem(
                        book: book, index: snapshot.data!.docs[index].id,)
                  );
                }
                ),);

          }else if(snapshot.hasError){
            return const Center(
              child: Text("Something went wrong"),
            );
          }else {
            return Center(
                child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_WpDG3calyJ.json')
            );
          }
        }
    );
  }
  getUserInfo()async{
    var firebaseUser = FirebaseAuth.instance.currentUser!;
    await favoriteList.doc(firebaseUser.uid).get().then((file) {

    });
  }
  BookModelFireStore getBooks(snapshot, index){
    BookModelFireStore book=BookModelFireStore(imageLink: snapshot.data!.docs[index]['book link']??'',
        image: snapshot.data!.docs[index]['book image']??errImage,
        name:  snapshot.data!.docs[index]['book name']??'title',
        author: snapshot.data!.docs[index]['book author']??'no author',
        ratingAverage: snapshot.data!.docs[index]['book rating']?? 3,
        ratingCount: snapshot.data!.docs[index]['book count rating']??100);
    return book;
  }
}
