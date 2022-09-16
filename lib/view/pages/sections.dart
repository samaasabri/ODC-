import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/components/auth/card_form.dart';
import 'package:odc/main.dart';
import 'package:odc/viewmodel/bloc/sections/section_state.dart';
import 'package:odc/viewmodel/bloc/sections/sections_cubit.dart';

import 'Home.dart';
import 'grid.dart';

class Sections extends StatelessWidget {
  //const Sections({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SectionCubit, SectionStatus>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        SectionCubit myCubit = SectionCubit.get(context);
        return myCubit.sectionModel == null
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
                      onTap:(){
                        Navigator.pushReplacement(
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
                      "Sections",
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
                  body: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      child:
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: myCubit.sectionModel!.data.length,
                            itemBuilder: (BuildContext context, index) {
                              return cardForm(
                                  myCubit.sectionModel!.data[index].sectionSubject
                                      .toString(),
                                  myCubit.sectionModel!.data[index].sectionDate.toString(),
                                  myCubit.sectionModel!.data[index].sectionStartTime.toString(),
                                  myCubit.sectionModel!.data[index].sectionEndTime.toString(),
                                  "section Day");
                            })
                      ,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
