import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:for_work/blocs/list_contracts_cubit.dart';
import 'package:for_work/blocs/list_contracts_state.dart';
import 'package:for_work/model/contracts_model.dart';
import 'package:for_work/pages/search_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:for_work/views/view_of_users.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
 static const String id = "home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  List<Contracts> items = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListContractsCubit>(context).apiContractsList();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () =>  Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
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
                          Text("Contracts", style: GoogleFonts.ubuntu(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.white),),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/images/Filter.svg")),
                          IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/images/line.svg")),
                          IconButton(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SearchPage(contracts: [])));
                              },
                              icon: SvgPicture.asset("assets/images/zoom.svg")
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //#calendar
                Container(
                  height: 148.h,
                  width: double.infinity.w,
                  decoration: const  BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          blurRadius: 7,
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          offset:  Offset(4, 18),
                        )
                      ],
                      color: Color.fromRGBO(30, 30, 32, 1)
                  ),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2040, 10, 19),
                    focusedDay: DateTime.now(),
                    calendarFormat: CalendarFormat.week,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
                      todayTextStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.w700, color: Colors.white),
                      selectedDecoration: BoxDecoration(color: const Color.fromRGBO(0, 167, 149, 1), borderRadius: BorderRadius.circular(6)),
                      todayDecoration: BoxDecoration(color: const Color.fromRGBO(0, 167, 149, 1), borderRadius: BorderRadius.circular(6)),
                    ),
                  ),
                ),
                SizedBox(height: 12.h,),
                SingleChildScrollView(

                  child: Column(
                    children: [
                      Row(
                        children: [
                          //#contracts
                          Container(
                            height: 33.h,
                            width: 92.w,
                            margin: EdgeInsets.only(left: 16.w),
                            decoration: BoxDecoration(
                              color: const  Color.fromRGBO(0, 167, 149, 1),
                              borderRadius: BorderRadius.circular(6.r)
                            ),
                            child: FlatButton(
                              onPressed: (){},
                              child: Center(
                                child: Text("Contracts", style:  GoogleFonts.ubuntu(fontWeight: FontWeight.w500, fontSize: 15.sp, color: Colors.white),),
                              ),
                            ),
                          ),
                          SizedBox(width: 18.w,),
                          Container(
                            height: 33.h,
                            width: 92.w,
                              decoration: BoxDecoration(
                                  color: const  Color.fromRGBO(0, 0, 0, 1),
                                  borderRadius: BorderRadius.circular(6.r)
                              ),
                              child: FlatButton(
                                onPressed: (){},
                                child: Center(
                                  child: Text("Invoice", style:  GoogleFonts.ubuntu(fontWeight: FontWeight.w500, fontSize: 15.sp, color: Colors.white),),
                                ),
                              )
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      BlocBuilder<ListContractsCubit, ListContractsState>(
                        builder: (BuildContext context, ListContractsState state){
                          if(state is ListContractsError){
                            return viewOfUser(items, true);
                          }
                          if(state is ListContractsLoaded){
                            items = state.contracts;
                            return viewOfUser(items, false);
                          }
                          return viewOfUser(items, true);
                        },
                      ),
                    ],
                  ),
                ),
                //#items
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
