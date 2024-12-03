import 'package:dartz/dartz.dart';

import '../../../domain/domain.dart';
import '../../core/base_callable_class.dart';

abstract class OrderContract extends BaseCallableClass<
    Future<Either<Exception, List<OrderEntity>>>, Null> {}
