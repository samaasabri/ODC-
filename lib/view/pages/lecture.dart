import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/view/pages/grid.dart';
import 'package:odc/viewmodel/bloc/lecture/lecture_cubit.dart';
import 'package:odc/viewmodel/bloc/lectures/lecture_state.dart';

import '../../components/auth/card_form.dart';
import 'Home.dart';

class Lecture extends StatelessWidget {
  //const Sections({Key? key}) : super(key: key);

  List<String> lecturesName = ['Flutter', 'React', 'Vue'];
  List<String> lecturesDay = ['Wednesday', 'Thrusday', 'Thrusday'];
  List<String> lecturesStart = ['12:00pm', '12:00pm', '2:00pm'];
  List<String> lecturesEnd = ['2:00pm', '2:00pm', '4:00pm'];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LectureCubit, LectureState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        LectureCubit myCubit = LectureCubit.get(context);
        return myCubit.lectureModel == null
            ? Center(
          child: Text(
            "Loading ... ",
            style: GoogleFonts.poppins(color: Colors.black),
          ),
        )
            : MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  GridHome()),
                );
              },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: HexColor.fromHex('dc802d'),
                ),
              ),
              title: Center(
                  child: Text(
                    "Lectures",
                    style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )),
              actions: [
                Icon(
                  Icons.filter_alt,
                  color: HexColor.fromHex('dc802d'),
                  size: 35,
                )
              ],
            ),
            body: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, index) {
                      return cardForm(
                          myCubit.lectureModel!.data[index].lectureSubject
                              .toString(),
                         myCubit.lectureModel!.data[index].lectureDate.toString(),
                          myCubit.lectureModel!.data[index].lectureStartTime.toString(),
                          myCubit.lectureModel!.data[index].lectureEndTime.toString(),
                          "Lecture Day");
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
