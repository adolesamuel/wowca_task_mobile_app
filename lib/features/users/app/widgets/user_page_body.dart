import 'package:flutter/material.dart';
import 'package:wowca_task/core/helpers/helpers.dart';
import 'package:wowca_task/features/task/domain/entities/task_entity.dart';
import 'package:wowca_task/features/users/app/widgets/search_widget.dart';
import 'package:wowca_task/features/users/app/widgets/user_bottom_sheet.dart';
import 'package:wowca_task/features/users/domain/entity/user_entity.dart';

class UserPageBody extends StatefulWidget {
  @override
  _UserPageBodyState createState() => _UserPageBodyState();
}

class _UserPageBodyState extends State<UserPageBody> {
  TextEditingController userSearchController = TextEditingController();
  List<UserEntity> users;
  String query = '';

  List<UserEntity> listOfUsers = [
    UserEntity(
        userName: 'Gabriel Adekunle',
        userEmail: 'gabbyAde@gmail.com',
        userProfilePicture: null,
        userTasks: [
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'IT'),
    UserEntity(
        userName: 'James Blaze',
        userEmail: 'jameBla@gmail.com',
        userProfilePicture: null,
        userTasks: [
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'Drama'),
    UserEntity(
        userName: 'Olu Jabocs',
        userEmail: 'jbocaOlu@gmail.com',
        userProfilePicture: null,
        userTasks: [
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'Photography'),
    UserEntity(
        userName: 'Ukamaka Diala',
        userEmail: 'amakaIala@gmail.com',
        userProfilePicture: null,
        userTasks: [
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'music studio'),
    UserEntity(
        userName: 'Ahmed musa',
        userEmail: 'ahmedMusa@gmail.com',
        userProfilePicture: null,
        userTasks: [
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'Youth and sports'),
    UserEntity(
        userName: 'Flavour Money',
        userEmail: 'moneyspending@gmail.com',
        userProfilePicture: null,
        userTasks: [
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'Kitchen'),
    UserEntity(
        userName: 'Jacuzzi Doctorhgdghdgdgdgdgdgdgdgdgdgdgdgdgdgdg',
        userEmail: 'JacDoctor@gmail.com',
        userProfilePicture: null,
        userTasks: [
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'Cordinationnzxvdvdvdvdvdvdvdvdvdvdvdvdvd'),
    UserEntity(
        userName: 'Gigi Hadid',
        userEmail: 'gigi@gmail.com',
        userProfilePicture: null,
        userTasks: [
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'Instagram'),
    UserEntity(
        userName: 'Osaze Odemwingeie',
        userEmail: 'wingyingit@gmail.com',
        userProfilePicture: null,
        userTasks: [
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'Makeup'),
    UserEntity(
        userName: 'Chiamaka Egwumbe',
        userEmail: 'chaimagkaEgwu@gmail.com',
        userProfilePicture: null,
        userTasks: [
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'IT'),
    UserEntity(
        userName: 'Bimbo Adaji',
        userEmail: 'bimboAdaji@gmail.com',
        userProfilePicture: null,
        userTasks: [
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
          TaskEntity(),
        ],
        userCompanies: [],
        userDepartment: 'IT'),
  ];

  @override
  void initState() {
    super.initState();
    users = listOfUsers;
  }

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
        buildSearch(),
        Expanded(
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                if (listOfUsers.length - 1 == index) {
                  return Column(
                    children: [
                      UserContainer(
                        user: users[index],
                      ),
                      SizedBox(
                        height: 48.0,
                      )
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      UserContainer(user: users[index]),
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

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search with User Name',
        onChanged: searchItems,
      );

  void searchItems(String query) {
    final users = listOfUsers.where((user) {
      final name = user.userName.toLowerCase();
      final searchLower = query.toLowerCase();
      return name.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.users = users;
    });
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
        showUserBottomSheet(
          context: context,
          user: widget.user,
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
                      Container(
                        width: 200.0,
                        child: Text(
                            toCapital(
                              sentence: widget.user.userName,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Tasks: ${widget.user.userTasks.length}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      Text(
                        'Companies: ${widget.user.userCompanies.length}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          'Department: ${widget.user.userDepartment}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 40.0),
                        child: CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Colors.grey,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0)),
                            child: Image(
                              image: AssetImage(
                                  'lib/core/assets/user_placeholder.png'),
                            ),
                          ),
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
