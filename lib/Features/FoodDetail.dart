import 'package:flutter/material.dart';
import 'package:foodapp/Core/Colors.dart';
import 'package:foodapp/Core/Models/FoodModel.dart';

class FoodDetailPage extends StatelessWidget {
  final FoodItem foodItem;

  const FoodDetailPage({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          foodItem.name,
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: AppColors.SecondryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.network(foodItem.imgUrl, width: 250),
                  ),
                  SizedBox(height: 16),
                  Text(
                    foodItem.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Price: \$${foodItem.price}",
                    style: TextStyle(
                        fontSize: 18,
                        //color: const Color.fromARGB(255, 90, 62, 53),
                        color: AppColors.PrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    foodItem.description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,                  
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
