import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:for_work/model/contracts_model.dart';
import 'package:google_fonts/google_fonts.dart';
class SearchPage extends StatefulWidget {
  late final List<Contracts> contracts;
  SearchPage({required this.contracts});
  static const String id = "search_page";
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Contracts> searchedContracts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Search by keywords",
            hintStyle: GoogleFonts.ubuntu(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
            border: InputBorder.none,
          ),
          onChanged: (val){
            setState(() {
              searchedContracts = widget.contracts.where((element) => element.fish!.contains(val)).toList();
            });
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 66.w,
          height: 73.33.h,
          child: SvgPicture.asset("assets/images/Document.svg"),
        ),
      ),
    );
  }
}
