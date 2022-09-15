import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/view/pages/Home.dart';
import 'package:odc/view/pages/settings.dart';

class Partners extends StatelessWidget {
  const Partners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Settings()),
            );
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: HexColor.fromHex('dc802d'),
          ),
        ),
        title: Text(
          "Our Partners",
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional.center,
          child: Column(
            children: [
              Padding(padding: EdgeInsetsDirectional.all(10)),
              SizedBox(
                width: 380,
                height: 300,
                child: Card(
                  color: HexColor.fromHex('d9d9d9'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [
                          HexColor.fromHex('e2e2e2'),
                          HexColor.fromHex('cccccc'),

                     Colors.white,

                          HexColor.fromHex('cccccc'),
                          HexColor.fromHex('e2e2e2')
                    ])),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ODC",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsetsDirectional.all(30)),
                        Row(
                          children: [
                            Text(
                              "Orange ",
                              style: GoogleFonts.poppins(
                                  color: HexColor.fromHex('dc802d'),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30),
                            ),
                            Text(
                              "Digital Center",
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
