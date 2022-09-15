import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/viewmodel/database.dart';
import 'package:odc/view/pages/notes.dart';

import 'Home.dart';

class AddNote extends StatelessWidget {
  //const AddNote({Key? key}) : super(key: key);
  TextEditingController noteController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor.fromHex('dc802d'),
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Notes()),
            );
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Add Notes",
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: "Title",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: HexColor.fromHex('dc802d'))),
            ),
            validator: (val) {
              if (val!.isEmpty) {
                return "Enter a title";
              }
            },
          ),
          Padding(padding: EdgeInsetsDirectional.all(15)),
          TextFormField(
            controller: dateController,
            decoration: InputDecoration(
              labelText: "Date",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: HexColor.fromHex('dc802d'))),
            ),
            validator: (val) {
              if (val!.isEmpty) {
                return "Enter a date";
              }
            },
          ),
          Padding(padding: EdgeInsetsDirectional.all(15)),
          TextFormField(
            controller: noteController,
            decoration: InputDecoration(
              labelText: "Notes",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: HexColor.fromHex('dc802d'))),
            ),
            validator: (val) {
              if (val!.isEmpty) {
                return "Enter a note";
              }
            },
          ),
          Padding(padding: EdgeInsetsDirectional.all(15)),
          ElevatedButton(
              onPressed: () {
                //SQLHelper.deleteAllNotes();
                SQLHelper.addNotes(titleController.text, noteController.text,
                    dateController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notes()),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: HexColor.fromHex('dc802d'),
                  fixedSize: Size(200, 50)),
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text(
                    "ADD",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
