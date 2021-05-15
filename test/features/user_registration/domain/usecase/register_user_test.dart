import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:wowca_task/features/user_registration/domain/entity/registered_user.dart';
import 'package:wowca_task/features/user_registration/domain/repository/registration_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wowca_task/features/user_registration/domain/usecases/register_user.dart';

class MockRegistrationRepository extends Mock
    implements RegistrationRepository {}

void main() {
  RegisterUser registerUser;
  MockRegistrationRepository mockRegistrationRepository;

//input
  final tName = 'Osaze';
  final tPassword = 'Odeh';
  final tEmail = 'Email';
  final tOrgName = 'OrgName';

  //Output
  final tRegisteredUserEntity =
      RegisteredUserEntity(title: 'a', message: 'b', status: 'OK');

  setUp(() {
    mockRegistrationRepository = MockRegistrationRepository();
    registerUser = RegisterUser(mockRegistrationRepository);
  });

  test('should return registered user', () async {
    //arrange
    when(mockRegistrationRepository.register(
      email: anyNamed('email'),
      password: anyNamed('password'),
      name: anyNamed('name'),
      orgName: anyNamed('orgName'),
    )).thenAnswer((_) async => Right(tRegisteredUserEntity));

    //act
    final result = await registerUser(RegistrationParams(
        email: tEmail, password: tPassword, name: tName, orgName: tOrgName));

    //assert
    expect(result, Right(tRegisteredUserEntity));

    verify(mockRegistrationRepository.register(
      email: tEmail,
      password: tPassword,
      name: tName,
      orgName: tOrgName,
    ));

    verifyNoMoreInteractions(mockRegistrationRepository);
  });
}
