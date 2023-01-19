import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/model/notes_model.dart';
import 'package:notes_flutter/modules/all_notes/provider/all_note_modifier_provider.dart';

final createNoteProvider =
    StateNotifierProvider<CreateNoteNotifier, NoteModel>((ref) {
  return CreateNoteNotifier(ref);
});

class CreateNoteNotifier extends StateNotifier<NoteModel> {
  final Ref ref;

  CreateNoteNotifier(this.ref) : super(NoteModel(title: ""));

  void createNote({
    required NoteModel getNoteModel,
  }) {
    state = getNoteModel;
    ref.read(allNoteProvider.notifier).addNote(getNoteModel: getNoteModel);
  }

  void catchNote({
    required NoteModel getNoteModel,
  }) {
    state = getNoteModel;
  }
}
