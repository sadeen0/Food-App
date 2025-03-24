class CategoryModel {

  final String id;
  final String name;
  final String ImageUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.ImageUrl
  });
}


// Dummy Data, (must from DataBase)
List<CategoryModel> Categories = [
  CategoryModel(
    id: '1',
    name: 'Burgers',
    ImageUrl: 'assets/images/Categories/burger.png',
  ),
  CategoryModel(
    id: '2',
    name: 'Pizza',
    ImageUrl: 'assets/images/Categories/pizza.png',
  ),
  CategoryModel(
    id: '3',
    name: 'Pasta',
    ImageUrl: 'assets/images/Categories/pasta.png',
  ),
  CategoryModel(
    id: '4',
    name: 'Burgers',
    ImageUrl: 'assets/images/Categories/burger.png',
  ),
  CategoryModel(
    id: '5',
    name: 'Pizza',
    ImageUrl: 'assets/images/Categories/pizza.png',
  ),
  CategoryModel(
    id: '6',
    name: 'Pasta',
    ImageUrl: 'assets/images/Categories/pasta.png',
  ),
 
];


