import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../model/articleResponse/Article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: article.urlToImage??"",
          fit: BoxFit.cover,
          height: 232.h,
          width: double.infinity,
          placeholder: (_,url)=> const Center(child: CircularProgressIndicator(),),
          errorWidget: (_,url, e)=>Icon(
            Icons.error_outline,
            color: Theme.of(context).colorScheme.primary,
            size: 40.sp,
          ),
        ),
        SizedBox(height: 10.h,),
        Text(article.source?.name??""),
        Text(article.title??""),
        Align(
            alignment: Alignment.centerRight,
            child: Text(timeago.format(DateTime.parse(article.publishedAt??"")))
        ),
      ],
    );
  }
}
