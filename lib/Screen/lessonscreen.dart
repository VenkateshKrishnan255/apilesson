import 'package:flutter/material.dart';
import 'package:flutter_apilesson_venkat/Models/lessonmodel.dart';
import '../Models/itemmodel.dart';
import '../Server/lessonapiservice.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {

  late List<ItemModel> _lesson = [];

  @override
  void initState() {
    print('---------------->InitState');
    super.initState();
    _loadlesson(); //Calling
  }

  Future<void> _loadlesson() async{
    try{
      LessonModel response = await LessonApiServer.fetchLessons();
      setState(() {
        _lesson = response.items!;
        print('---------------->RequiredId :${response.requiredId}');
        print('---------------->Count :${response.count}');
        print('---------------->AnyKey :${response.anyKey}');
      });
    }catch (e){
      print("Error Loading Lesson: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson'),
        centerTitle: true,
      ),
      body: _lesson == null || _lesson.isEmpty
      ? const Center(
        child: CircularProgressIndicator(),
      ) : ListView.builder(
        itemCount: _lesson!.length,
        itemBuilder: (context, index){
          return Card(
            child: Column(
              children: [
                Text('Id : ${_lesson[index].id}'),
                Text('Name : ${_lesson[index].name}'),
                Text('CreatedAt : ${_lesson[index].createdAt}'),
                Text('Category : ${_lesson[index].category}'),
                Text('Duration : ${_lesson[index].duration}'),
                Text('Locked : ${_lesson[index].locked}'),
              ],
            ),
          );
        },
      )
    );
  }
}