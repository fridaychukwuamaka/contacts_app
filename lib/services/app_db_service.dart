import 'package:hive_flutter/hive_flutter.dart';

import '../app/app.logger.dart';
import '../models/contact/contact.dart';

abstract class DbService {
  Future<void> init();
  Future<void> insertData<T>(String boxName, T data, key);
  Future<void> deleteData<T>(String boxName, key);
  Future<void> deleteBox(String boxName);
  T? readData<T>(String boxName, key);
  List<T> readAllData<T>(String boxName);
  Future<void> updateData<T>(String boxName, key, T data);
  Stream<List<T>> watchAllData<T>(String boxName);
}

class AppDbService implements DbService {
  AppDbService() : hive = Hive;

  final HiveInterface hive;
  final _logger = getLogger('AppDbService');

  @override
  Future<void> init() async {
    await hive.initFlutter();
    await _registerAdapters(hive);
    await _openBoxes(hive);
    _logger.i('Hive initialized');
  }

  @override
  Future<void> deleteData<T>(String boxName, key) {
    final box = hive.box<T>(boxName);
    return box.delete(key);
  }

  @override
  Future<void> deleteBox(String boxName) {
    return hive.deleteBoxFromDisk(boxName);
  }

  @override
  T? readData<T>(String boxName, key) {
    final box = hive.box<T>(boxName);
    return box.get(key);
  }

  @override
  List<T> readAllData<T>(String boxName) {
    final box = hive.box<T>(boxName);
    return box.values.toList();
  }

  @override
  Future<void> updateData<T>(String boxName, key, T data) {
    final box = hive.box<T>(boxName);
    return box.put(key, data);
  }

  @override
  Future<void> insertData<T>(String boxName, T data, key) {
    final box = hive.box<T>(boxName);
    return box.put(key, data);
  }

  @override
  Stream<List<T>> watchAllData<T>(String boxName) {
    final box = hive.box<T>(boxName);
    return box.watch().map((event) => box.values.toList());
  }
}

Future<void> _registerAdapters(HiveInterface hive) async {
  if (!hive.isAdapterRegistered(ContactAdapter().typeId)) {
    hive.registerAdapter(ContactAdapter());
  }
}

Future<void> _openBoxes(HiveInterface hive) async {
  final _logger = getLogger('AppDbService');
  try {
    await hive.openBox<Contact>(Contact.boxName);
  } on Exception catch (e) {
    _logger.e('Error opening boxes', e);
  }
}
