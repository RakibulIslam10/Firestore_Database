class NamesModel {
  String name, address, age,id;

  NamesModel({required this.name, required this.address, required this.age,required this.id});

  factory NamesModel.fromJson(Map<String, dynamic>json,String id) {
    return NamesModel(
      name: json["Name"],
      id: id,
      address: json["Address"],
      age: json["Age"],
    );
  }
}
