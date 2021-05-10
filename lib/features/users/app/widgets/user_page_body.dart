import 'package:flutter/material.dart';
import 'package:wowca_task/core/helpers/capitalize_first_letter.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/project/app/widgets/show_project_bottom_sheet.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';
import 'package:wowca_task/features/task/domain/entities/get_task_entity.dart';
import 'package:wowca_task/features/users/domain/entity/user_entity.dart';

class UserPageBody extends StatefulWidget {
  @override
  _UserPageBodyState createState() => _UserPageBodyState();
}

class _UserPageBodyState extends State<UserPageBody> {
  TextEditingController userSearchController = TextEditingController();

  List<UserEntity> listOfUsers = [
    UserEntity(
        userName: 'Gabriel Adekunle',
        userEmail: 'gabbyAde@gmail.com',
        userProfilePicture: null,
        userTasks: [
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'IT'),
    UserEntity(
        userName: 'James Blaze',
        userEmail: 'jameBla@gmail.com',
        userProfilePicture: null,
        userTasks: [
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'Drama'),
    UserEntity(
        userName: 'Olu Jabocs',
        userEmail: 'jbocaOlu@gmail.com',
        userProfilePicture: null,
        userTasks: [
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'Photography'),
    UserEntity(
        userName: 'Ukamaka Diala',
        userEmail: 'amakaIala@gmail.com',
        userProfilePicture: null,
        userTasks: [
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'music studio'),
    UserEntity(
        userName: 'Ahmed musa',
        userEmail: 'ahmedMusa@gmail.com',
        userProfilePicture: null,
        userTasks: [
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'Youth and sports'),
    UserEntity(
        userName: 'Flavour Money',
        userEmail: 'moneyspending@gmail.com',
        userProfilePicture: null,
        userTasks: [
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'Kitchen'),
    UserEntity(
        userName: 'Jacuzzi Doctor',
        userEmail: 'JacDoctor@gmail.com',
        userProfilePicture: null,
        userTasks: [
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'Cordination'),
    UserEntity(
        userName: 'Gigi Hadid',
        userEmail: 'gigi@gmail.com',
        userProfilePicture: null,
        userTasks: [
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'Instagram'),
    UserEntity(
        userName: 'Osaze Odemwingeie',
        userEmail: 'wingyingit@gmail.com',
        userProfilePicture: null,
        userTasks: [
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'Makeup'),
    UserEntity(
        userName: 'Chiamaka Egwumbe',
        userEmail: 'chaimagkaEgwu@gmail.com',
        userProfilePicture: null,
        userTasks: [
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'IT'),
    UserEntity(
        userName: 'Bimbo Adaji',
        userEmail: 'bimboAdaji@gmail.com',
        userProfilePicture: null,
        userTasks: [
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
          GetTaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'IT'),
  ];

  @override
  void dispose() {
    userSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        TextField(
          controller: userSearchController,
          decoration: InputDecoration(
            labelText: 'Search for Users',
            suffixIcon: Icon(Icons.search),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: listOfUsers.length,
              itemBuilder: (context, index) {
                if (listOfUsers.length - 1 == index) {
                  return Column(
                    children: [
                      UserContainer(
                        user: listOfUsers[index],
                      ),
                      SizedBox(
                        height: 48.0,
                      )
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      UserContainer(user: listOfUsers[index]),
                      SizedBox(
                        height: 16.0,
                      )
                    ],
                  );
                }
              }),
        ),
      ],
    );
  }
}

class UserContainer extends StatefulWidget {
  final UserEntity user;

  const UserContainer({Key key, this.user}) : super(key: key);

  @override
  _UserContainerState createState() => _UserContainerState();
}

class _UserContainerState extends State<UserContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showProjectBottomSheet(
          context: context,
        );
      },
      child: PhysicalModel(
        color: Colors.white,
        elevation: 5.0,
        child: Container(
          height: 100.0,
          width: MediaQuery.of(context).size.width * .9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
                      color: Colors.yellow,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              toCapital(
                                sentence: widget.user.userName,
                              ),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Tasks: ${widget.user.userTasks.length}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ],
                      ),
                      Text(
                        'Companies: ${widget.user.userCompanies.length}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      Text(
                        'Department: ${widget.user.userDepartment}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '45%',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
