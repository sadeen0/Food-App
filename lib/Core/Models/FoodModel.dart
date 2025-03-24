import 'package:foodapp/Core/Models/CategoryModel.dart';

class FoodItem {
  final String id;
  final String name;
  final String imgUrl;
  final double price;
  final String description;
  final CategoryModel category;
  final bool isFavorite;

  FoodItem(
      {required this.id,
      required this.name,
      required this.imgUrl,
      required this.price,
      required this.category,
      this.isFavorite = false,
      this.description = "This is description"});
}

List<FoodItem> Food = [
  FoodItem(
    id: '1',
    name: 'Beef Burger',
    imgUrl:
        'https://www.freepnglogos.com/uploads/burger-png/download-hamburger-burger-png-image-png-image-pngimg-15.png',
    price: 8.5,
    category: Categories[0],
    description: 'A delicious beef burger made with fresh, juicy beef patty, lettuce, cheese, and a soft bun.',
  ),
  FoodItem(
    id: '2',
    name: 'Chicken Burger',
    imgUrl: 'https://www.pngarts.com/files/3/Chicken-Burger-PNG-Photo.png',
    price: 9.5,
    category: Categories[0],
    description: 'A savory chicken burger made with crispy fried chicken breast, lettuce, and mayonnaise.',
  ),
  FoodItem(
    id: '3',
    name: 'Cheese Burger',
    imgUrl: 'https://www.pngarts.com/files/3/Chicken-Burger-PNG-Photo.png',
    price: 8,
    category: Categories[0],
    description: 'A classic cheese burger with a melting slice of cheddar cheese, fresh veggies, and a perfectly grilled patty.',
  ),
  FoodItem(
    id: '4',
    name: 'Chicken Pizza',
    imgUrl:
        'https://graficsea.com/wp-content/uploads/2021/12/Chicken-Supreme-Pizza-.png',
    price: 9,
    category: Categories[1],
    description: 'A flavorful pizza topped with tender chicken, mozzarella cheese, and a tangy tomato sauce.',
  ),
  FoodItem(
    id: '5',
    name: 'Pasta',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
    description: 'A hearty serving of pasta with a creamy sauce, perfect for a filling meal.',
  ),
  FoodItem(
    id: '6',
    name: 'Pasta2',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
    description: 'Delicious pasta served with fresh herbs and a rich, flavorful sauce.',
  ),
  FoodItem(
    id: '7',
    name: 'Pasta3',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
    description: 'A delightful pasta dish with a garlic butter sauce and perfectly seasoned vegetables.',
  ),
  FoodItem(
    id: '8',
    name: 'Pasta4',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
    description: 'A comforting bowl of pasta tossed with a savory tomato sauce and topped with parmesan cheese.',
  ),
];
