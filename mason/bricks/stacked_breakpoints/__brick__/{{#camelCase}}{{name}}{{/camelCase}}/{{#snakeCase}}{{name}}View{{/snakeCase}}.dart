import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './{{name.snakeCase()}}_view_model/snakeCase}}.dart';
import 'layouts/large.dart';
import 'layouts/medium.dart';
import 'layouts/small.dart';
import 'layouts/xlarge.dart';
import 'layouts/xsmall.dart';

class {{#titleCase}}{{name}}{{/titleCase}}View extends StatelessWidget {
  const {{#titleCase}}{{name}}{{/titleCase}}View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<{{name}}ViewModel>.reactive(
      viewModelBuilder: () => {{name}}ViewModel(),
      builder: (context, model, child) {
        return BreakpointBuilder(
          builder: (context, breakpoint) {
            switch (breakpoint.window) {
              case WindowSize.xsmall:
                return XSmall{{#titleCase}}{{name}}{{/titleCase}}View();
              case WindowSize.small:
                return Small{{#titleCase}}{{name}}{{/titleCase}}View();
              case WindowSize.medium:
                return Medium{{#titleCase}}{{name}}{{/titleCase}}View();
              case WindowSize.large:
                return Large{{#titleCase}}{{name}}{{/titleCase}}View();
              case WindowSize.xlarge:
                return XLarge{{#titleCase}}{{name}}{{/titleCase}}View();
            }
          },
        );
      },
    );
  }
}
