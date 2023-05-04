import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pumpkin/Presentation/categories/ui/categoryDetailScreen.dart';

import '../../../Data/model/category.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(CategoryDetailScreen(), arguments: category),
      child: Container(
        width: 173,
        padding: EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.8,
            color: Color(
              int.parse("0xff" + category.color),
            ),
          ),
          color: Color(int.parse("0xff" + category.color)).withOpacity(0.10),
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Image.memory(
                category.image,
                width: 71,
                height: 71,
              ),
            ),
            SizedBox(
              width: 24,
            ),
            Center(
              child: Text(
                category.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
