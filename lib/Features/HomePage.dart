import 'package:flutter/material.dart';
import 'package:foodapp/Core/Colors.dart';
import 'package:foodapp/Core/Models/CategoryModel.dart';
import 'package:foodapp/Core/Models/FoodModel.dart';
import 'package:foodapp/Features/FoodDetail.dart';

class HomePage extends StatefulWidget {
  final Set<String> favoriteProductIds;
  final Function(String) onToggleFavorite; // Callback function

  const HomePage({
    super.key,
    required this.favoriteProductIds,
    required this.onToggleFavorite,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategoryId;
  late List<FoodItem> FilteredProducts;
  // Set automatically prevents duplicate entries. faster and more effitent than List
  // Set<String> favoriteProductIds = {}; // Store favorite product IDs

  @override
  void initState() {
    super.initState();
    FilteredProducts = Food; // All Products
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                child: Image.asset(
                  "assets/images/classic_burger.jpg",
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Categories.length,
                    itemBuilder: (context, index) {
                      var Category = Categories[index];

                      return Padding(
                        padding: const EdgeInsets.only(
                            right:
                                30.0), // as sizedBox between items, but it's for one item(from the right)
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedCategoryId == Category.id) {
                                // If the same category is clicked again, reset the filter
                                selectedCategoryId = null;
                                FilteredProducts =
                                    Food; // Show all products again
                              } else {
                                // Otherwise, filter by selected category
                                selectedCategoryId = Category.id;
                                FilteredProducts = Food.where((item) {
                                  return item.category.id == selectedCategoryId;
                                }).toList();
                              }
                            });
                          },
                          // onTap: () {
                          //   setState(() {
                          //     //print(index); // 0,1,23,...
                          //     selectedCategoryId = Category.id;
                          //     //print(Category.id); // 1,2,3,...

                          //     FilteredProducts = Food.where((item) {
                          //       return item.category.id == selectedCategoryId;
                          //     }).toList();
                          //   });
                          // },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Category.id == selectedCategoryId
                                  ? AppColors.PrimaryColor
                                  : AppColors.whiteColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                children: [
                                  Image.asset(
                                    Category.ImageUrl,
                                    width: 50,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    Category.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Category.id == selectedCategoryId
                                            ? AppColors.whiteColor
                                            : AppColors.BlackColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 16,
              ),
              GridView.builder(
                physics:
                    NeverScrollableScrollPhysics(), //GrideView provides Scroll, and there is a screll for all body, so must there only one scroll.
                itemCount: FilteredProducts.length,

                itemBuilder: (context, index) {
                  var product = FilteredProducts[index];
                  bool isFavorite =
                      widget.favoriteProductIds.contains(product.id);

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
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(children: [
                          Padding(
                            // Favorite Icon
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  widget.onToggleFavorite(product.id);
                                },
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: isFavorite
                                      ? Colors.red
                                      : AppColors.GreyColor,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  FilteredProducts[index].imgUrl,
                                  width: 80,
                                ),
                                Text(FilteredProducts[index].name),
                                Text('\$ ${FilteredProducts[index].price}'),
                              ],
                            ),
                          ),
                        ]),
                      )
                      );
                },
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
              ),
            ],
          ),
        ));
  }
}
