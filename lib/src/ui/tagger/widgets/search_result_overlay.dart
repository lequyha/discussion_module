import 'package:discussion_module/src/ui/tagger/view_models/search_view_model.dart';
import 'package:discussion_module/src/ui/tagger/widgets/tagger.dart';
import 'package:discussion_module/src/ui/tagger/widgets/user_list_view.dart';
import 'package:flutter/material.dart';

class SearchResultOverlay extends StatelessWidget {
  const SearchResultOverlay({
    super.key,
    required this.tagController,
  });

  final FlutterTaggerController tagController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SearchResultView>(
      valueListenable: searchViewModel.activeView,
      builder: (_, view, __) {
        if (view == SearchResultView.users) {
          return UserListView(
            tagController: tagController,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
