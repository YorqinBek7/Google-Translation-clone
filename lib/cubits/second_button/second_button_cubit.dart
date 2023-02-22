import 'package:bloc/bloc.dart';
part 'second_button_state.dart';

class SecondButtonCubit extends Cubit<SecondButtonState> {
  Map<String, String> language = {
    'lan': 'Uzbek',
    'code': 'uz',
  };
  SecondButtonCubit() : super(SecondButtonInitial());

  tryToChangeLan({required String lan, required String code}) {
    emit(SecondButtonChanged());
    language = {
      'lan': lan,
      'code': code,
    };
    emit(SecondButtonInitial());
  }
}
