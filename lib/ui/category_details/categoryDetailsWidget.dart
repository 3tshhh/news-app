import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/remote/apiManager.dart';
import 'package:news_app/ui/category_details/newsListWidget.dart';

class CategoryDetailsWidget extends StatefulWidget {
  final String categoryId;
  const CategoryDetailsWidget({required this.categoryId,super.key});

  @override
  State<CategoryDetailsWidget> createState() => _CategoryDetailsWidgetState();
}

class _CategoryDetailsWidgetState extends State<CategoryDetailsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    ApiManager.getSources(widget.categoryId);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.categoryId),
        builder: (_, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(
                    onPressed: (){
                      setState(() {

                      });

                }, child:Text("try again") ),
              ],
            );
          }
          var response = snapshot.data;
          if(response?.status == 'error'){
            return Column(
              children: [
                Text(response?.message??""),
                ElevatedButton(
                    onPressed: (){
                      setState(() {

                      });

                    }, child:Text("try again") ),
              ],
            );
          }
          return DefaultTabController(
            length: response?.sources?.length??0,
            child: Column(
              children: [
                SizedBox(height: 15.h,),
                TabBar(
                    labelPadding: EdgeInsets.zero,
                    isScrollable: true,
                    labelColor: Colors.white,
                    dividerHeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: Theme.of(context).colorScheme.primary
                    ),
                    tabs: response?.sources?.map((e)=>Container(
                      margin: REdgeInsets.symmetric(horizontal: 5.w),
                      padding: REdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary
                          )
                      ),
                      child: Tab(
                        child: Text(e.name??""),
                      ),
                    )
                    ).toList()??[]
                ),

                SizedBox(height: 29.h,),
                Expanded(
                  child: TabBarView(
                    children: response?.sources?.map((e) => NewsListWidget(sourceId: e.id??"",)).toList()??[],
                  ),
                )
              ],
            ),
          );
        });
  }
}
