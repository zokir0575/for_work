import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:for_work/model/contracts_model.dart';
import 'package:google_fonts/google_fonts.dart';

Widget itemOfContact({required BuildContext context, required Contracts contracts}){
  return Expanded(
    child: Container(
      height: 148.h,
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: const Color.fromRGBO(42, 42, 45, 1),
      ),
      margin: EdgeInsets.symmetric( horizontal: 8.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/images/Paper.svg"), iconSize: 18.sp,),
                  SizedBox(width: 3.w,),
                  Text(contracts.turn!, style: GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.white),),
                ],
              ),
              Container(
                width: 49.w,
                height: 21.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: const Color.fromRGBO(73, 183, 165, 0.15),
                ),
                child: FlatButton(
                  onPressed: (){},
                  child: Center(
                    child: LocaleText("paid", style: GoogleFonts.ubuntu(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 10.sp),),
                  ),
                ),
              ),
            ],
          ),
          //#fish
          Container(
            margin: EdgeInsets.only(left: 12.w),
            child: Row(
              children: [
                Text("Fish:", style:  GoogleFonts.ubuntu(fontWeight: FontWeight.w500, fontSize: 14.sp, color: Colors.white),),
                SizedBox(width: 7.98.w,),
                Text(contracts.fish!, style: GoogleFonts.ubuntu(fontWeight: FontWeight.w400, fontSize: 14.sp, color:const Color.fromRGBO(153, 153, 153, 1)),)
              ],
            ),
          ),
          SizedBox(height: 5.h,),
          //#amount
          Container(
            margin: EdgeInsets.only(left: 12.w),
            child: Row(
              children: [
                LocaleText("amount:", style:  GoogleFonts.ubuntu(fontWeight: FontWeight.w500, fontSize: 14.sp, color: Colors.white),),
                SizedBox(width: 7.98.w,),
                Text(contracts.amount!, style: GoogleFonts.ubuntu(fontWeight: FontWeight.w400, fontSize: 14.sp, color:const Color.fromRGBO(153, 153, 153, 1)),)
              ],
            ),
          ),
          SizedBox(height: 5.h,),
          Container(
            margin: EdgeInsets.only(left: 12.w),
            child: Row(
              children: [
                LocaleText("last invoice:", style:  GoogleFonts.ubuntu(fontWeight: FontWeight.w500, fontSize: 14.sp, color: Colors.white),),
                SizedBox(width: 7.98.w,),
                Text(contracts.lastInvoice!, style: GoogleFonts.ubuntu(fontWeight: FontWeight.w400, fontSize: 14.sp, color:const Color.fromRGBO(153, 153, 153, 1)),)
              ],
            ),
          ),
          SizedBox(height: 5.h,),
          Container(
            margin: EdgeInsets.only(left: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    LocaleText("number of invoices:", style:  GoogleFonts.ubuntu(fontWeight: FontWeight.w500, fontSize: 14.sp, color: Colors.white),),
                    SizedBox(width: 7.98.w,),
                    Text(contracts.numInvoice!, style: GoogleFonts.ubuntu(fontWeight: FontWeight.w400, fontSize: 14.sp, color:const Color.fromRGBO(153, 153, 153, 1)),)

                  ],
                ),
                Text(contracts.date!, style: GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.w700, color:const Color.fromRGBO(153, 153, 153, 1),))
              ],
            ),
          ),
        ],
      ),
    ),
  );
}






