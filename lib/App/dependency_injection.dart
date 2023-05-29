import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pumpkin/Data/data_source/local_data_source.dart';
import 'package:pumpkin/Domain/usecase/categories_usecase.dart';
import 'package:pumpkin/Domain/usecase/add_cart_item_usecase.dart';
import 'package:pumpkin/Domain/usecase/cart_list_usecase.dart';
import 'package:pumpkin/Domain/usecase/delete_cart_item_usecase.dart';
import 'package:pumpkin/Domain/usecase/get_item_count_usecase.dart';
import 'package:pumpkin/Domain/usecase/products_usecase.dart';
import 'package:pumpkin/Domain/usecase/single_category_usecase.dart';
import 'package:pumpkin/Domain/usecase/single_product_usecase.dart';
import 'package:pumpkin/Presentation/cart/ui/cubit/cart_cubit.dart';
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

final sl = GetIt.instance;

Future<void> initModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<EncryptHelper>(() => EncryptHelper());
  sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl(), sl()));
  if (!kIsWeb) {
    sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImple(InternetConnectionChecker()));
  }
  sl.registerLazySingleton<AppWriteClientFactory>(
      () => AppWriteClientFactory());
  final client = await sl<AppWriteClientFactory>().getClient();
  sl.registerLazySingleton<AppServiceClient>(
      () => AppServiceClient(client, sl()));
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  sl.registerLazySingleton<Repository>(
      () => RepositoryImpl(sl(), kIsWeb ? null : sl(), sl()));

  //Usecases

  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));

  sl.registerLazySingleton<ProductsUseCase>(() => ProductsUseCase(sl()));
  sl.registerLazySingleton<CategoriesUseCase>(() => CategoriesUseCase(sl()));
  sl.registerLazySingleton<SingleCategoryUseCase>(
      () => SingleCategoryUseCase(sl()));
  sl.registerLazySingleton<SingleProductUseCase>(
      () => SingleProductUseCase(sl()));
  sl.registerLazySingleton<CartListUseCase>(() => CartListUseCase(sl()));
  sl.registerLazySingleton<AddToCartUseCase>(() => AddToCartUseCase(sl()));
  sl.registerLazySingleton<DeleteCartItemUseCase>(
      () => DeleteCartItemUseCase(sl()));
  sl.registerLazySingleton<GetItemCountUseCase>(
      () => GetItemCountUseCase(sl()));

  //Cubits
  sl.registerFactory(() => ProductCubit(productUseCase: sl()));

  sl.registerFactory(
      () => LoginCubit(loginUseCase: sl(), appPreferences: sl()));
  sl.registerFactory(() => ProductsCubit(productsUseCase: sl()));
  sl.registerFactory(() =>
      CategoriesCubit(categoriesUseCase: sl(), singleCategoryUseCase: sl()));
  sl.registerFactory(() => CartCubit(
      addToCartUseCase: sl(),
      cartListUseCase: sl(),
      deleteCartItemUseCase: sl(),
      getItemCountUseCase: sl()));
}
