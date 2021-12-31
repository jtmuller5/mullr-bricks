import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './feed_view_model.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder
    <FeedViewModel>.reactive(
      viewModelBuilder: () => FeedViewModel(),
      onModelReady: (model) {
        // model.initialize();
      },
      builder: (context, model, child) {
        return Scaffold(
            body: Column(
              children: [
                Container()
              ],
            )
        );
      },
    );
  }
}