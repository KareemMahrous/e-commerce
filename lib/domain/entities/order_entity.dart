import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_entity.g.dart';

@JsonSerializable(createToJson: false)
class OrderEntity with EquatableMixin {
  final String? id;
  final bool? isActive;
  final String? price;
  final String? company;
  final String? picture;
  final String? buyer;
  final List<String>? tags;
  final String? status;
  final String? registered;

  OrderEntity({
    this.id,
    this.isActive,
    this.price,
    this.company,
    this.picture,
    this.buyer,
    this.tags,
    this.status,
    this.registered,
  });

  factory OrderEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderEntityFromJson(json);

  @override
  List<Object?> get props => [
        id,
        isActive,
        price,
        company,
        picture,
        buyer,
        tags,
        status,
        registered,
      ];
}
