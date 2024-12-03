import 'package:dartz/dartz.dart';
import 'package:ecommerce_demo/app/app.dart';
import 'package:ecommerce_demo/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/helpers.dart';

void main() {
  late OrderContract contract;
  late MockOrderRepo repo;

  setUp(() {
    repo = MockOrderRepo();
    contract = GetOrderContractImpl(orderRepo: repo);
  });

  group('getOrders', () {
    test('should return a list of orders', () async {
      when(repo.getOrders())
          .thenAnswer((_) => Future.value(right(List<OrderEntity>.empty())));
      final result = await contract.call(null);
      expect(result, isA<Right<Exception, List<OrderEntity>>>());
      expect(result.getOrElse(() => List<OrderEntity>.empty()),
          List<OrderEntity>.empty());
      verify(repo.getOrders()).called(1);
    });

    test('should return a left', () async {
      when(repo.getOrders()).thenAnswer(
          (_) async => Left<Exception, List<OrderEntity>>(Exception('Error')));
      final result = await contract.call(null);
      expect(result, isA<Left<Exception, List<OrderEntity>>>());
      verify(repo.getOrders()).called(1);
    });
  });
}
