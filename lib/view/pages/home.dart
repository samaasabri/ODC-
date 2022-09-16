import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/view/pages/grid.dart';
import 'package:odc/view/pages/signup.dart';
import 'package:odc/viewmodel/bloc/authentication/login/login_cubit.dart';
import 'package:odc/viewmodel/bloc/authentication/login/login_state.dart';

import '../../components/auth/test_form.dart';

class Home extends StatelessWidget {
  final GlobalKey<FormState> Key_Login = GlobalKey<FormState>();
  final GlobalKey<FormState> SignUP_Login = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      // do stuff here based on BlocA's state
      if (state is LoginSuceess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => GridHome()),
        );
      }
    }, builder: (context, state) {
      var myCubit = LoginCubit.get(context);
      // return widget here based on BlocA's state
      return Scaffold(
          body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Form(
              key: Key_Login,
              child: Column(children: [
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
                Padding(padding: EdgeInsets.all(30)),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                textForm(
                    "Email", emailController, "Please enter a valid email"),
                Padding(padding: EdgeInsets.all(10)),
                textFormwithIcon(
                    "Password",
                    myCubit.visiblePassword == false
                        ? Icons.visibility_off_sharp
                        : Icons.visibility,
                    passsController,
                    "please enter a valid password ", () {
                  myCubit.changePasswordVisibilty();
                }),
                Padding(padding: EdgeInsets.all(5)),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text("Forget Password?",
                      style: GoogleFonts.poppins(
                          decoration: TextDecoration.underline,
                          fontSize: 10,
                          color: HexColor.fromHex('#dc802d'))),
                ),
                Padding(padding: EdgeInsets.all(30)),
                (state is LoginLoading)
                    ? const CircularProgressIndicator(
                        backgroundColor: Colors.orange,
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: HexColor.fromHex('#dc802d'),
                            onPrimary: Colors.white,
                            fixedSize: Size(700, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.white))),
                        onPressed: () {
                          if (Key_Login.currentState!.validate()) {
                            myCubit.login(
                                email: emailController.text,
                                password: passsController.text);
                          }
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        )),
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: HexColor.fromHex('#dc802d')),
                    )),
                Padding(padding: EdgeInsets.all(5)),
              ]),
            ),
          ),
        ),
      ));
    });
  }
}

class HexColor {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length <= 7) buffer.write(('ff'));
    buffer.write(hexString.replaceFirst('#', ''));

    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
