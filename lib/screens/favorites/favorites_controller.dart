import 'package:flutter/cupertino.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/models/product.dart';

class FavoritesController {
  
  final listFavoritesProductsNotifier = ValueNotifier<List<Product>>([
    Product(
        name: "Bolo",
        description: "4 queijos",
        price: 48.9,
        imageUrl: AppImage.cake,
        favorite: true),
    Product(
        name: "Pizza",
        description: "4 queijos",
        price: 48.9,
        imageUrl: AppImage.pizza,
        favorite: true)
  ]);
  List<Product> get favoriteProducts => listFavoritesProductsNotifier.value;

  void addFavoriteProduct({required Product product}) {
    favoriteProducts.add(product);
  }

  void removeFavoriteProduct({required index}) {
    favoriteProducts.removeAt(index);
  }

  void removeFavoriteProductId({required id}){
    favoriteProducts.remove(id);
  }
}
