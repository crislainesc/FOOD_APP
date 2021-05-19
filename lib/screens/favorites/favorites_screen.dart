import 'package:flutter/material.dart';
import 'package:food_app/models/product.dart';
import 'package:food_app/screens/favorites/favorites_controller.dart';
import 'package:food_app/screens/favorites/widgets/card_favorites_widget.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late FavoritesController controller;

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<FavoritesController>(context);
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: controller.listFavoritesProductsNotifier,
                      builder: (context, List<Product> value, _) {
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            Product product = value[index];
                            return CardFavoritesWidget(
                              title: product.name,
                              image: product.imageUrl,
                              price: product.price,
                              description: product.description,
                              onRemoveFavoriteProduct: () {
                                controller.removeFavoriteProduct(index: index);
                                product.favorite = false;
                                setState(() {
                                  _FavoritesScreenState();
                                });
                              },
                            );
                          },
                        );
                      })),
            ],
          ),
        ),
      ],
    );
  }
}
