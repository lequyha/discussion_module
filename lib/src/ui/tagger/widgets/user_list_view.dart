import 'package:discussion_module/src/ui/tagger/widgets/loading_indicator.dart';
import 'package:discussion_module/src/ui/tagger/view_models/search_view_model.dart';
import 'package:discussion_module/src/ui/tagger/widgets/tagger.dart';
import 'package:discussion_module/src/domain/models/user.dart';
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
      margin: EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
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
            return ValueListenableBuilder<List<User>>(
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
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(user.avatar),
                                  ),
                                ),
                              ),
                              title: Text(user.fullName),
                              subtitle: Text("@${user.userName}"),
                              onTap: () {
                                tagController.addTag(
                                  id: user.id,
                                  name: user.userName,
                                );
                              },
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
