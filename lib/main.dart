import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/network/dio_helper.dart';
import 'package:odc/view/pages/News.dart';
import 'package:odc/view/pages/finals.dart';
import 'package:odc/view/pages/grid.dart';
import 'package:odc/view/pages/home.dart';
import 'package:odc/view/pages/midterms.dart';
import 'package:odc/view/pages/notes.dart';
import 'package:odc/view/pages/sections.dart';
import 'package:odc/view/pages/splash.dart';
import 'package:odc/viewmodel/bloc/authentication/myblockobserver.dart';

import 'components/auth/test_form.dart';
import 'viewmodel/database.dart';

void main() async
{

  await DioHelper.init();
  Bloc.observer=MyBlocObserver();
  runApp(Hello());
}


