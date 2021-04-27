import 'package:wowca_task/features/user_registration/domain/entity/registered_user.dart';

class RegisteredUserModel extends RegisteredUserEntity {
  final String title;
  final String message;
  final String status;

  RegisteredUserModel({this.title, this.message, this.status})
      : super(
          title: title,
          message: message,
          status: status,
        );

  factory RegisteredUserModel.fromJson(Map<String, dynamic> data) {
    return RegisteredUserModel(
      title: data['title'],
      message: data['message'],
      status: data['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      title: title,
      status: status,
      message: message,
    };
  }

  @override
  List<Object> get props => [
        title,
        message,
        status,
      ];
}
