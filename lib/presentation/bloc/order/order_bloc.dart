import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../app/app.dart';
import '../../../domain/domain.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderContract _repo;
  OrderBloc({required OrderContract repo})
      : _repo = repo,
        super(OrderInitial()) {
    on<GetOrders>((event, emit) async {
      final result = await _repo.call(null);
      Future.delayed(const Duration(seconds: 3));

      result.fold(
        (failure) => emit(OrderError(message: failure.toString())),
        (orders) {
          final totalCount = orders.length;
          final totalPrice = orders
              .map((order) => double.parse(
                  (order.price)!.replaceAll("\$", "").replaceAll(",", "")))
              .reduce((double a, double b) => a + b);

          final averagePrice = totalPrice / totalCount;
          final numberOfReturns = orders
              .where((order) => order.status?.toUpperCase() == 'RETURNED')
              .length;
          emit(OrderLoaded(
              orders: orders,
              totalCount: totalCount,
              averagePrice: averagePrice,
              numberOfReturns: numberOfReturns));
        },
      );
    });
  }
}
