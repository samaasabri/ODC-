
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/main.dart';

import '../../view/pages/Home.dart';

Widget cardMenuForm(String name,IconData icon,int index, List pages,  context){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RawMaterialButton(
          onPressed: () {
            print(index);
            Navigator.push(context, MaterialPageRoute(builder: (context )=> pages[index]));
          },

          elevation: 3.0,
          fillColor: HexColor.fromHex('eeeef0'),
          child: Icon(
            icon,
            size: 50.0,
            color:HexColor.fromHex('dc802d') ,
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        ),

        Text(name,style: GoogleFonts.poppins(color: HexColor.fromHex('dc802d'),fontWeight: FontWeight.w500,fontSize: 30),)
      ],
    ),
  );
}