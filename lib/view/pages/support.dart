import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/view/pages/Home.dart';
import 'package:odc/view/pages/settings.dart';

class Support extends StatelessWidget {
  //const Support({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
          title: (Text(
            "Support",
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
          )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsetsDirectional.all(10)),
              Center(
                child: Container(
                  width: 400,
                  color: Colors.grey.shade100,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Name",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: HexColor.fromHex('dc802d'))),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter a name";
                      }
                    },
                  ),
                ),
              ),
              Padding(padding: EdgeInsetsDirectional.all(10)),
              Center(
                child: Container(
                  width: 400,
                  color: Colors.grey.shade100,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "E-mail",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: HexColor.fromHex('dc802d'))),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter a name";
                      }
                    },
                  ),
                ),
              ),
              Padding(padding: EdgeInsetsDirectional.all(10)),
              Center(
                child: Container(
                  width: 400,
                  height: 400,
                  color: Colors.grey.shade100,
                  child: TextFormField(
                    maxLines: 100,
                    controller: reasonController,
                    decoration: InputDecoration(
                      labelText: "What's making your unhappy ?",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: HexColor.fromHex('dc802d'))),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter a name";
                      }
                    },
                  ),
                ),
              ),
              Padding(padding: EdgeInsetsDirectional.all(10)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: HexColor.fromHex('#dc802d'),
                      onPrimary: Colors.white,
                      fixedSize: Size(400, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side:
                              BorderSide(color: HexColor.fromHex('#dc802d')))),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                  child: Text(
                    "Submit",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  )),
            ],
          ),
        ));
  }
}
