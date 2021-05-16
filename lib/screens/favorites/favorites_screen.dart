import 'package:flutter/material.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/screens/favorites/widgets/card_favorites_widget.dart';

class FavoritesScreen extends StatelessWidget {
  final productCart = [
    {
      "name": "Chipotle Che...",
      "price": 41.90,
      "description": "Chicken Burger",
      "imageUrl": AppImage.beefBurger,
    },
    {
      "name": "Bolo",
      "price": 41.90,
      "description": "Bolo de chocolate",
      "imageUrl": AppImage.cake,
    },
    {
      "name": "Pizza",
      "price": 41.90,
      "description": "Pizza de calabresa",
      "imageUrl": AppImage.pizza,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: productCart.length,
                  itemBuilder: (context, index) {
                    var product = productCart[index];
                    return CardFavoritesWidget(
                      title: product["name"].toString(),
                      image: product["imageUrl"].toString(),
                      price: double.parse(product["price"].toString()),
                      description: product["description"].toString(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
