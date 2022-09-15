import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/view/pages/grid.dart';

import '../../components/auth/card_form.dart';
import '../../main.dart';
import 'Home.dart';

class Midterms extends StatelessWidget {
  //const Midterms({Key? key}) : super(key: key);
  List<String> sectionsName = ['Flutter', 'React', 'Vue','Flutter','React'];
  List<String> examDay = ['2022-08-18', '2022-08-20', '2022-08-20','2022-06-05','2022-06-07'];
  List<String> sectionsStart = ['12:00pm', '12:00pm', '2:00pm','12:00pm','12:00pm'];
  List<String> sectionsEnd = ['2:00pm', '2:00pm', '4:00pm','2:00pm','2:00pm'];



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap:(){
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
                "Midterms",
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
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, index) {
                  return cardForm(
                      sectionsName[index], examDay[index],
                      sectionsStart[index], sectionsEnd[index],"Exam Date");

                })
          ],
        ),
      );
  }
}
