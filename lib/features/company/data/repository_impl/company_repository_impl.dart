import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/company/data/models/company_model.dart';
import 'package:wowca_task/features/company/data/models/delete_success_model.dart';
import 'package:wowca_task/features/company/data/sources/company_remote_data_source.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';
import 'package:wowca_task/features/company/domain/repository/company_repository.dart';
import 'package:wowca_task/features/user_registration/data/repository/registration_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final NetworkInfo networkInfo;
  final CompanyRemoteDataSource remoteDataSource;

  CompanyRepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, CompanyEntity>> createCompany({
    String companyName,
    String companyAddress,
    String companyDescription,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource
              .createCompany(
            companyName: companyName,
            companyAddress: companyAddress,
            companyDescription: companyDescription,
          )
              .timeout(Duration(seconds: 10), onTimeout: () {
            throw CommonFailure(
                AppStrings.timeOutTitleString, AppStrings.timeOutMessageString);
          }));
        } catch (e) {
          return Left(CommonFailure(e.title, e.message));
        }
      } else {
        return Left(InternetFailure(
            NO_INTERNET_ERROR_TITLE, NO_INTERNET_ERROR_MESSAGE));
      }
    } on ServerException {
      return Left(ServerFailure(
        SERVER_FAILURE_TITLE,
        SERVER_FAILURE_MESSAGE,
      ));
    }
  }

  @override
  Future<Either<Failure, List<CompanyModel>>> getCompanies() async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.getCompanies());
      } else {
        return Left(InternetFailure(
            NO_INTERNET_ERROR_TITLE, NO_INTERNET_ERROR_MESSAGE));
      }
    } on ServerException {
      return Left(ServerFailure(
        SERVER_FAILURE_TITLE,
        SERVER_FAILURE_MESSAGE,
      ));
    }
  }

  @override
  Future<Either<Failure, CompanyModel>> getOneCompany(
      {String companyId}) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(
            await remoteDataSource.getOneCompany(companyId: companyId));
      } else {
        return Left(InternetFailure(
            NO_INTERNET_ERROR_TITLE, NO_INTERNET_ERROR_MESSAGE));
      }
    } on ServerException {
      return Left(ServerFailure(
        SERVER_FAILURE_TITLE,
        SERVER_FAILURE_MESSAGE,
      ));
    }
  }

  @override
  Future<Either<Failure, DeleteSuccessModel>> deleteCompany({String id}) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.deleteCompany(id));
      } else {
        return Left(InternetFailure(
            NO_INTERNET_ERROR_TITLE, NO_INTERNET_ERROR_MESSAGE));
      }
    } on ServerException {
      return Left(ServerFailure(
        SERVER_FAILURE_TITLE,
        SERVER_FAILURE_MESSAGE,
      ));
    }
  }

  @override
  Future<Either<Failure, CompanyEntity>> updateCompany({
    companyId,
    companyName,
    companyLogo,
    companyUsers,
    department,
    companyAddress,
    companyDescription,
    owner,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.updateCompany(
          companyId: companyId,
          companyName: companyName,
          companyLogo: companyLogo,
          companyUsers: companyUsers,
          department: department,
          companyAddress: companyAddress,
          companyDescription: companyDescription,
          owner: owner,
        ));
      } else {
        return Left(InternetFailure(
            NO_INTERNET_ERROR_TITLE, NO_INTERNET_ERROR_MESSAGE));
      }
    } on ServerException {
      return Left(ServerFailure(
        SERVER_FAILURE_TITLE,
        SERVER_FAILURE_MESSAGE,
      ));
    }
  }
}
