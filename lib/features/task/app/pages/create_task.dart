import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/core/utils/style.dart';
import 'package:wowca_task/features/task/app/bloc/task_bloc.dart';
import 'package:wowca_task/features/task/domain/entities/task_entity.dart';
import 'package:wowca_task/injection_container.dart';

class CreateTaskPage extends StatefulWidget {
  final TaskEntity task;

  const CreateTaskPage({Key key, this.task}) : super(key: key);
  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final taskBloc = sl<TaskBloc>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<File> listOfPickedFiles = [];
  bool isStarted = false;
  bool isCompleted = false;
  DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    widget.task?.taskName != null
        ? titleController.text = widget.task.taskName
        : titleController.text = null;
    widget.task?.taskDescription != null
        ? descriptionController.text = widget.task.taskDescription
        : descriptionController.text = null;
    //get the date from string
    widget.task?.deadline != null
        ? selectedDate = DateTime.parse(widget.task.deadline)
        : selectedDate = null;
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
        title: widget.task == null
            ? Text(AppStrings.createTaskString)
            : Text(AppStrings.editTaskString),
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

              //Task Name TextField

              Text(
                AppStrings.taskTitleString,
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

              //Description TextField

              Text(
                AppStrings.descriptionText,
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
              SizedBox(height: Quantity.smallSpace),
              //Date Selector
              Row(
                children: [
                  OutlinedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Select Deadline:')),
                  SizedBox(
                    width: Quantity.smallSpace,
                  ),
                  selectedDate == null
                      ? Text('Choose Deadline')
                      : Text(
                          '${DateFormat('dd-MMM-yyyy').format(selectedDate)}'),
                ],
              ),
              SizedBox(height: Quantity.smallSpace),
              Text(
                AppStrings.attachmentString,
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
                    child: Text(AppStrings.addAttachmentString),
                  ),
                  TextButton(
                      onPressed: () {
                        listOfPickedFiles = [];
                        setState(() {});
                      },
                      child: Text(AppStrings.removeAllString)),
                ],
              ),
              Column(children: [
                for (File item in listOfPickedFiles)
                  Text(AppStrings.fileString + '${item.path.toString()}'),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.startString,
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
                    AppStrings.completeString,
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
              BlocProvider(
                create: (context) => taskBloc,
                child: BlocConsumer<TaskBloc, TaskState>(
                  listener: (context, state) {
                    if (state is CreatedTaskState) {
                      //wait 2 seconds for Task creation to show on U.i then pop it
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.pop(context);
                      });
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(20.0),
                              ),
                              onPressed: () {
                                print('Create mother effing task');
                                //  print('selectedDate$selectedDateString');
                                if (widget.task == null) {
                                  //on pressed event to create task.
                                  taskBloc.add(CreateTaskEvent(
                                    taskName: titleController.text,
                                    taskDescription: descriptionController.text,
                                    deadline: DateFormat('yyyy-MM-dd')
                                        .format(selectedDate),
                                    listOfMediaFileUrls: listOfPickedFiles,
                                    started: isStarted,
                                    completed: isCompleted,
                                  ));
                                } else {
                                  print('Update Task');
                                  //on pressed event to update task
                                  taskBloc.add(UpdateTaskEvent(
                                    taskId: widget.task.taskId,
                                    taskName: titleController.text,
                                    taskDescription: descriptionController.text,
                                    deadline: DateFormat('dd-MM-yyyy')
                                        .format(selectedDate),
                                    listOfMediaFileUrls: listOfPickedFiles,
                                    started: isStarted,
                                    completed: isCompleted,
                                  ));
                                }
                              },
                              child: Text(widget.task == null
                                  ? AppStrings.createTaskString
                                  : AppStrings.updateTaskString),
                            )),

                        SizedBox(height: Quantity.mediumSpace),

                        // returns text with error or Task Updated or Task Created Message
                        state is TaskLoadingState
                            ? LinearProgressIndicator()
                            : state is ErrorTaskState
                                ? Text(
                                    state.failure.message,
                                    style: AppStyles.registrationPageTextStyle,
                                  )
                                : state is CreatedTaskState
                                    ? Text(
                                        AppStrings.taskCreated,
                                        style:
                                            AppStyles.registrationPageTextStyle,
                                      )
                                    : state is UpdatedTaskState
                                        ? Text(
                                            AppStrings.taskUpdated,
                                            style: AppStyles
                                                .registrationPageTextStyle,
                                          )
                                        : Text(''),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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
