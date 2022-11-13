import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './{{name.snakeCase()}}_view_model/snakeCase}}.dart';

class {{name.pascalCase()}}View extends StatelessWidget {
const {{name.pascalCase()}}View({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return ViewModelBuilder
<{{name.pascalCase()}}ViewModel>.reactive(
viewModelBuilder: () => {{name.pascalCase()}}ViewModel(),
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