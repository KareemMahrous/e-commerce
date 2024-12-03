part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class OrderLoaded extends OrderState {
  final List<OrderEntity> orders;
  final num totalCount;
  final num averagePrice;
  final num numberOfReturns;
  const OrderLoaded({
    required this.orders,
    required this.totalCount,
    required this.averagePrice,
    required this.numberOfReturns,
  });
}

final class OrderError extends OrderState {
  final String message;
  const OrderError({required this.message});
}
