import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pumpkin/Domain/usecase/Categories_usecase.dart';
import 'package:pumpkin/Domain/usecase/products_usecase.dart';
import 'package:pumpkin/Domain/usecase/single_category_usecase.dart';
import 'package:pumpkin/Domain/usecase/single_product_usecase.dart';
import 'package:pumpkin/Presentation/categories/cubit/categories_cubit.dart';
import 'package:pumpkin/Presentation/login/cubit/login_cubit.dart';
import 'package:pumpkin/Presentation/products/cubit/products_cubit.dart';
import 'package:pumpkin/Presentation/test/cubit/test_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Data/data_source/remote_data_source.dart';
import '../Data/network/api.dart';
import '../Data/network/appwrite_client.dart';
import '../Data/network/network_info.dart';
import '../Data/repository/repository_impl.dart';
import '../Domain/repository/repository.dart';
import '../Domain/usecase/login_usecase.dart';
import '../Domain/usecase/register_usecase.dart';
import '../Presentation/product/cubit/product_cubit.dart';
import 'app_preferences.dart';
import 'encrypt_helper.dart';

final instance = GetIt.instance;

Future<void> initModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<EncryptHelper>(() => EncryptHelper());
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance(), instance()));
  if (!kIsWeb) {
    instance.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImple(InternetConnectionChecker()));
  }
  instance.registerLazySingleton<AppWriteClientFactory>(
      () => AppWriteClientFactory());
  final client = await instance<AppWriteClientFactory>().getClient();
  instance.registerLazySingleton<AppServiceClient>(
      () => AppServiceClient(client, instance()));
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), kIsWeb ? null : instance()));

  instance.registerLazySingleton<LoginUseCase>(() => LoginUseCase(instance()));

  instance.registerFactory(
      () => LoginCubit(loginUseCase: instance(), appPreferences: instance()));

  instance.registerLazySingleton<ProductsUseCase>(
      () => ProductsUseCase(instance()));

  instance.registerFactory(() => ProductsCubit(productsUseCase: instance()));

  instance.registerLazySingleton<CategoriesUseCase>(
      () => CategoriesUseCase(instance()));

  instance.registerLazySingleton<SingleCategoryUseCase>(
      () => SingleCategoryUseCase(instance()));

  instance.registerFactory(() => CategoriesCubit(
      categoriesUseCase: instance(), singleCategoryUseCase: instance()));

  instance.registerLazySingleton<SingleProductUseCase>(
      () => SingleProductUseCase(instance()));

  instance.registerFactory(() => ProductCubit(productUseCase: instance()));
}

// void initLoginModule() {
//   if (!GetIt.I.isRegistered<LoginUseCase>()) {
//     instance
//         .registerLazySingleton<LoginUseCase>(() => LoginUseCase(instance()));
//   }
// }

// void initRegisterModule() {
//   if (!GetIt.I.isRegistered<RegisterUseCase>()) {
//     instance.registerLazySingleton<RegisterUseCase>(
//         () => RegisterUseCase(instance()));
//   }
// }
