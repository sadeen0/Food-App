import 'package:flutter/material.dart';
import 'package:foodapp/Core/Colors.dart';
import 'package:foodapp/Core/Models/FoodModel.dart';
import 'package:foodapp/Features/FoodDetail.dart';

class FavoritePage extends StatelessWidget {
  final Set<String> favoriteProductIds;
  final Function(String) onToggleFavorite; 

  const FavoritePage({
    Key? key,
    required this.favoriteProductIds,
    required this.onToggleFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FoodItem> favoriteProducts = Food.where(
      (item) => favoriteProductIds.contains(item.id),
    ).toList();

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: favoriteProducts.isEmpty
            ? Center(
                child: Text(
                  "No favorite items yet",
                  style: TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              )
            : GridView.builder(
                itemCount: favoriteProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  var product = favoriteProducts[index];

                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FoodDetailPage(foodItem: product),
                          ),
                        );
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            // Favorite Icon (Click to Remove)
                            Padding(
                              padding: EdgeInsets.only(right: 20, top: 20),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    onToggleFavorite(
                                        product.id); 
                                  },
                                  child: Icon(
                                    Icons.favorite, 
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(product.imgUrl, width: 80),
                                  Text(product.name),
                                  Text('\$ ${product.price}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              ));
  }
}
