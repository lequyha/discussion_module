import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/di/injection.dart';
import 'package:discussion_module/src/domain/models/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager_dio/flutter_cache_manager_dio.dart';
import 'package:flutter_html/flutter_html.dart';

class CommentOption extends StatelessWidget {
  final CommentModel comment;
  const CommentOption({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    final createdDateTime =
        comment.created?.toDateTime(inputFormat: DateFormats.ddMmmyyhhmma);
    String createdTimeAgo =
        createdDateTime != null ? formatTimeAgo(createdDateTime) : '';
    return Row(
      spacing: AppSpace.space8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.kMediumPadding),
          child: CachedNetworkImage(
            imageUrl: comment.avatar ?? '',
            cacheManager: getIt<DioCacheManager>(),
            placeholder: (context, url) => Image.asset(
              Assets.kDefaultAvatar,
              width: 24.0,
              height: 24.0,
            ),
            errorWidget: (context, url, error) => Image.asset(
              Assets.kDefaultAvatar,
              width: 24.0,
              height: 24.0,
            ),
            imageBuilder: (context, imageProvider) => Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            spacing: AppSpace.space8,
            children: [
              Column(
                spacing: AppSpace.space4,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '@${comment.creatorKey} • $createdTimeAgo',
                        style: context.textTheme.kXSmallRegular
                            .copyWith(color: AppColors.kNeutralGray5Color),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(AppPadding.kXSPadding),
                    decoration: BoxDecoration(
                      color: AppColors.kLayerBackgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppBorderRadius.kMediumBorderRadius),
                      ),
                    ),
                    child: Html(
                      data: comment.body ?? '',
                      style: {
                        "*": Style(
                          margin: Margins.zero,
                          padding: HtmlPaddings.zero,
                          fontSize: FontSize.medium,
                        ),
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Phản hồi',
                    style: context.textTheme.kXSmallRegular
                        .copyWith(color: AppColors.kTextLinkColor),
                  ),
                  Row(
                    spacing: AppSpace.space4,
                    children: [
                      Text(
                        'Đã chỉnh sửa',
                        style: context.textTheme.kXSmallRegular
                            .copyWith(color: AppColors.kNeutralGray5Color),
                      ),
                      Text(
                        '•',
                        style: context.textTheme.kXSmallRegular
                            .copyWith(color: AppColors.kNeutralGray5Color),
                      ),
                      Text(
                        'Riêng tư',
                        style: context.textTheme.kXSmallRegular
                            .copyWith(color: AppColors.kNeutralGray5Color),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
