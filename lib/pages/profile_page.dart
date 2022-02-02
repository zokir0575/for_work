import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_work/blocs/list_information_cubit.dart';
import 'package:for_work/blocs/list_information_state.dart';
import 'package:for_work/model/information_model.dart';
import 'package:for_work/views/view_of_profile.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Information> items = [];
  bool isLoading = false;
 String? selected;
  List<Map> myJson = [
    {
      "id" : "1",
      "image" : "assets/images/uzb_flag.png",
      "lang" : "O'zbek(Lotin)",
    },
    {
      "id" : "2",
      "image" : "assets/images/ru_flag.png",
      "lang" : "Русский",
    },
    {
      "id" : "3",
      "image" : "assets/images/us_flag.png",
      "lang" : "English(USA)",
    },
  ];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListInformationCubit>(context).apiInformationList();

  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => Scaffold(
          backgroundColor: Colors.black,
          body: Column(
          children: [
            //#top
            Container(
              width: double.infinity.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              height: 51.h,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(20, 20, 22, 1),
              ),
              child: Row(
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
                  LocaleText("profile", style: GoogleFonts.ubuntu(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.white),),
                ],
              ),

            ),
            SizedBox(height: 20.h,),
            BlocBuilder<ListInformationCubit, ListInformationState>(
                builder: (BuildContext context, ListInformationState state){
                 if(state is ListInformationError){
                   return viewOfProfile(items, true);
                 }
                 if(state is ListInformationLoaded){
                   items = state.information;
                   return viewOfProfile(items, false);
                 }
                 return viewOfProfile(items, true);
                }
            ),
            SizedBox(height: 11.89.h,),
            Container(
              height: 44.h,
              width: 343.w,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(42, 42, 45, 1),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    dropdownColor: const Color.fromRGBO(42, 42, 45, 1),
                    hint: Text("Change language",
                       style: GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color.fromRGBO(231, 231, 231, 1)),),
                      value: selected,
                    onChanged: (String? value){
                      setState(() {
                        if(value == "O'zbek(Lotin)"){
                          Locales.change(context, "uz");
                        } else if(value == myJson[1]["lang"]){
                          Locales.change(context, "ru");
                        } else{
                          Locales.change(context, "en");
                        }
                        selected = value!;
                      });
                    },
                    items: myJson.map((value) {
                      return DropdownMenuItem<String>(
                        value: value["id"].toString(),
                        child: Row(
                          children: [
                            Container(
                              height: 36.h,
                              width: 36.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(value["image"]),
                                )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20.w),
                              child: Text(value["lang"],
                                style: GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color.fromRGBO(231, 231, 231, 1)),),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
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
