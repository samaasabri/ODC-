import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/viewmodel/database.dart';
import 'package:odc/view/pages/add_notes.dart';
import 'package:odc/viewmodel/bloc/note/note_cubit.dart';

import '../../viewmodel/bloc/note/note_state.dart';
import 'Home.dart';
import 'grid.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit()..getAllNotes(),
      child: BlocConsumer<NoteCubit, NoteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          NoteCubit noteCubit = NoteCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => GridHome()),
                  );
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: HexColor.fromHex('dc802d'),
                ),
              ),
              title: Center(
                child: Text(
                  "Notes",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNote()),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: HexColor.fromHex('dc802d'),
            ),
            //resizeToAvoidBottomInset: false
            body: SingleChildScrollView(
              child: Container(
                height:  MediaQuery.of(context).size.height,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: noteCubit.noteData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 300,
                        height: 100,
                        child: ListTile(
                          title: Text(
                            noteCubit.noteData[index].title.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            noteCubit.noteData[index].note.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          );
        },
      ),
    );
  }
}
