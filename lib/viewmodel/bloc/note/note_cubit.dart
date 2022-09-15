import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/viewmodel/database.dart';
import 'package:odc/viewmodel/bloc/note/note_state.dart';

import '../../../model/note_model.dart';

class NoteCubit extends Cubit<NoteState>
{
  NoteCubit():super (NoteInitial());

  static NoteCubit get(context)=> BlocProvider.of(context);
  NoteModel ? noteModel;

List<NoteModel> noteData=[];
 Future<void> getAllNotes ()async {


  await SQLHelper.getNotes().then((value) {
    value.forEach((element) {
      noteData.add(NoteModel.fromDb(element));
    });

  });
  emit(NoteSuceess());
  }

}