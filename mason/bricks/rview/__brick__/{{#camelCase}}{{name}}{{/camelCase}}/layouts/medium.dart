import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './../{{#snakeCase}}{{name}}ViewModel{{/snakeCase}}.dart';

class Medium {
  {#pascalCase}
}{{name}}View{{/pascalCase}} extends
ViewModelWidget
<{{#pascalCase}}{{name}}ViewModel{{/pascalCase}}> {

@override
Widget build(BuildContext context, HomeViewModel model) {
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