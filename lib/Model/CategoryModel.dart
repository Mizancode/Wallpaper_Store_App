class CategoryModel{
  int id;
  String name;
  String imgUrl;
  CategoryModel({required this.id,required this.name,required this.imgUrl});
}
class CategoryModelList{
  List<CategoryModel> list=[
    CategoryModel(
        id: 1,
        name: 'Cars',
        imgUrl: 'https://images.pexels.com/photos/3802510/pexels-photo-3802510.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    CategoryModel(
        id: 2,
        name: 'Peoples',
        imgUrl: 'https://images.pexels.com/photos/4259140/pexels-photo-4259140.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    CategoryModel(
        id: 3,
        name: 'SuperBikes',
        imgUrl: 'https://images.pexels.com/photos/163210/motorcycles-race-helmets-pilots-163210.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    CategoryModel(
        id: 4,
        name: 'Dogs',
        imgUrl: 'https://images.pexels.com/photos/2607544/pexels-photo-2607544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    CategoryModel(
        id: 5,
        name: 'cats',
        imgUrl: 'https://images.pexels.com/photos/1404819/pexels-photo-1404819.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
  ];
}