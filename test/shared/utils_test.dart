import 'package:flutter_test/flutter_test.dart';

import 'package:big_toe_mobile/src/shared/utils.dart';

void main() {
  group("Utils", () {
    test("Should generate random list of 5 ints", () {
      const amountToGenerate = 5;
      const maximumInt = 20;
      final genList = Utils.generateRandomIntList(amountToGenerate, maximumInt);

      expect(genList.length, equals(5));

      for (var number in genList) {
        expect(number, greaterThanOrEqualTo(0));
        expect(number, lessThan(20));
      }
    });

    test("Should have duplicates when generating more than max", () {
      const amountToGenerate = 20;
      const maximumInt = 10;
      final genList = Utils.generateRandomIntList(amountToGenerate, maximumInt);

      expect(genList.length, equals(20));
      final dedupedSet = {...genList};
      expect(genList.length, greaterThan(dedupedSet.length));
    });
  });

  group("Generate random set", () {
    test("Should generate a set of 5 ints", () {
      const amountToGenerate = 5;
      const maximumInt = 10;
      final genList = Utils.generateRandomIntSet(amountToGenerate, maximumInt);

      expect(genList.length, equals(5));
    });

    test("Should throw error when amount is greater than max", () {
      const amountToGenerate = 10;
      const maximumInt = 5;

      expect(() => Utils.generateRandomIntSet(amountToGenerate, maximumInt),
          throwsException);
    });
  });
}
