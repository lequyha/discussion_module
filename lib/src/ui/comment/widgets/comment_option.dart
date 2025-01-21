import 'package:core_module/core_module.dart';
import 'package:discussion_module/src/domain/models/comment_model.dart';
import 'package:discussion_module/src/ui/comment/widgets/reply_comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CommentOption extends StatelessWidget {
  final CommentModel comment;
  final bool isReply;

  const CommentOption({
    super.key,
    required this.comment,
    this.isReply = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSpace.space8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Avatar(url: comment.userAvatar),
        Expanded(
          child: Column(
            spacing: AppSpace.space8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildCommentBody(),
              _buildActions(context),
              if (comment.replyTotal > 0) _buildReplies(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '@${comment.createdUsername} • ${comment.createdTimeAgo}',
          style: context.textTheme.kXSmallRegular.copyWith(
            color: AppColors.kNeutralGray5Color,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  Widget _buildCommentBody() {
    return Container(
      padding: const EdgeInsets.all(AppPadding.kXSPadding),
      decoration: BoxDecoration(
        color: AppColors.kLayerBackgroundColor,
        borderRadius:
            BorderRadius.circular(AppBorderRadius.kMediumBorderRadius),
      ),
      child: Html(
        data: comment.body,
        style: {
          '*': Style(
            margin: Margins.zero,
            padding: HtmlPaddings.zero,
            fontSize: FontSize.medium,
          ),
        },
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!isReply)
          GestureDetector(
            onTap: () {},
            child: Text(
              'Phản hồi',
              style: context.textTheme.kXSmallRegular.copyWith(
                color: AppColors.kTextLinkColor,
              ),
            ),
          ),
        if (comment.isPrivate)
          Text(
            'Riêng tư',
            style: context.textTheme.kXSmallRegular.copyWith(
              color: AppColors.kNeutralGray5Color,
            ),
          ),
      ],
    );
  }

  Widget _buildReplies() {
    return ReplyComments(replyComments: comment.replyComments);
  }
}
