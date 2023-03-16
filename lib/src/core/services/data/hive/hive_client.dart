import 'package:hive/hive.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:injectable/injectable.dart';

const _kBoxName = 'base_box';

@singleton
class HiveMemoryClient {
  late Box<dynamic> _box;

  Future<void> init() async {
    Hive.registerAdapter(SessionModelAdapter());
    _box = await Hive.openBox<dynamic>(_kBoxName);
  }

  bool containsKey(String key) {
    return _box.containsKey(key);
  }

  Future<void> put<T>(String key, T value) async {
    return _box.put(key, value);
  }

  Future<T?> get<T>(String key) async {
    return _box.get(key) as T?;
  }

  Future<void> delete(String key) async {
    return _box.delete(key);
  }
}
