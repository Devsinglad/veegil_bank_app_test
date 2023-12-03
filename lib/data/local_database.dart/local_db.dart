import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:veegil_bank_app_test/data/local_database.dart/abstractive_hive_storage.dart';

class HiveStorage implements AbstractHive {
  HiveStorage(this.box);
  final Box box;
  @override
  Future<void> put(dynamic key, dynamic value) async {
    await box.put(key, value);
  }

  @override
  T? get<T>(String key) {
    return box.get(key);
  }

  @override
  dynamic getAt(int key) {
    return box.getAt(key);
  }

  @override
  Future<int> add(value) async {
    return await box.add(value);
  }

  @override
  Future<int> clear() async {
    return await box.clear();
  }

  @override
  Future<void> delete(value) async {
    return await box.delete(value);
  }

  @override
  int length() {
    return box.length;
  }

  @override
  Future<void> putAll(Map<String, dynamic> entries) async {
    return await box.putAll(entries);
  }

  @override
  bool doesKeyExist(dynamic key) {
    return box.containsKey(key);
  }
}