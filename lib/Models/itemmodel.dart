class ItemModel{
  //Declare Var
  String? createdAt;
  String? name;
  int? duration;
  String? category;
  bool? locked;
  String? id;

  //Initializing Data Using Constructor
  ItemModel(String createdAt, String name, int duration, String category, bool locked, String id){
    this.createdAt = createdAt;
    this.name = name;
    this.duration = duration;
    this.category = category;
    this.locked = locked;
    this.id = id;
  }

  //FromJson Is Used To Set The Data To Passing The Above Constructor
  ItemModel.fromJson(Map<String, dynamic> json){
    createdAt = json['createdAt'];
    name = json['name'];
    duration = json['duration'];
    category = json['category'];
    locked = json['locked'];
    id = json['id'];
  }

  //This Method Having Return Type So We Are Get The Data
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['category'] = this.category;
    data['locked'] = this.locked;
    data['id'] = this.id;
    return data;
  }
}