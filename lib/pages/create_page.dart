import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_work/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController fishController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController innController = TextEditingController();
  String? dropdownValue;
  String? faceValue;
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () =>  Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //#top
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              width: double.infinity.w,
              height: 51.h,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              child:  Row(
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

            ),
            SizedBox(height: 20.h,),
            Container(
              margin: EdgeInsets.only(left: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("????????", style: GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color.fromRGBO(241, 241, 241, 1)),),
                  SizedBox(height: 6.h,),
                  //#yuridik, jismoniy
                  Container(
                    width: 343.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                        width: 1.2.w,
                        color: const  Color.fromRGBO(241, 241, 241, 1),
                      ),
                      color:  Colors.black,
                    ),
                    child:  DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          value: faceValue,
                          dropdownColor: const Color.fromRGBO(42, 42, 45, 1),
                          icon: const Icon(Icons.arrow_downward),
                          style: GoogleFonts.ubuntu(color: const Color.fromRGBO(231, 231, 231, 1), fontWeight: FontWeight.w400, fontSize: 14.sp),
                          onChanged: (String? newValue) {
                            setState(() {
                              faceValue = newValue!;
                            });
                          },
                          items: <String>['????????????????????', '??????????????????????']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Text("Fisher's full name", style: GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color.fromRGBO(241, 241, 241, 1)),),
                  SizedBox(height: 6.h,),
                  //#fullname textfield
                  Container(
                    width: 343.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                        width: 1.2.w,
                        color: const  Color.fromRGBO(241, 241, 241, 1),
                      ),
                      color:  Colors.black,
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                      controller: fishController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.w),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Text("Address of the organization", style: GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color.fromRGBO(241, 241, 241, 1)),),
                  SizedBox(height: 6.h,),
                  Container(
                    width: 343.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                        width: 1.2.w,
                        color: const  Color.fromRGBO(241, 241, 241, 1),
                      ),
                      color:  Colors.black,
                    ),
                    child: TextField(
                      controller: addressController,
                      style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.w),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Text("??????", style: GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color.fromRGBO(241, 241, 241, 1)),),
                  SizedBox(height: 6.h,),
                  Container(
                    width: 343.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                        width: 1.2.w,
                        color: const  Color.fromRGBO(241, 241, 241, 1),
                      ),
                      color:  Colors.black,
                    ),
                    child: TextField(
                      controller: innController,
                      style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.w),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Text("Status of the contract", style: GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color.fromRGBO(241, 241, 241, 1)),),
                  SizedBox(height: 6.h,),
                  Container(
                    width: 343.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                        width: 1.2.w,
                        color: const  Color.fromRGBO(241, 241, 241, 1),
                      ),
                      color:  Colors.black,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          dropdownColor: const Color.fromRGBO(42, 42, 45, 1),
                          icon: const Icon(Icons.arrow_downward),
                          style: GoogleFonts.ubuntu(color: const Color.fromRGBO(231, 231, 231, 1), fontWeight: FontWeight.w400, fontSize: 14.sp),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>['Paid', 'In process', 'Rejected by Payme', 'Rejected by IQ']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  ),
                  SizedBox(height: 24.h,),
                  Container(
                    width: 343.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: const  Color.fromRGBO(0, 143, 127, 1),
                    ),
                    child: FlatButton(
                      onPressed: (){},
                      child: Center(
                        child: Text("Save contract", style:  GoogleFonts.ubuntu(color: const Color.fromRGBO(253, 253, 253, 1), fontWeight: FontWeight.w500, fontSize: 16.sp),),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      designSize: const Size(375, 815),
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }
}
