import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class OrderRepo {
  Future<Either<Exception, List<OrderEntity>>> getOrders();
}
