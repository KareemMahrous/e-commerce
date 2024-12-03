import 'package:ecommerce_demo/infrastructure/infrastructure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late OrderDataSource dataSource;

  setUp(() {
    dataSource = OrderDataSourceImpl();
  });

  group('OrderDataSource', () {
    test('getOrders', () async {
      final result = await dataSource.getOrders();

      expect(result, isA<List>());
    });
  });
}
