import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:bookly/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Image(
            image: AssetImage(AssetsData.logo),
            height: 20,
          ),
          AnimSearchBar(
            width: MediaQuery.of(context).size.width-150,
            textController: textController,
            onSuffixTap: () {
              setState(() {
                textController.clear();
              });
            }, onSubmitted: (String bookName) {

              GoRouter.of(context).push(AppRouter.searchView,extra: bookName);

              },
          ),

        ],
      ),
    );
  }
}
