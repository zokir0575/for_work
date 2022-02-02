import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:for_work/model/contracts_model.dart';
import 'package:for_work/views/view_of_saved.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/list_contracts_cubit.dart';
import '../blocs/list_contracts_state.dart';
import '../views/view_of_users.dart';
class SavePage extends StatefulWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  _SavePageState createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  List<Contracts> items = [];
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () =>  Scaffold(
        backgroundColor: Colors.black,
        body: Column(
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
                      Text("Saved", style: GoogleFonts.ubuntu(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.white),),
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
            SizedBox(height: 20.h,),

        //#items
        BlocBuilder<ListContractsCubit, ListContractsState>(
        builder: (BuildContext context, ListContractsState state){
      if(state is ListContractsError){
        return viewOfSaved(items, true);
      }
      if(state is ListContractsLoaded){
        items = state.contracts;
        return viewOfSaved(items, false);
      }
      return viewOfSaved(items, true);
    },
    ),
          ],
        )
      ),
      designSize: const Size(375, 815),
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }
}
