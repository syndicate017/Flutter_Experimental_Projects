import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia_project/core/errors/failure.dart';
import 'package:number_trivia_project/core/utilities/input_converter.dart';

void main() {
  late InputConverter inputConverter;

  setUp(
    () {
      inputConverter = InputConverter();
    },
  );

  group("stringToUnsignedInt", () {
    test(
      "Should return an integer when the string represents an unsigned integer",
      () async {
        // Arrange
        const str = "123";
        // Act
        final result = inputConverter.stringToUnsignedInteger(string: str);
        // Assert
        expect(result, equals(const Right(123)));
      },
    );

    test(
      "Should throw an InvalidInputFailure when the string is not an integer",
      () async {
        // Arrange
        const str = "abc";
        // Act
        final result = inputConverter.stringToUnsignedInteger(string: str);
        // Assert
        expect(result, equals(Left(InvalidInputFailure())));
      },
    );

    test(
      "Should throw an InvalidInputFailure when the string is a negative integer",
      () async {
        // Arrange
        const str = "-123";
        // Act
        final result = inputConverter.stringToUnsignedInteger(string: str);
        // Assert
        expect(result, equals(Left(InvalidInputFailure())));
      },
    );
  });
}
