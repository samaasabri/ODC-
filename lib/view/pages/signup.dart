import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/viewmodel/bloc/authentication/register/reg_cubit.dart';

import '../../components/auth/test_form.dart';
import '../../main.dart';
import '../../viewmodel/bloc/authentication/register/register_state.dart';
import 'Home.dart';
import 'grid.dart';

class SignUp extends StatelessWidget {
  //const SignUp({Key? key}) : super(key: key);

  final GlobalKey<FormState> Key_SignUP = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passsController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<String> gender = ['male', 'female'];
  String? selecteditem = 'male';

  List<String> uni = ["ASU", "GUC", "AUC"];
  String? selecteditemUNI = 'ASU';

  List<String> grade = ['A', 'B', 'C', "D", "F"];
  String? selecteditemGrade = "A";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is RegisterSucess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );}
      if (state is RegisterSucess) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    }, builder: (context, state) {
          var signUpCubit = RegisterCubit.get(context);
      return Scaffold(
          body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: Key_SignUP,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Orange ",
                        style: GoogleFonts.poppins(
                            color: HexColor.fromHex('dc802d'),
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Digital Center",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(30)),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  textForm("Name", nameController, "please enter a valid name"),
                  Padding(padding: EdgeInsets.all(10)),
                  textForm(
                      "E-Mail", emailController, "please enter a valid name"),
                  Padding(padding: EdgeInsets.all(10)),
                  textFormwithIcon("Password", Icons.visibility_off_sharp,
                      passsController, "please enter a valid name", () {
                    signUpCubit.changePasswordVisibilty();
                  }),
                  Padding(padding: EdgeInsets.all(10)),
                  textFormwithIcon("Password", Icons.visibility_off_sharp,
                      passsController, "please enter a valid name", () {
                    signUpCubit.changePasswordVisibilty2();
                  }),
                  Padding(padding: EdgeInsets.all(10)),
                  textForm("Phone Number", phoneController,
                      "please enter a valid name"),
                  Padding(padding: EdgeInsets.all(20)),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Column(
                            children: [
                              Text(
                                "Gender",
                                style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              Padding(padding: EdgeInsetsDirectional.all(10)),
                              DecoratedBox(
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                        color: HexColor.fromHex('dc802d')),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                child: DropdownButton<String>(
                                  value: selecteditem,
                                  items: gender
                                      .map((item) => DropdownMenuItem<String>(
                                          value: item, child: Text(item)))
                                      .toList(),
                                  onChanged: (item) {
                                    setState() {
                                      selecteditem = item;
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Column(
                              children: [
                                Text(
                                  "University",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                Padding(padding: EdgeInsetsDirectional.all(10)),
                                DecoratedBox(
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.0,
                                          style: BorderStyle.solid,
                                          color: HexColor.fromHex('dc802d')),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                  ),
                                  child: DropdownButton(
                                    value: selecteditemUNI,
                                    items: uni
                                        .map((item) => DropdownMenuItem<String>(
                                            value: item, child: Text(item)))
                                        .toList(),
                                    onChanged: (item) {
                                      setState() {
                                        selecteditemUNI = item;
                                      }
                                    },
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Grade",
                            style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          DecoratedBox(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: HexColor.fromHex('dc802d')),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            child: DropdownButton(
                                value: selecteditemGrade,
                                items: grade
                                    .map((item) => DropdownMenuItem(
                                        value: item, child: Text(item)))
                                    .toList(),
                                onChanged: (item) {
                                  setState() {
                                    selecteditemGrade = item;
                                  }
                                }),
                          )
                        ],
                      )
                      //
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (Key_SignUP.currentState!.validate()) {
                        signUpCubit.register(
                            email: emailController.text,
                            password: passsController.text,
                            name: nameController.text,
                            phoneNumber: phoneController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: HexColor.fromHex('#dc802d'),
                        onPrimary: Colors.white,
                        fixedSize: Size(700, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white))),

                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),

                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "OR",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      Expanded(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: HexColor.fromHex('#dc802d'),
                          fixedSize: Size(700, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  color: HexColor.fromHex('#dc802d')))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Text(
                        "Log in",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: HexColor.fromHex('#dc802d')),
                      )),
                ],
              ),
            ),
          ),
        ),
      ));
    });
  }
}
