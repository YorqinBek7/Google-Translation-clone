import 'package:bloc/bloc.dart';
part 'first_but_changer_state.dart';

class FirstButChangerCubit extends Cubit<FirstButChangerState> {
  FirstButChangerCubit() : super(FirstButChangerInitial(language: 'English'));

  tryToChangeLan({required String lan}) {
    emit(FirstButChangerChanged());
    emit(FirstButChangerInitial(language: lan));
  }
}
