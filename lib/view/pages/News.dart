import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/main.dart';
import 'package:odc/view/pages/grid.dart';
import 'package:odc/view/pages/settings.dart';

import 'Home.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Column(
              children: [
                Text(
                  "News",
                  style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                Padding(padding: EdgeInsetsDirectional.all(10)),
                SizedBox(
                  width: 380,
                  height: 300,
                  child: Card(
                    color: HexColor.fromHex('d9d9d9'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ODCs",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30),
                            ),
                            SizedBox(
                              width: 100,
                              height: 50,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: HexColor.fromHex('f06d17'),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                        padding: EdgeInsetsDirectional.all(5)),
                                    VerticalDivider(
                                      color: Colors.white,
                                    ),
                                    Icon(
                                      Icons.copy_rounded,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Orange ",
                              style: GoogleFonts.poppins(
                                  color: HexColor.fromHex('dc802d'),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28),
                             ),
                            Text(
                              "Digital Center",
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "ODS Support All Universites",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(

          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black54,
          selectedItemColor: Colors.black54,
          items: <BottomNavigationBarItem>[

            BottomNavigationBarItem(

                icon: InkWell(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  GridHome()),
                  );
                },child: Icon(Icons.home_filled,color: Colors.black54)),
                backgroundColor: Colors.white,
                label: 'home',

            ),

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
                            Icon(Icons.newspaper_rounded),
                            Text(
                              "News",
                              style: GoogleFonts.poppins(
                                  color: HexColor.fromHex('dc802d'),
                              fontWeight: FontWeight.w500,fontSize: 15),
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
                icon: InkWell(onTap:(){
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
