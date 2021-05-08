class CategoryModel {
  String name;
  bool mainScreen;

  CategoryModel({this.name, this.mainScreen});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mainScreen = json['mainScreen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mainScreen'] = this.mainScreen;
    return data;
  }
}

List<CategoryModel> categoryData =
    categories.map((c) => CategoryModel.fromJson(c)).toList();

var categories = [
  {"name": "All", "mainScreen": false},
  {"name": "Flutter", "mainScreen": false},
  {"name": "Cryptocurrency", "mainScreen": false},
  {"name": "Machine Learning", "mainScreen": false},
  {"name": "Adobe Character Animation", "mainScreen": false},
  {"name": "Sailboats", "mainScreen": false},
  {"name": "Recently Uploaded", "mainScreen": false},
  {"name": "Musics", "mainScreen": false},
  {"name": "Watched", "mainScreen": false},
];
