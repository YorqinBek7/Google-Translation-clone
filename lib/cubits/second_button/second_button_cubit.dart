import 'package:bloc/bloc.dart';
part 'second_button_state.dart';

class SecondButtonCubit extends Cubit<SecondButtonState> {
  SecondButtonCubit() : super(SecondButtonInitial(language: 'Uzbek'));

  tryToChangeLan({required String lan}) {
    emit(SecondButtonChanged());
    emit(SecondButtonInitial(language: lan));
  }
}
