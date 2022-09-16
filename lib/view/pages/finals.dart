import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/view/pages/grid.dart';
import 'package:odc/viewmodel/bloc/finals/finals_cubit.dart';

import '../../components/auth/card_form.dart';
import '../../main.dart';
import '../../viewmodel/bloc/finals/finals_state.dart';
import 'Home.dart';

class Finals extends StatelessWidget {
  // const Finals({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FinalsCubit, FinalsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FinalsCubit myCubit = FinalsCubit.get(context);
        return myCubit.finalModel == null
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GridHome()),
                        );
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: HexColor.fromHex('dc802d'),
                      ),
                    ),
                    title: Center(
                        child: Text(
                      "Finals",
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
                            padding: const EdgeInsets.all(8),
                            shrinkWrap: true,
                            itemCount: myCubit.finalModel!.data.length,
                            itemBuilder: (BuildContext context, index) {
                              return cardForm(
                                  myCubit.finalModel!.data[index].examSubject
                                      .toString(),
                                  myCubit.finalModel!.data[index].examDate
                                      .toString(),
                                  myCubit.finalModel!.data[index].examStartTime
                                      .toString(),
                                  myCubit.finalModel!.data[index].examEndTime
                                      .toString(),
                                  "Exam Date");
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
