import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:breakpoints/breakpoints.dart';
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
body: BreakpointBuilder(
builder: (context, breakpoint) {
switch (breakpoint.window) {
case WindowSize.xsmall:
return Small{{#pascalCase}}{{name}}View{{/pascalCase}}();
case WindowSize.small:
return Small{{#pascalCase}}{{name}}View{{/pascalCase}}();
case WindowSize.medium:
return Medium{{#pascalCase}}{{name}}View{{/pascalCase}}();
case WindowSize.large:
return Large{{#pascalCase}}{{name}}View{{/pascalCase}}();
case WindowSize.xlarge:
return Large{{#pascalCase}}{{name}}View{{/pascalCase}}();
}
},
),
);
},
);
}
}