import 'package:flutter/material.dart';
import 'package:news_app/ui/category_details/categoryDetailsWidget.dart';
import 'package:news_app/ui/home/widgets/categoryTab.dart';
import 'package:news_app/ui/home/widgets/customDrawer.dart';
import 'package:news_app/ui/home/widgets/settingsTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Widget selectedWidget;
  @override
  void initState() {
    super.initState();
    selectedWidget = CategoryTab(onTap: SelectedNews);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
            fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: selectedWidget,
        drawer: CustomDrawer(onPress: SelectedTab,),
        appBar: AppBar(
          title: const Text("News App"),
        ),

      ),
    );
  }
  SelectedTab(TabEnum Tab){
    setState(() {
      switch(Tab){
        case TabEnum.Categories:{
          selectedWidget = CategoryTab(onTap: SelectedNews,);
        }
        case TabEnum.Settings:{
          selectedWidget = SettingsTab();
        }

      }
      Navigator.pop(context);
    });
  }
  SelectedNews(String id){
    selectedWidget = CategoryDetailsWidget(categoryId: id);
    setState(() {

    });
  }

}
