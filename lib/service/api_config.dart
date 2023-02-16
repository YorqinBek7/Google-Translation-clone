import 'package:diox/diox.dart';

class ApiConfig {
  Dio dio = Dio(
    BaseOptions(
      sendTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );
}
