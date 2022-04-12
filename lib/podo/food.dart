class Food {
  String img;
  String name;

  Food(
      {required this.img,
        required this.name});

  fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['img'] = img;
    data['name'] = name;
    return data;
  }
}