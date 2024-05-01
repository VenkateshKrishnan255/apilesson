import 'dart:convert';
import 'package:flutter/services.dart';
import '../Models/lessonmodel.dart';

class LessonApiServer{

  //Reading From Url
  /*static Future<LessonModel> fetchLessons() async {
    final response = await http.get(
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print('${response.body}');
      return LessonModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load lessons');
    }
  }*/

  //Reading From Assets
  static Future<LessonModel> fetchLessons() async {
    print('---------------->Reading From Assets');
    final String response = await rootBundle.loadString('assets/sample_test.json');
    if(response != null){
      Map<String, dynamic> jsonResponse = jsonDecode(response);
      print('---------------->${jsonResponse}');
      return LessonModel.fromJson(jsonResponse);
    }else{
      throw Exception("Failed To Load Lesson");
    }
  }
}