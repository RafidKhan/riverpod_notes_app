import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:notes_flutter/provider/multiple_provider/deleted_note_modifier_multiple_provider.dart';
import 'package:notes_flutter/utils/custom_text_widget.dart';
import 'package:notes_flutter/utils/deleted_note_tile.dart';

class DeletedNotes extends ConsumerWidget {
  const DeletedNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesData = ref.watch(deletedNoteMultipleProvider);
    notesData.sort((a, b) => b.dateTime!.compareTo(a.dateTime!));

    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: notesData.length,
          itemBuilder: (context, index) {
            var element = notesData[index];

            return DeletedNoteTile(
              noteModel: element,
              onRestore: () {
                ref
                    .read(deletedNoteMultipleProvider.notifier)
                    .restoreNote(getNoteModel: element);
              },
              onPermanentDelete: () {
                ref
                    .read(deletedNoteMultipleProvider.notifier)
                    .removeFromTrash(getNoteModel: element);
              },
            );
          }),
    );
  }
}
