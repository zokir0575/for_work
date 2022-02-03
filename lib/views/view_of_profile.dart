import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_work/views/item_of_informations.dart';

import '../model/information_model.dart';
Widget viewOfProfile(List<Information> items, bool isLoading){
  return Stack(
    children: [
      Container(
        height: 188.11.h,
        width: 343.w,
        margin: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color.fromRGBO(42, 42, 45, 1),
        ),
        child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 8.h),
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (ctx, index){
              return itemOfInformation(context: ctx,  information: items[0]);
            }
        ),
      ),
      isLoading ?
       const Center(
        child: CircularProgressIndicator(),
      ) : const SizedBox.shrink()
    ],
  );
}