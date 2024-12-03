import 'dart:convert';

import 'package:flutter/services.dart';

import '../../infrastructure.dart';

class OrderDataSourceImpl implements OrderDataSource {
  @override
  Future<List> getOrders() async {
    try {
      final result = await rootBundle.loadString('assets/jsons/orders.json');
      final json = jsonDecode(result);
      return json as List;
    } catch (e) {
      throw Exception(e);
    }
  }
}
