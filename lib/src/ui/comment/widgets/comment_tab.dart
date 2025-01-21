import 'package:core_module/core_module.dart';
import 'package:core_module/di/injection.dart';
import 'package:discussion_module/src/domain/models/comment_model.dart';
import 'package:discussion_module/src/ui/comment/bloc/comment_bloc.dart';
import 'package:discussion_module/src/ui/comment/widgets/comment_form.dart';
import 'package:discussion_module/src/ui/comment/widgets/comment_option.dart';
import 'package:discussion_module/src/ui/tagger/widgets/tagger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommentTab extends StatefulWidget {
  final int objectId;
  final TabController tabController;

  const CommentTab({
    super.key,
    required this.objectId,
    required this.tabController,
  });

  @override
  State<CommentTab> createState() => _CommentTabState();
}

class _CommentTabState extends State<CommentTab> {
  final _commentController = FlutterTaggerController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_handleTabChange);
    _commentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (widget.tabController.indexIsChanging) {
      _commentController.dismissOverlay();
    }
  }

  void _clearAndDismiss() {
    _focusNode.unfocus();
    _commentController.dismissOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _clearAndDismiss,
      child: ColoredBox(
        color: Colors.white,
        child: BlocProvider(
          create: (_) => getIt<CommentBloc>()
            ..add(CommentsFetched(objectId: widget.objectId)),
          child: BlocBuilder<CommentBloc, CommentState>(
            builder: (context, state) {
              return Skeletonizer(
                enabled: state.isInitial,
                child: Column(
                  children: [
                    Expanded(
                      child: state.isError
                          ? const Center(
                              child: Text('Failed to fetch comments'))
                          : _buildCommentList(state.comments),
                    ),
                    _buildCommentInputSection(context, state),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCommentList(List<CommentModel> comments) {
    return ListView.builder(
      padding: const EdgeInsets.all(
          AppSpace.space16), // Padding for the entire ListView
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppSpace.space8), // Padding for each item
          child: CommentOption(comment: comments[index]),
        );
      },
    );
  }

  Widget _buildCommentInputSection(BuildContext context, CommentState state) {
    return Container(
      margin: const EdgeInsets.all(AppSpace.space16),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kBorderDisabledColor),
        borderRadius:
            BorderRadius.circular(AppBorderRadius.kMediumBorderRadius),
        color: Colors.white,
      ),
      child: Column(
        children: [
          CommentForm(
            commentController: _commentController,
            focusNode: _focusNode,
          ),
          _buildCommentActions(context),
        ],
      ),
    );
  }

  Widget _buildCommentActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpace.space8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kBorderDisabledColor),
        borderRadius:
            BorderRadius.circular(AppBorderRadius.kMediumBorderRadius),
        color: AppColors.kNeutralGray05Color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                _buildIconAction(Icons.upload_file, () {}),
                _buildIconAction(Icons.lock_open, () {}),
                const Text('Public (Viewable by All Users)'),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {
              context.read<CommentBloc>().add(
                    CommentCreated(
                      objectId: widget.objectId,
                      comment: _commentController.formattedText,
                    ),
                  );
              _commentController.clear();
              _focusNode.unfocus();
            },
            child: const Text("Gửi"),
          ),
        ],
      ),
    );
  }

  Widget _buildIconAction(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.space8),
        child: Icon(icon),
      ),
    );
  }
}
