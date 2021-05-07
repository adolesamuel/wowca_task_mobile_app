import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wowca_task/features/departments/data/models/get_dept.dart';

abstract class DepartmentLocalDataSource {
  Future<void> cacheCreatedDepartmentData(DeptModel dept);
  Future<DeptModel> getDepartmentData();
}

const String CACHED_DEPARTMENT = 'CACHED_DEPARTMENT';

class DepartmentLocalDataSourceImpl implements DepartmentLocalDataSource {
  final SharedPreferences sharedPreferences;

  DepartmentLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheCreatedDepartmentData(DeptModel dept) {
    return sharedPreferences.setString(
        CACHED_DEPARTMENT, json.encode(dept.toJson()));
  }

  @override
  Future<DeptModel> getDepartmentData() {
    String cachedDept = sharedPreferences.getString(CACHED_DEPARTMENT);

    return Future.value(DeptModel.fromJson(json.decode(cachedDept)));
  }
}
