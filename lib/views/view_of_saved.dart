import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/contracts_model.dart';
import 'item_of_contact.dart';

Widget viewOfSaved(List<Contracts> items, bool isLoading ){
  return Stack(
    children: [
      SizedBox(
        height: 666.h,
        child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 8.h),
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (ctx, index){
              return itemOfContact(context: ctx, contracts: items[index]);
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