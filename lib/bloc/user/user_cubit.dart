import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:states/models/user.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void selectedUser(User user) {
    emit(new UserSelected(user));
  }

  void setAge(int age) {
    final currentState = state;
    if (currentState is UserSelected) {
      final newUser = currentState.user.copyWith(edad: age);
      emit(new UserSelected(newUser));
    }
  }

  void addProfs(String prof) {
    final currentState = state;
    if (currentState is UserSelected) {
      // final prof1 = currentState.user.profs.add(prof);
      final addProf = [
        ...currentState.user.profs,
        '${currentState.user.profs.length + 1}'
      ];
      final newUser = currentState.user.copyWith(profs: addProf);
      emit(new UserSelected(newUser));
    }
  }

  void deleteUser() {
    emit(UserInitial());
  }
}
