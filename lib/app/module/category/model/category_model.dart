class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.count
  });

  int id;
  int count;
  String name;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    count: json["counts"],
    name: json["name"],
  );
  Map<String,dynamic> toJson()=>{
    'id':id,
    "count":count,
    'name':name
  };
}