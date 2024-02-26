import 'package:cesla/src/core/mixins/validation_mixin.dart';
import 'package:flutter_test/flutter_test.dart';

class MockValidationMixin with ValidationMixin {}

void main() {
  final mockValidationMixin = MockValidationMixin();

  group('ValidationMixin.isNotEmpty |', () {
    test('should return error message when value is empty', () {
      final result = mockValidationMixin.isNotEmpty('', 'Custom message');
      expect(result, equals('Custom message'));
    });

    test('should return null when value is not empty', () {
      final result = mockValidationMixin.isNotEmpty('Hello');
      expect(result, isNull);
    });

    test('should return error message when value is empty', () {
      final result = mockValidationMixin.isNotEmpty('', 'Custom message');
      expect(result, equals('Custom message'));
    });

    test('should return null when value is not empty', () {
      final result = mockValidationMixin.isNotEmpty('Hello');
      expect(result, isNull);
    });
  });

  group('ValidationMixin.isEmail |', () {
    test('should return error message when email is invalid', () {
      final result = mockValidationMixin.isEmail('invalid_email');
      expect(result, equals('Email não é válido'));
    });

    test('should return null when email is valid', () {
      final result = mockValidationMixin.isEmail('valid_email@example.com');
      expect(result, isNull);
    });
  });

  group('ValidationMixin.isCPF |', () {
    test('should return error message when CPF is invalid', () {
      final result = mockValidationMixin.isCPF('123.456.789-00');
      expect(result, equals('CPF inválido'));
    });

    test('should return null when CPF is valid', () {
      final result = mockValidationMixin.isCPF('123.456.789-09');
      expect(result, isNull);
    });
  });
}
