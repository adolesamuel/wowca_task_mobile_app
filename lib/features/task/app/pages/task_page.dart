import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/task/app/bloc/task_bloc.dart';
import 'package:wowca_task/features/task/app/pages/create_task.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/injection_container.dart';

class TaskPage extends StatefulWidget {
  final SignedInUserEntity user;
  final DeptEntity dept;

  const TaskPage({Key key, this.user, this.dept}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  ScrollController _scrollController = ScrollController();

  //TODO: work on list of task page to show tasks better

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateTaskPage()));
        },
      ),
      body: Container(
        child: buildTaskList(context),
      ),
    );
  }

  BlocProvider<TaskBloc> buildTaskList(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TaskBloc>()..add(GetTasksEvent()),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 1.0,
              spreadRadius: 1.0,
              color: Colors.grey.shade300,
            )
          ],
          color: Colors.white,
        ),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskLoadingState) {
              //add loading state item
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ListOfTasksReceivedState) {
              final taskLength = state.tasks.length;

              if (taskLength > 0) {
                return ListView.builder(
                  //extra one adds space for last task item to show.
                  itemCount: state.tasks.length + 1,
                  physics: BouncingScrollPhysics(),
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {},
                );
              } else {
                return Container(
                  width: 70.0,
                  height: 100.0,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                  ),
                );
              }
            } else {
              return Container(
                width: 100.0,
                height: 100.0,
                padding: EdgeInsets.all(Quantity.smallSpace),
                clipBehavior: Clip.hardEdge,
                child: Text('No tasks, please add one'),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
