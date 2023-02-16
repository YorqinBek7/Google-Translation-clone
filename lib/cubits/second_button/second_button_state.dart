part of 'second_button_cubit.dart';

abstract class SecondButtonState {}

class SecondButtonInitial extends SecondButtonState {
  String language;
  SecondButtonInitial({required this.language});
}

class SecondButtonChanged extends SecondButtonState {}
