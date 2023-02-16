part of 'first_but_changer_cubit.dart';

abstract class FirstButChangerState {}

class FirstButChangerInitial extends FirstButChangerState {
  String language;
  FirstButChangerInitial({required this.language});
}

class FirstButChangerChanged extends FirstButChangerState {}
