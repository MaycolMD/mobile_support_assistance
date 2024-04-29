import 'package:flutter/material.dart';
import 'package:project/data/datasources/remote/support_datasource.dart';
import 'package:project/domain/entities/user_support.dart';

class SupportRepository {
  late SupportDataSource _supportDataSource;
  String token = "";

  SupportRepository() {
    _supportDataSource = SupportDataSource();
  }

  Future<List<UserSupport>> getSupports() async =>
      await _supportDataSource.getSupports();

  Future<bool> isGetSupport(String email, String password) async =>
      await _supportDataSource.isGetSupport(email, password);

  Future<bool> executeSupportUser(UserSupport user) async =>
      await _supportDataSource.addSupport(user);

  Future<bool> checkEmailExists(String email) async =>
      await _supportDataSource.checkEmailExists(email);
}
