import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/category.dart';

class CategoryItem extends StatelessWidget {
  final Category categoryModel;
  final int index;
  final void Function(String) onTap;
  const CategoryItem({required this.categoryModel,required this.index,super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 171.h,
      width: 148.w,
      decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
            bottomLeft: Radius.circular(index.isEven?25.r:0),
            bottomRight: Radius.circular(index.isOdd?25.r:0),
          ),
        
      ),
      child: InkWell(
        onTap: (){
          onTap(categoryModel.id);
        },
        child: Padding(
          padding: REdgeInsets.only(top: 11,bottom: 15),
          child: Column(
            children: [
              Image.asset(categoryModel.image,
                height: 116.h,
                width: 132.w,
              ),
              SizedBox(height: 10.h,),
              Text(categoryModel.title,style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w400,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
