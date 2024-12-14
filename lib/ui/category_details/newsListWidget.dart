import 'package:flutter/material.dart';
import 'package:news_app/remote/apiManager.dart';
import 'package:news_app/ui/category_details/articleItem.dart';

class NewsListWidget extends StatefulWidget {
  final String? sourceId;
  const NewsListWidget({this.sourceId,super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  void initState() {
    // TODO: implement initState

    ApiManager.getArticles(widget.sourceId??"");
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(widget.sourceId??""),
        builder: (_,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: (){
                  setState(() {

                  });
                }, child:Text("try again"))
              ],
            );
          }
          var response = snapshot.data;
          if(response?.status == "error"){
            return Column(
              children: [
                Text(response?.message??""),
                ElevatedButton(onPressed: (){
                  setState(() {

                  });
                }, child:Text("try again"))
              ],
            );
          }
          var articles = response?.articles??[];
          return ListView.separated(
              itemBuilder: (context,index)=>ArticleItem(article: articles[index],),
              separatorBuilder: (context,index)=>Divider(),
              itemCount: articles.length);


        }
    );

  }
}
