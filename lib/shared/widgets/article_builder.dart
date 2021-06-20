import 'package:flutter/material.dart';
import 'widgets.dart';

class ArticleBuilder extends StatelessWidget {
  final List list;
  final bool isSearch;

  const ArticleBuilder({required this.list, this.isSearch = false});

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty
        ? ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ArticleItem(
                list: list[index],
              );
            },
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          )
        :

        /// to make search not showing CircularProgressIndicator
        isSearch
            ? Container()
            : Center(
                child: CircularProgressIndicator(),
              );
  }
}
