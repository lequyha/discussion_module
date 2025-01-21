import 'package:core_module/core_module.dart';
import 'package:discussion_module/src/ui/tagger/widgets/loading_indicator.dart';
import 'package:discussion_module/src/ui/tagger/view_models/search_view_model.dart';
import 'package:discussion_module/src/ui/tagger/widgets/tagger.dart';
import 'package:flutter/material.dart';

class UserListView extends StatelessWidget {
  const UserListView({
    super.key,
    required this.tagController,
  });

  final FlutterTaggerController tagController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSpace.space8),
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.space2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppBorderRadius.kDefaultBorderRadius),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .2),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: ValueListenableBuilder<bool>(
          valueListenable: searchViewModel.loading,
          builder: (_, loading, __) {
            return ValueListenableBuilder<List<UserModel>>(
              valueListenable: searchViewModel.users,
              builder: (_, users, __) {
                return Column(
                  children: [
                    if (loading && users.isEmpty) ...{
                      const Center(
                        heightFactor: 8,
                        child: LoadingWidget(),
                      )
                    },
                    if (!loading && users.isEmpty)
                      const Center(
                        heightFactor: 8,
                        child: Text("No user found"),
                      ),
                    if (users.isNotEmpty)
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: users.length,
                          itemBuilder: (_, index) {
                            final user = users[index];
                            return ListTile(
                              key: ValueKey(user.value),
                              leading: Avatar(
                                url: user.avatar,
                                width: 50.0,
                                height: 50.0,
                              ),
                              title: Text(user.text),
                              subtitle: Text("@${user.value}"),
                              onTap: () => tagController.addTag(
                                id: user.value,
                                name: user.value,
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
