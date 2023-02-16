import 'package:diox/diox.dart';
import 'package:gtranslation_clone/service/api_config.dart';

class ApiService {
  ApiConfig apiConfig = ApiConfig();
  Future<String> tryToTranslate({
    required String firstLanguage,
    required String secondLanguage,
    required String word,
  }) async {
    try {
      Response response = await apiConfig.dio.get(
        'https://api.mymemory.translated.net/',
        queryParameters: {
          'q': word,
          'langpair': '$firstLanguage|$secondLanguage',
        },
      );
      String translatedWord =
          await response.data['responseData']['translatedText'];

      return translatedWord;
    } catch (e) {
      throw Exception(e);
    }
  }
}
