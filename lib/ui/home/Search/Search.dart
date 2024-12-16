import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../remote/apiManager.dart';
import '../../../style/appColors.dart';
import '../../category_details/articleItem.dart';
import '../newsArticlePage.dart';

class CustomSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
            showResults(context);
          },
          icon: Icon(Icons.search)
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSearchArticles(query),
        builder: (_,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Center(
              child: Column(
                children: [
                  Text(snapshot.error.toString()),
                  ElevatedButton(onPressed: (){
                    query = "";
                    Navigator.pop(context);
                    showSearch(context: context, delegate: CustomSearch());
                  }, child:Text("try again"))
                ],
              ),
            );
          }
          var response = snapshot.data;
          if(response?.status == "error"){
            return Center(
              child: Column(
                children: [
                  Text(response?.message??""),
                  ElevatedButton(onPressed: (){
                    query = "";
                    Navigator.pop(context);
                    showSearch(context: context, delegate: CustomSearch());
                  }, child:Text("try again"))
                ],
              ),
            );
          }
          if(response?.articles?.isEmpty == true){
            return Center(
              child: Column(
                children: [
                  Text("Articles not found"),
                  ElevatedButton(onPressed: (){
                    query = "";
                    Navigator.pop(context);
                    showSearch(context: context, delegate: CustomSearch());
                  }, child:Text("search again"))
                ],
              ),
            );
          }
          var articles = response?.articles??[];
          return ListView.separated(
              itemBuilder: (context,index)=>InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(NewsArticlePage.routeName,arguments: articles[index]);
                  },
                  child: ArticleItem(article: articles[index],)),
              separatorBuilder: (context,index)=>Divider(color: Colors.transparent,),
              itemCount: articles.length);


        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          size: 27.sp,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.r),
              bottomRight: Radius.circular(50.r),
            )
        ),
        backgroundColor: AppColors.lightPrimary,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: "Exo",
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 22.sp,
        ),
      ),
      textTheme: TextTheme(
        titleLarge:TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
        color: Colors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: UnderlineInputBorder(borderSide:BorderSide.none)
      )
    );
  }

}