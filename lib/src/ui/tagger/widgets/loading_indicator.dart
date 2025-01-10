import 'package:flutter/cupertino.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Loading",
        ),
        SizedBox(width: 10),
        CupertinoActivityIndicator(radius: 10),
      ],
    );
  }
}
