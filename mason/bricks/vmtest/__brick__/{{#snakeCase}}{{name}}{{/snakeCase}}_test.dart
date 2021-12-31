import 'package:flutter_test/flutter_test.dart';
import '../setup/test_helpers.dart';

void main() {

  {{#pascalCase}}{{name}}{{/pascalCase}} _getModel() => {{#pascalCase}}{{name}}{{/pascalCase}}();

  group('{{#pascalCase}}{{name}}{{/pascalCase}}Test -', () {

    setUp(() => registerSharedServices());

    test('When created, email and password are blank', () {

      var model = _getModel();

      expect(model.email, null);
      expect(model.password, null);
      expect(model.ready, false);
    });

    tearDown(() => unregisterService());
  });
}