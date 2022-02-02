import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:for_work/model/contracts_model.dart';
import 'package:for_work/views/view_of_history.dart';
import 'package:google_fonts/google_fonts.dart';
import '../blocs/list_contracts_cubit.dart';
import '../blocs/list_contracts_state.dart';
import '../views/view_of_users.dart';
class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);
static const String id = "history_page";
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Contracts> items = [];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: ()=> Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics:  const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            //#top
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              width: double.infinity.w,
              height: 51.h,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromRGBO(0, 255, 194, 1),
                                  Color.fromRGBO(5, 0, 255, 1),
                                  Color.fromRGBO(255, 199, 0, 1),
                                  Color.fromRGBO(173, 0, 255, 1),
                                  Color.fromRGBO(0, 255, 148, 1),
                                ]
                            )
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      LocaleText("history", style: GoogleFonts.ubuntu(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.white),),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/images/Filter.svg")),
                      IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/images/line.svg")),
                      IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/images/zoom.svg")),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            //#date
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(margin: EdgeInsets.only(left: 16.w),child: LocaleText("date", style:  GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.w700, color: Color.fromRGBO(153, 153, 153, 1)),)),
              ],
            ),
            SizedBox(height: 16.h,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16.w),
                  padding: EdgeInsets.only(right: 10.w),
                  height: 37.h,
                  width: 116.w,
                  decoration: BoxDecoration(
                    color: const  Color.fromRGBO(42, 42, 45, 1),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.h),
                      border: InputBorder.none,
                      suffixIcon: SvgPicture.asset("assets/images/Calendar.svg"),
                      suffixIconConstraints: const BoxConstraints(
                        minHeight: 18 ,
                        minWidth: 16,
                      ),
                      
                    ),
                  ),
                ),
                SizedBox(width: 8.w,),
                Container(
                  width: 8.w,
                  height: 0.h,
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                ),
                SizedBox(width: 8.w,),
                Container(
                  margin: EdgeInsets.only(left: 16.w),
                  padding: EdgeInsets.all(10.h),
                  height: 37.h,
                  width: 116.w,
                  decoration: BoxDecoration(
                    color: const  Color.fromRGBO(42, 42, 45, 1),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10.h),
                      hintText: "To",
                      alignLabelWithHint: true,
                      hintStyle: GoogleFonts.ubuntu(color: const Color.fromRGBO(153, 153, 153, 1), fontWeight: FontWeight.w500, fontSize: 14.sp),
                      suffixIcon: SvgPicture.asset("assets/images/Calendar.svg"),
                      suffixIconConstraints: const BoxConstraints(
                        minHeight: 18 ,
                        minWidth: 16,
                      ),

                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 12.h,),
            //#items
            BlocBuilder<ListContractsCubit, ListContractsState>(
              builder: (BuildContext context, ListContractsState state){
                if(state is ListContractsError){
                  return viewOfHistory(items, true);
                }
                if(state is ListContractsLoaded){
                  items = state.contracts;
                  return viewOfHistory(items, false);
                }
                return viewOfHistory(items, true);
              },
            ),
          ],
        ),
      ),
    ),
      designSize: const Size(375, 815),
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }
}