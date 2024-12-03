part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

final class GetOrders extends OrderEvent {}

final class GetOrderDetails extends OrderEvent {
  final String id;

  const GetOrderDetails({required this.id});
}
