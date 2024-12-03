import 'package:dartz/dartz.dart';

import '../../domain/domain.dart';
import '../infrastructure.dart';

class OrderRepoImpl extends OrderRepo {
  final OrderDataSource _orderDataSource;

  OrderRepoImpl({required OrderDataSource orderDataSource})
      : _orderDataSource = orderDataSource;
  @override
  Future<Either<Exception, List<OrderEntity>>> getOrders() async {
    try {
      final result = await _orderDataSource.getOrders();
      return Right((result).map((e) => OrderEntity.fromJson(e)).toList());
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
