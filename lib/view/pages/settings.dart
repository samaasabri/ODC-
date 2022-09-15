import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/view/pages/faq.dart';
import 'package:odc/view/pages/partners.dart';
import 'package:odc/view/pages/support.dart';
import 'package:odc/view/pages/terms.dart';

import 'Home.dart';

class Settings extends StatelessWidget {
  //const Settings({Key? key}) : super(key: key);

  List pages = [FAQ(), Terms(), Partners(), Support(), Home()];
  List<String> setting = [
    'FAQ',
    'Term & Conditions',
    'Our Partners',
    'Support',
    'Log out'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsetsDirectional.all(30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Settings",
                      style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsetsDirectional.all(20)),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>pages[index]));
                      },
                        child: ListTile(
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                          leading: Text(
                            setting[index],
                            style: GoogleFonts.poppins(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    })
              ],
            ),
          )),
        )));
  }
}
