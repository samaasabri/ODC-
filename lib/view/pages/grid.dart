import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/components/auth/card_form.dart';
import 'package:odc/components/auth/card_menu_form.dart';
import 'package:odc/viewmodel/database.dart';
import 'package:odc/view/pages/events.dart';
import 'package:odc/view/pages/lecture.dart';
import 'package:odc/view/pages/midterms.dart';
import 'package:odc/view/pages/sections.dart';
import 'package:odc/view/pages/settings.dart';

import '../../main.dart';
import 'Home.dart';
import 'News.dart';
import 'finals.dart';
import 'notes.dart';

class GridHome extends StatelessWidget {
  //const GridHome({Key? key}) : super(key: key);
  List pages = [Lecture(), Sections(), Midterms(), Finals(), Events(), Notes()];
  List<String> gridOptions = [
    "Lecture",
    "Sections",
    "Midterms",
    "Finals",
    "Events",
    "Notes"
  ];
  List<IconData> icons = [
    Icons.menu_book,
    Icons.people_alt_outlined,
    Icons.sticky_note_2_sharp,
    Icons.quiz,
    Icons.calendar_month,
    Icons.notes_sharp
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " Orange ",
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: HexColor.fromHex('#dc802d')),
                  ),
                  Text(
                    " Digital  Center",
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  )
                ],
              ),
              Padding(padding: EdgeInsetsDirectional.all(10)),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2), itemBuilder: (BuildContext, index) {
                return Container(
                  width: 70,
                  height: 20,
                  child: cardMenuForm(
                      gridOptions[index], icons[index], index, pages, context),
                  decoration: new BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                )
                ;
              }

              ),


            ],
          ),


        ),

        bottomNavigationBar: BottomNavigationBar(

          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[


            BottomNavigationBarItem(

              icon: SizedBox(
                width: 100,
                height: 50,
                child: Card(
                  color: HexColor.fromHex('d9d9d9'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(

                    children: [
                      Padding(padding: EdgeInsetsDirectional.all(5)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.home_filled, color: HexColor.fromHex(
                              'dc802d'),),
                          Text(
                            "Home",
                            style: GoogleFonts.poppins(
                                color: HexColor.fromHex('dc802d'),
                                fontWeight: FontWeight.w500, fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              label: '-',

            ),
            BottomNavigationBarItem(
                icon: InkWell(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  News()),
                  );
                }, child: Icon(Icons.home_filled)),
                backgroundColor: Colors.white,
                label: 'news'),
            BottomNavigationBarItem(
                icon: InkWell(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Settings()),

                  );
                },child: Icon(Icons.settings)),
                backgroundColor: Colors.white,
                label: 'settings'),
          ],
        ),
      ),

    );
  }
}
