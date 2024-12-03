import 'package:get_it/get_it.dart';

import 'app/app.dart';
import 'domain/domain.dart';
import 'infrastructure/infrastructure.dart';
import 'presentation/bloc/bloc.dart';

/// Global instance of GetIt for dependency injection.
GetIt getIt = GetIt.instance;

/// Initializes the dependency injection by registering various components.
Future<void> initDependencyInjection() async {
  await _registerSingletons(); // Registers singleton instances.
  _registerDataSources(); // Registers data sources.
  _registerRepositories(); // Registers repositories.
  _registerContracts(); // Registers contracts.
  _registerUsecases(); // Registers use cases.
  _registerFactories(); // Registers factory instances.
}

/// Registers the repositories with GetIt.
void _registerRepositories() {
  getIt.registerLazySingleton<OrderRepo>(
      () => OrderRepoImpl(orderDataSource: getIt()));
}

/// Registers the data sources with GetIt.
void _registerDataSources() {
  getIt.registerLazySingleton<OrderDataSource>(() => OrderDataSourceImpl());
}

/// Registers the contracts with GetIt.
void _registerContracts() {
  getIt.registerLazySingleton<OrderContract>(
      () => GetOrderContractImpl(orderRepo: getIt()));
}

/// Registers the use cases with GetIt.
void _registerUsecases() {}

/// Registers the factory instances with GetIt.
void _registerFactories() {
  getIt.registerFactory<OrderBloc>(() => OrderBloc(repo: getIt()));
}

/// Registers the singletons with GetIt.
Future<void> _registerSingletons() async {}
