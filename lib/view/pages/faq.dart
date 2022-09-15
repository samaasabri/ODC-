import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/view/pages/settings.dart';
import 'package:odc/viewmodel/bloc/faq/faq_state.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../viewmodel/bloc/faq/faq_cubit.dart';

class FAQ extends StatelessWidget {
  //const FAQ({Key? key}) : super(key: key);
  late FAQCubit myCubit;

  @override
  Widget build(BuildContext context) {
    // or use HTML.toRichText()

    return BlocConsumer<FAQCubit, FAQStatus>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        myCubit = FAQCubit.get(context);
        return myCubit.faqModel == null
            ? Center(
                child: Text(
                  "Loading ... ",
                  style: GoogleFonts.poppins(color: Colors.black),
                ),
              )
            : Scaffold(
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
                    "FAQ",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  centerTitle: true,
                ),
                body: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                      text: HTML.toTextSpan(
                    context,
                    myCubit.faqModel!.data[0].question.toString() +
                        "\n " +
                        myCubit.faqModel!.data[0].answer.toString()
                        ,
                    linksCallback: (dynamic link) {
                      debugPrint('You clicked on ${link.toString()}');
                    },
                    // as name suggests, optionally set the default text style
                    defaultTextStyle: TextStyle(color: Colors.grey[700]),
                    overrideStyle: <String, TextStyle>{
                      'p': const TextStyle(fontSize: 17.3),
                      'a': const TextStyle(wordSpacing: 2),
                      // specify any tag not just the supported ones,
                      // and apply TextStyles to them and/override them
                    },
                  )),
                ),
              );
      },
    );
  }
}
