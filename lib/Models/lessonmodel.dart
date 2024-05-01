import 'itemmodel.dart';

class LessonModel {
  //Declare Var
  String? requiredId;
  List<ItemModel>? items;
  int? count;
  String? anyKey;

  //Initializing Data Using Constructor
  LessonModel(String requiredId, List<ItemModel> itemmodel, int count,
      String anyKey) {
    this.requiredId = requiredId;
    this.items = itemmodel;
    this.count = count;
    this.anyKey = anyKey;
  }

  //FromJson Is Used To Set The Data To Passing The Above Constructor
  LessonModel.fromJson(Map<String, dynamic> json){
    requiredId = json['requestId']; //Initialize data
    if(json['items'] != null){ //Checking ItemModel Using Condition
      items = <ItemModel>[];
      json['items'].forEach((v){
        items!.add(new ItemModel.fromJson(v));
      });
    }
    count = json['count'];
    anyKey = json['anyKey'];
  }

  //This Method Having Return Type So We Are Get The Data
  Map<String, dynamic> toJson(){
    //Creating Object For Map, Store The Data, Get The Data
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requiredId'] = this.requiredId;
    if(this.items != null){ //This Line Is Using To Store The Data In Above Data Object
      data['items'] = this.items!.map((v) => toJson()).toList();
    }
    data['count'] = this.count;
    data['anyKey'] = this.anyKey;
    return data;
  }
}