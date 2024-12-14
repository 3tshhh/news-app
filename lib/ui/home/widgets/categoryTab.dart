import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/ui/home/widgets/categoryItem.dart';

import '../../../model/category.dart';

class CategoryTab extends StatelessWidget {
  void Function(String) onTap;
  CategoryTab({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top:36.h,left: 35.w,right: 170.w),
          child: Text(
              "Pick your category of interest",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        SizedBox(height: 10.h,),
        Expanded(
          child: GridView.builder(
            padding: REdgeInsets.symmetric(
                vertical: 36.h,
                horizontal: 37.w,
            ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                childAspectRatio: 1/1.2,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 25.w,
              ),
              itemBuilder: (_,index)=>CategoryItem(
                  onTap: onTap ,
                  categoryModel: Category.categories[index],
                  index: index),
            itemCount: 6,
          ),
        ),
      ],

    );
  }
}
