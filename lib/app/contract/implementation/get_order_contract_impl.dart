import 'package:dartz/dartz.dart';

import '../../../domain/domain.dart';
import '../../app.dart';

class GetOrderContractImpl implements OrderContract {
  final OrderRepo _orderRepo;

  GetOrderContractImpl({required OrderRepo orderRepo}) : _orderRepo = orderRepo;

  @override
  Future<Either<Exception, List<OrderEntity>>> call(Null params) {
    return _orderRepo.getOrders();
  }
}
