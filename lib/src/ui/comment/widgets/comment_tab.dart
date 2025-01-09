import 'package:core_module/core_module.dart';
import 'package:core_module/di/injection.dart';
import 'package:discussion_module/src/ui/comment/bloc/comment_bloc.dart';
import 'package:discussion_module/src/ui/comment/widgets/comment_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommentTab extends StatefulWidget {
  final int objectId;

  const CommentTab({super.key, required this.objectId});

  @override
  State<CommentTab> createState() => _CommentTabState();
}

class _CommentTabState extends State<CommentTab> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
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
                      border: Border.all(color: AppColors.kBorderDisabledColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppBorderRadius.kMediumBorderRadius),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF002766).withOpacity(0.03),
                          spreadRadius: -2,
                          blurRadius: 6,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                        BoxShadow(
                          color: Color(0xFF002766).withOpacity(0.08),
                          spreadRadius: -4,
                          blurRadius: 16,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppSpace.space8,
                            horizontal: AppSpace.space12,
                          ),
                          child: TextFormField(
                            controller: _commentController,
                            decoration: InputDecoration(
                              hintText: 'Nội dung trao đổi',
                              border: InputBorder.none,
                            ),
                            maxLines: 3,
                          ),
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
                                  onPressed: () {}, child: Text("Gửi")),
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
    );
  }
}
