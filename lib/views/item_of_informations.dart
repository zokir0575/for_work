import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:for_work/model/information_model.dart';
import 'package:google_fonts/google_fonts.dart';
Widget itemOfInformation({required BuildContext context, required Information information}){
  return Container(
    height: 188.11.h,
    width: 343.w,
    padding: EdgeInsets.all(15.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: const Color.fromRGBO(42, 42, 45, 1),
    ),
    child: Column(
      children: [
        Row(
          children: [
            //#avatar
            SizedBox(
              height: 48.h,
              width: 48.w,
              child: SvgPicture.asset("assets/images/account_circle.svg"),
            ),
            SizedBox(width: 12.w,),
            //#fish & job
            Column(
              children: [
                Text(information.fish!, style: GoogleFonts.poppins(color: const Color.fromRGBO(0, 167, 149, 1), fontWeight: FontWeight.w600, fontSize: 16.sp ),),
                SizedBox(height: 4.h,),
                Text(information.job!, style: GoogleFonts.poppins(color: const Color.fromRGBO(231, 231, 231, 1), fontSize: 12.sp, fontWeight: FontWeight.w500),),
              ],
            ),
          ],
        ),
        SizedBox(height: 24.h,),
        //#date of birth
        Row(
          children: [
            LocaleText("date of birth:", style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500, fontSize: 14.sp, color: const Color.fromRGBO(231, 231, 231, 1)),),
            SizedBox(width: 8.w,),
            Text(information.birth!, style: GoogleFonts.ubuntu(fontWeight: FontWeight.w400, fontSize: 14.sp, color:  const Color.fromRGBO(153, 153, 153, 1)),),
          ],
        ),
        SizedBox(height: 12.h,),
        //#phone number
        Row(
          children: [
            LocaleText("phone number:", style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500, fontSize: 14.sp, color: const Color.fromRGBO(231, 231, 231, 1)),),
            SizedBox(width: 8.w,),
            Text(information.phnumber!, style: GoogleFonts.ubuntu(fontWeight: FontWeight.w400, fontSize: 14.sp, color:  const Color.fromRGBO(153, 153, 153, 1)),),
          ],
        ),
        SizedBox(height: 12.h,),
        //#email
        Row(
          children: [
            Text("E-mail:", style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500, fontSize: 14.sp, color: const Color.fromRGBO(231, 231, 231, 1)),),
            SizedBox(width: 8.w,),
            Text(information.email!, style: GoogleFonts.ubuntu(fontWeight: FontWeight.w400, fontSize: 14.sp, color:  const Color.fromRGBO(153, 153, 153, 1)),),
          ],
        ),
      ],
    ),
  );
}