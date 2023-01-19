import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/model/data_model.dart';
import 'package:notes_flutter/provider/multiple_provider/deleted_note_modifier_multiple_provider.dart';

final allNoteMultipleProvider =
    StateNotifierProvider<AllNoteNotifier, List<NoteModel>>((ref) {
  return AllNoteNotifier(ref);
});

class AllNoteNotifier extends StateNotifier<List<NoteModel>> {
  final Ref ref;

  AllNoteNotifier(this.ref) : super([]);

  void moveToTrash({
    required NoteModel getNoteModel,
  }) {
    state = [
      for (final noteModel in state)
        if (noteModel.id != getNoteModel.id) noteModel
    ];

    ref
        .read(deletedNoteMultipleProvider.notifier)
        .addNote(getNoteModel: getNoteModel);
  }

  void addNote({
    required NoteModel getNoteModel,
  }) {
    state = [for (final noteModel in state) noteModel, getNoteModel];
  }

  void updateNote({
    required NoteModel getNoteModel,
  }) {
    state = [for (final noteModel in state) noteModel];
  }
}
