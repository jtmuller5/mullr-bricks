import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './../{{name.snakeCase()}}_view_model/snakeCase}}.dart';

class Medium{{#pascalCase}}{{name}}View{{/pascalCase}} extends ViewModelWidget<{{#pascalCase}}{{name}}ViewModel{{/pascalCase}}> {

@override
Widget build(BuildContext context, {{#pascalCase}}{{name}}ViewModel{{/pascalCase}} model) {
return Row(
children: [
Flexible(
flex: 2,
child: Container()),
const Spacer(),
],
);
}
}