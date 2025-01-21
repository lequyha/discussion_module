import 'package:core_module/core_module.dart';
import 'package:discussion_module/src/domain/models/comment_model.dart';
import 'package:discussion_module/src/ui/comment/widgets/comment_option.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReplyComments extends StatefulWidget {
  final List<CommentModel> replyComments;

  const ReplyComments({super.key, required this.replyComments});

  @override
  State<ReplyComments> createState() => _ReplyCommentsState();
}

class _ReplyCommentsState extends State<ReplyComments> {
  bool _showReplyComments = false;
  late final CommentModel _firstComment;

  @override
  void initState() {
    super.initState();
    _firstComment = widget.replyComments.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!_showReplyComments) _buildCollapsedView(context),
        if (_showReplyComments) _buildExpandedView(),
      ],
    );
  }

  Widget _buildCollapsedView(BuildContext context) {
    return Row(
      spacing: AppSpace.space8,
      children: [
        Avatar(url: _firstComment.userAvatar),
        RichText(
          text: TextSpan(
            text: '@${_firstComment.createdUsername} ',
            style: context.textTheme.kSmallMedium.copyWith(
              color: AppColors.kNeutralBlackColor,
            ),
            children: [
              TextSpan(
                text: 'đã trả lời • ',
                style: context.textTheme.kSmallRegular.copyWith(
                  color: AppColors.kNeutralGray7Color,
                ),
              ),
              TextSpan(
                text: '${widget.replyComments.length} phản hồi',
                style: context.textTheme.kSmallRegular.copyWith(
                  color: AppColors.kNeutralGray7Color,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => setState(() {
                        _showReplyComments = true;
                      }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExpandedView() {
    return Column(
      children: widget.replyComments
          .map((comment) => CommentOption(
                comment: comment,
                isReply: true,
              ))
          .toList(),
    );
  }
}
