import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/core/helpers/search_widget.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/task/app/bloc/task_bloc.dart';
import 'package:wowca_task/features/task/app/pages/create_task.dart';
import 'package:wowca_task/features/task/domain/entities/task_entity.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/injection_container.dart';

class TaskPage extends StatefulWidget {
  final SignedInUserEntity user;

  const TaskPage({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final taskBloc = sl<TaskBloc>();
  List<TaskEntity> taskList;
  String query = '';

  //TODO: work on list of task page to show tasks better

  @override
  void initState() {
    super.initState();
    taskBloc.add(GetTasksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.tasksText),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateTaskPage()))
              .then((value) => taskBloc.add(GetTasksEvent()));
        },
      ),
      body: Container(
        child: Flex(
          direction: Axis.vertical,
          children: [
            _buildSearch(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(AppStrings.tasksText,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    BlocProvider(
                      create: (context) => taskBloc,
                      child: BlocBuilder<TaskBloc, TaskState>(
                        buildWhen: (previousState, currentState) =>
                            previousState != currentState,
                        builder: (context, state) {
                          if (state is TaskLoadingState) {
                            if (taskList == null || taskList.isEmpty) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  child: ListView.builder(
                                      itemCount: taskList.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                            title: Text(
                                                '${taskList[index].taskName}'));
                                      }));
                            }
                          }
                          if (state is ListOfTasksReceivedState) {
                            if (query.isEmpty) {
                              taskList = state.tasks;
                              if (taskList.isNotEmpty) {
                                return Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: ListView.builder(
                                        itemCount: taskList.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                                '${taskList[index].taskName}'),
                                          );
                                        }));
                              } else {
                                return Center(
                                  child: Text(AppStrings.emptyItemText),
                                );
                              }
                            } else {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: ListView.builder(
                                  itemCount: taskList.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title:
                                          Text('${taskList[index].taskName}'),
                                    );
                                  },
                                ),
                              );
                            }
                          } else {
                            return Center(
                              child: Text('Error Loading Tasks'),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search with Task Name',
        onChanged: _searchItems,
      );

  void _searchItems(String query) {
    final taskListThings = taskList.where((task) {
      final name = task.taskName.toLowerCase();
      final searchLower = query.toLowerCase();
      return name.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.taskList = taskListThings;
    });
  }
}
