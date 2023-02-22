import 'package:bloc/bloc.dart';
part 'first_but_changer_state.dart';

class FirstButChangerCubit extends Cubit<FirstButChangerState> {
  FirstButChangerCubit() : super(FirstButChangerInitial());
  Map<String, String> language = {
    'lan': 'English',
    'code': 'en',
  };
  tryToChangeLan({required String lan, required String code}) {
    emit(FirstButChangerChanged());
    language = {
      'lan': lan,
      'code': code,
    };
    emit(FirstButChangerInitial());
  }
}
