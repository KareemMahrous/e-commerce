import 'package:dartz/dartz.dart';
import 'package:ecommerce_demo/domain/domain.dart';
import 'package:ecommerce_demo/infrastructure/repo/order_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/helper_test.mocks.dart';

void main() {
  late OrderRepo repo;
  late MockOrderDataSource dataSource;

  setUp(() {
    dataSource = MockOrderDataSource();
    repo = OrderRepoImpl(orderDataSource: dataSource);
  });

  group('getOrders', () {
    test('should return an empty list of orders', () async {
      const List<OrderEntity> emptyOrders = [];
      when(dataSource.getOrders()).thenAnswer(
        (_) async => emptyOrders,
      );

      final result = await repo.getOrders();
      expect(result, isA<Right<Exception, List<OrderEntity>>>());
      expect(result.getOrElse(() => emptyOrders), emptyOrders);
      verify(dataSource.getOrders()).called(1);
    });

    test('should return an exception', () async {
      Exception exception = Exception('Error');
      when(dataSource.getOrders()).thenThrow(exception);

      final result = await repo.getOrders();
      expect(result, isA<Left<Exception, List<OrderEntity>>>());

      verify(dataSource.getOrders()).called(1);
    });

    test('should return a list of orders', () async {
      List<Map<String, dynamic>> orders = [
        {'id': "1"},
        {'id': "2"},
      ];

      final expected =
          orders.map((order) => OrderEntity.fromJson(order)).toList();
      when(dataSource.getOrders()).thenAnswer(
        (_) async => orders,
      );

      final result = await repo.getOrders();
      expect(result, isA<Right<Exception, List<OrderEntity>>>());
      expect(result.getOrElse(() => expected), expected);
      verify(dataSource.getOrders()).called(1);
    });
  });
}
