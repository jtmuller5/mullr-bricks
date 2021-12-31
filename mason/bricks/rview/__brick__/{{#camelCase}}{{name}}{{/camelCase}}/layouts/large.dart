import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './../{{#snakeCase}}{{name}}ViewModel{{/snakeCase}}.dart';

class Large{{#pascalCase}}{{name}}View{{/pascalCase}} extends ViewModelWidget<{{#pascalCase}}{{name}}ViewModel{{/pascalCase}}> {

  @override
  Widget build(BuildContext context, {{#pascalCase}}{{name}}ViewModel{{/pascalCase}} model) {
    return Row(
      children: [
        const Spacer(),
        Flexible(
            flex: 2,
            child: Container()),
        const Spacer(),
      ],
    );
  }
}