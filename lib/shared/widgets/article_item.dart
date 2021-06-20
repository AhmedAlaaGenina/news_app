import 'package:flutter/material.dart';
import 'package:news_app/screens/web_view/web_view_screen.dart';
import 'package:news_app/shared/function/function.dart';

class ArticleItem extends StatelessWidget {
  final Map list;

  const ArticleItem({required this.list});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
          context,
          WebViewScreen(url: list['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            list['urlToImage'] != null
                ? Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: NetworkImage(
                            list['urlToImage'],
                          ),
                          fit: BoxFit.cover),
                    ),
                  )
                : Container(
                    width: 120,
                    height: 120,
                    child: Center(child: Text("Image not Fount")),
                  ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        list['title'],
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      list['publishedAt'],
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
