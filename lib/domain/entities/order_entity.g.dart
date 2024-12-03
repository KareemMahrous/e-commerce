// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderEntity _$OrderEntityFromJson(Map<String, dynamic> json) => OrderEntity(
      id: json['id'] as String?,
      isActive: json['isActive'] as bool?,
      price: json['price'] as String?,
      company: json['company'] as String?,
      picture: json['picture'] as String?,
      buyer: json['buyer'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as String?,
      registered: json['registered'] as String?,
    );
