import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import '../model/cartItem.dart';
import '../model/favoriteItem.dart';

Future<void> initHive() async {
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);

  Hive.registerAdapter(CartItemAdapter());
  Hive.registerAdapter(FavoriteItemAdapter());

  // await Hive.openBox<CartItem>("cart");
  // await Hive.openBox<FavoriteItem>("favorites");
}
