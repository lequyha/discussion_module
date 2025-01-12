import 'dart:developer';

import 'package:core_module/core_module.dart';
import 'package:core_module/di/injection.dart';
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
  late final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    widget.tabController.addListener(() {
      if (widget.tabController.indexIsChanging) {
        _commentController.dismissOverlay();
      }
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
        _commentController.dismissOverlay();
      },
      child: ColoredBox(
        color: Colors.white,
        child: BlocProvider(
          create: (context) => getIt<CommentBloc>()
            ..add(CommentsFetched(objectId: widget.objectId)),
          child: BlocBuilder<CommentBloc, CommentState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return Skeletonizer(
                enabled: state.isInitial,
                child: Column(
                  children: [
                    Expanded(
                      child: state.isError
                          ? Center(child: Text('Failed to fetch comments'))
                          : ListView.builder(
                              padding: const EdgeInsets.all(AppSpace.space16),
                              itemCount: state.comments.length,
                              itemBuilder: (context, index) {
                                final comment = state.comments[index];
                                return CommentOption(comment: comment);
                              },
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.all(AppSpace.space16),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.kBorderDisabledColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppBorderRadius.kMediumBorderRadius),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          CommentForm(
                            commentController: _commentController,
                            focusNode: _focusNode,
                          ),
                          Container(
                            padding: EdgeInsets.all(AppSpace.space8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.kBorderDisabledColor),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    AppBorderRadius.kMediumBorderRadius),
                              ),
                              color: AppColors.kNeutralGray05Color,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    spacing: AppSpace.space8,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Icon(Icons.upload_file),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Icon(Icons.lock_open),
                                      ),
                                      Text('Public (Viewable by All Users)'),
                                    ],
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    log(_commentController.formattedText);
                                    _focusNode.unfocus();
                                    _commentController.clear();
                                  },
                                  child: Text("Gửi"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
