abstract class Routes {
  static const String layout = '/';
  static const String orders = 'orders';
  static const String graph = 'graph';

  static const String orderDetails = 'ordersDetails';
}

extension AddSlash on String {
  String get withSlash {
    try {
      if (startsWith("/")) {
        return this;
      } else {
        return "/$this";
      }
    } catch (e) {
      return this;
    }
  }
}
