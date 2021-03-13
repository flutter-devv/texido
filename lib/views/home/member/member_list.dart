import 'package:flutter/material.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'member_item.dart';

class MemberList extends StatelessWidget {
  final List items;
  MemberList(this.items);
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size),
      child: Scrollbar(
        controller: scrollController,
        thickness: size * 0.5,
        isAlwaysShown: true,
        radius: Radius.circular(50.0),
        child: ListView.builder(
          controller: scrollController,
          physics: BouncingScrollPhysics(),
          itemCount: items.length,
          padding: EdgeInsets.only(left: size, right: size * 1.5),
          itemBuilder: (context, index) {
            return MemberItem(items[index], index);
          },
        ),
      ),
    );
  }
}
