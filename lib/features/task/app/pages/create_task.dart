import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/features/task/app/widgets/task_model.dart';

class CreateTaskPage extends StatefulWidget {
  final TaskModel task;

  const CreateTaskPage({Key key, this.task}) : super(key: key);
  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<File> listOfPickedFiles = [];
  bool isStarted = false;
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    widget.task?.taskName != null
        ? titleController.text = widget.task.taskName
        : titleController.text = null;
    widget.task?.taskDescription != null
        ? descriptionController.text = widget.task.taskDescription
        : descriptionController.text = null;
    listOfPickedFiles = widget.task?.listOfMediaFileUrls != null
        ? widget.task.listOfMediaFileUrls
        : [];
    isStarted = widget.task?.started ?? false;
    isCompleted = widget.task?.completed ?? false;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: widget.task == null ? Text('Create Task') : Text('Edit Task'),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          color: Theme.of(context).backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Quantity.mediumSpace,
              ),
              Text(
                'Task Title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      errorStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 0.5,
                          ))),
                ),
              ),
              SizedBox(
                height: Quantity.mediumSpace,
              ),
              Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextField(
                  controller: descriptionController,
                  //expands: true,
                  maxLines: null,
                  minLines: 3,
                  decoration: InputDecoration(
                      errorStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 0.5,
                          ))),
                ),
              ),
              SizedBox(
                height: Quantity.largeSpace,
              ),
              Text(
                'Attachments(optional)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      final file = await pickFile();
                      listOfPickedFiles.addAll(file);
                      setState(() {});
                    },
                    child: Text('Add Attachments'),
                  ),
                  TextButton(
                      onPressed: () {
                        listOfPickedFiles = [];
                        setState(() {});
                      },
                      child: Text('remove all')),
                ],
              ),
              Column(children: [
                for (File item in listOfPickedFiles)
                  Text('File: ${item.path.toString()}'),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Start',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Checkbox(
                      activeColor: Colors.green,
                      value: isStarted,
                      onChanged: (value) {
                        setState(() {
                          isStarted = value;
                        });
                      }),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Completed',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Checkbox(
                      value: isCompleted,
                      onChanged: (value) {
                        setState(() {
                          isCompleted = value;
                        });
                      }),
                ],
              ),
              SizedBox(
                height: Quantity.largeSpace,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(20.0),
                    ),
                    onPressed: () {
                      print('Create mother effing task');
                      Navigator.pop(context);
                    },
                    child: Text(
                        widget.task == null ? 'Create Task' : 'Update Task'),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<File>> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: true,
        allowedExtensions: [
          'svg',
          'jpg',
          'jpeg',
          'png',
          'mp4',
          'pdf',
          'docx',
          'doc',
          'xlsx',
          'mov',
          'mp3',
          'aac',
          'wav',
          'flv',
        ]);
    List<File> files = result.paths.map((path) => File(path)).toList();
    return result == null ? <File>[] : files;
  }
}
