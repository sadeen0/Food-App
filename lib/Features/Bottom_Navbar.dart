import 'package:flutter/material.dart';
import 'package:foodapp/Core/Colors.dart';
import 'package:foodapp/Features/FavoritePage.dart';
import 'package:foodapp/Features/HomePage.dart';
import 'package:foodapp/Widgets/AppDrawer.dart';
import 'package:foodapp/Widgets/CustomAppBar.dart';

class ButtomNavbar extends StatefulWidget {
  const ButtomNavbar({super.key});

  @override
  State<ButtomNavbar> createState() => _ButtomNavbarState();
}

class _ButtomNavbarState extends State<ButtomNavbar> {
  int selectedIndex = 0;

    // Set automatically prevents duplicate entries. faster and more effitent than List
  Set<String> favoriteProductIds = {}; // Favorite products set

  // Function to toggle favorite status
  void toggleFavorite(String productId) {
    setState(() {
      if (favoriteProductIds.contains(productId)) {
        favoriteProductIds.remove(productId); 
      } else {
        favoriteProductIds.add(productId); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyOptions = [
      HomePage(
        favoriteProductIds: favoriteProductIds,
        onToggleFavorite: toggleFavorite,
      ),
      FavoritePage(
        favoriteProductIds: favoriteProductIds, 
        onToggleFavorite: toggleFavorite, 
      ),
      Center(child: Text("Profile",
      style: TextStyle(
        fontSize: 18
      ),)),
    ];

    return Scaffold(
      backgroundColor: AppColors.SecondryColor,
      drawer: AppDrawer(),
      appBar: CustomAppBar(),
      body: bodyOptions[selectedIndex], 
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.PrimaryColor,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedItemColor: AppColors.BlackColor,
        unselectedItemColor: AppColors.whiteColor,
        selectedLabelStyle: TextStyle(color: AppColors.BlackColor),
        unselectedLabelStyle: TextStyle(color: AppColors.whiteColor),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: selectedIndex,
      ),
    );
  }
}
