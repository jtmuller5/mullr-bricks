import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../{{#snakeCase}}{{name}}ViewModel{{/snakeCase}}.dart';

class Medium{{#titleCase}}{{name}}{{/titleCase}}View extends ViewModelWidget<{{#titleCase}}{{name}}{{/titleCase}}ViewModel> {
const Medium{{#titleCase}}{{name}}{{/titleCase}}View({Key? key}) : super(key: key);

@override
Widget build(BuildContext context, {{name}}ViewModel model) {
  return Container();
}
}