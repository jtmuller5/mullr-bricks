import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './{{name.snakeCase()}}_view_model/snakeCase}}.dart';

class {{#pascalCase}}{{name}}View{{/pascalCase}} extends StatelessWidget {
  const {{#pascalCase}}{{name}}View{{/pascalCase}}({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder
    <{{#pascalCase}}{{name}}ViewModel{{/pascalCase}}>.reactive(
      viewModelBuilder: () => {{#pascalCase}}{{name}}ViewModel{{/pascalCase}}(),
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