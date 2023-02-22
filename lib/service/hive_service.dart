import 'package:hive/hive.dart';

class HiveService {
  static final HiveService instance = HiveService._();
  factory HiveService() => instance;
  HiveService._();
  late Box? box;

  Future<void> openHiveBox() async => box = await Hive.openBox('Saved');

  Future<void> putData(
          {required String firstLan, required String secondLan}) async =>
      await box!.add({
        'firstLan': firstLan,
        'secondLan': secondLan,
      });
}
