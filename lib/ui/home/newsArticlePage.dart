import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/ui/category_details/articleItem.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/articleResponse/Article.dart';

class NewsArticlePage extends StatelessWidget {
  static const String routeName = "newsArticle";

  const NewsArticlePage({super.key,});

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)?.settings.arguments as Article?;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(article?.source?.name??""),
        ),
        body: Column(
          children: [
            SizedBox(height: 30.h,),
            ArticleItem(article: article),
            SizedBox(height: 18.h,),
            Container(
              height: 370.h,
              width: 383.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25.r)),
              ),
              child: Column(
                children: [
                  Text(article?.content??""),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: (){
                            _launchUrl(article?.url??"");
                          },
                          child: Text("View Full Article",style: TextStyle(color: Color(0xff42505C)),)),
                      Icon(Icons.arrow_right)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
  Future<void> _launchUrl(String url) async {
    Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
