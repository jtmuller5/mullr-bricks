import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../{{name.snakeCase()}}_view_model/snakeCase}}.dart';

class XSmall{{#titleCase}}{{name}}{{/titleCase}}View extends ViewModelWidget<{{#titleCase}}{{name}}{{/titleCase}}ViewModel> {
const XSmall{{#titleCase}}{{name}}{{/titleCase}}View({Key? key}) : super(key: key);

@override
Widget build(BuildContext context, {{name}}ViewModel model) {
  return Container();
}
}