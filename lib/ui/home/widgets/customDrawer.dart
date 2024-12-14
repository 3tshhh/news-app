import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
typedef selectTab = void Function(TabEnum);

class CustomDrawer extends StatelessWidget {
  final selectTab onPress;
  const CustomDrawer({super.key,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 326.w,
      child: Column(
        children: [
          Container(
            padding: REdgeInsets.only(top: 15,),
            height: 110.h,
            width: 326.w,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary

            ),
            child: Center(
                child: Text(
                  "News App!",
                  style: Theme.of(context).textTheme.titleLarge,
                )
            ),
          ),
          SizedBox(height: 29.h,),
          InkWell(
            onTap: (){
              onPress(TabEnum.Categories);

            },
            child: Padding(
              padding: REdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 30.sp,
                  ),
                  SizedBox(width: 16.w,),
                  Text("Categories", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.black
                  ),)
                ],
              ),
            ),
          ),
          SizedBox(height: 29.h,),
          InkWell(
            onTap: (){
               onPress(TabEnum.Settings);

            },
            child: Padding(
              padding: REdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 30.sp,
                  ),
                  SizedBox(width: 16.w,),
                  Text("Settings", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.black
                  ),)
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
enum TabEnum{
  Categories,
  Settings
}
