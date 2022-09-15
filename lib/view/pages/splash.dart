import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/viewmodel/bloc/authentication/login/login_cubit.dart';
import 'package:odc/viewmodel/bloc/authentication/register/reg_cubit.dart';
import 'package:odc/viewmodel/bloc/faq/faq_cubit.dart';
import 'package:odc/viewmodel/bloc/finals/finals_cubit.dart';
import 'package:odc/viewmodel/bloc/lecture/lecture_cubit.dart';
import 'package:odc/viewmodel/bloc/note/note_cubit.dart';
import 'package:odc/viewmodel/bloc/terms/terms_cubit.dart';

import '../../viewmodel/bloc/sections/sections_cubit.dart';
import 'add_notes.dart';
import 'home.dart';
import 'notes.dart';

class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return LoginCubit();
        }),
        BlocProvider(create: (context) {
          return RegisterCubit();
        }),
        BlocProvider(create: (context) {
          return SectionCubit()..getSection();
        }),
        BlocProvider(create: (context){
          return LectureCubit()..getLecture();
        }),
        BlocProvider(create: (context){
          return FinalsCubit()..getFinals();
        }),

        BlocProvider(create: (context){
          return FAQCubit()..faq();
        }),
        BlocProvider(create: (context){
          return TermsCubit()..term();
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Orange ",
                  style: GoogleFonts.poppins(
                      color: HexColor.fromHex('dc802d'),
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  "Digital Center",
                  style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                )
              ],
            ),
            Padding(padding: EdgeInsetsDirectional.all(15)),
            SizedBox(
              width: 300,
              child: LinearProgressIndicator(
                //value: controller.value,
                backgroundColor: HexColor.fromHex('dc802d'),
                semanticsLabel: 'Linear progress indicator',
                valueColor: AlwaysStoppedAnimation<Color>(
                  HexColor.fromHex('b36013'), //<-- SEE HERE
                ),
              ),
            ),
          ],
        ),
        nextScreen: Home());
  }
}
