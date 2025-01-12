import 'package:core_module/core_module.dart';
import 'package:discussion_module/src/ui/tagger/view_models/search_view_model.dart';
import 'package:discussion_module/src/ui/tagger/widgets/search_result_overlay.dart';
import 'package:discussion_module/src/ui/tagger/widgets/tagger.dart';
import 'package:flutter/material.dart';

class CommentForm extends StatelessWidget {
  final FlutterTaggerController commentController;
  final FocusNode focusNode;
  const CommentForm({
    super.key,
    required this.commentController,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterTagger(
      builder: (context, textFieldKey) {
        return TextFormField(
          key: textFieldKey,
          focusNode: focusNode,
          controller: commentController,
          decoration: InputDecoration(
            hintText: 'Nội dung trao đổi',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(AppSpace.space12),
          ),
          maxLines: 3,
        );
      },
      tagTextFormatter: (id, tag, triggerCharacter) {
        return '[~$id]';
      },
      overlay: SearchResultOverlay(
        tagController: commentController,
      ),
      controller: commentController,
      searchRegex: RegExp(r'^\S*$'),
      onSearch: (String query, String triggerCharacter) {
        if (triggerCharacter == "@") {
          searchViewModel.searchUser(query);
        }
      },
      triggerCharacterAndStyles: const {
        '@': TextStyle(color: Colors.blueAccent),
      },
    );
  }
}
