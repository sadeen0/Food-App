import 'package:flutter/material.dart';
import 'package:foodapp/Core/Colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.PrimaryColor,
      foregroundColor: AppColors.whiteColor,
        actions: [
          IconButton(onPressed: (){},
           icon: Icon(Icons.notifications,
           color: AppColors.whiteColor,)
           )
        ],
        title: Column(
          children: [
            Text("Current Location",
            style: TextStyle(
              color: const Color.fromARGB(218, 255, 255, 255),
              fontSize: 14
            ),),
            SizedBox(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon( Icons.location_on,
                color: AppColors.GreenColor,),
                Text("Jesrusalem, Palestine",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.whiteColor
                ),),
              ],
            )
          ],
        ),
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}