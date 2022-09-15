import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/view/pages/Home.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'grid.dart';

class Events extends StatelessWidget {
  //const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(onTap: (){Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  GridHome()),
        );},child: Icon(Icons.arrow_back_ios,color: HexColor.fromHex('dc802d'),),),

        title: Center(child: Text("Midterms",style: GoogleFonts.poppins(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),)),
      ),
      body: SfCalendar(

        view: CalendarView.month
      ),
    );
  }
}
