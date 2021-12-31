import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './dashboard_view_model.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder
    <DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
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