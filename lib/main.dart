import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/style/appStyle.dart';
import 'package:news_app/ui/home/homeScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412,870),
      minTextAdapt: true,
        splitScreenMode: true,
      builder: (_, child){
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppStyle.lightTheme,
          initialRoute: HomeScreen.routeName,
          routes: {
            HomeScreen.routeName:(_)=>HomeScreen(),
          },
        );
      },
    );

  }
}