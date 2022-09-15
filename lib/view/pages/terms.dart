import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/view/pages/settings.dart';
import 'package:odc/viewmodel/bloc/terms/terms_state.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../viewmodel/bloc/terms/terms_cubit.dart';

class Terms extends StatelessWidget {
  //const FAQ({Key? key}) : super(key: key);
  late TermsCubit myCubit;

  @override
  Widget build(BuildContext context) {
    // or use HTML.toRichText()

    return BlocConsumer<TermsCubit, TermsStatus>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        myCubit=TermsCubit.get(context);
        return  myCubit.termsModel == null
            ? Center(
          child: Text(
            "Loading ... ",
            style: GoogleFonts.poppins(color: Colors.black),
          ),
        ):Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade200,
            leading: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.black)),
            title: Text(
              "Term & Conditions",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: RichText(text: HTML.toTextSpan(
                    context,
                    myCubit.termsModel!.data!.terms.toString(),
                    linksCallback: (dynamic link) {
                debugPrint('You clicked on ${link.toString()}');
                },
                  // as name suggests, optionally set the default text style
                  defaultTextStyle: TextStyle(color: Colors.grey[700]),
                  overrideStyle: <String, TextStyle>{
                    'p': const TextStyle(fontSize: 8),
                    'a': const TextStyle(wordSpacing: 1),
                    // specify any tag not just the supported ones,
                    // and apply TextStyles to them and/override them
                  },
                )),
        ),
          ));
      },
    );

  }
}