part of 'user_bloc.dart';

class UserState {
  final bool existsUser;
  final User user;

  UserState({User user})
      : user = user ?? null,
        existsUser = user != null ? true : false;
  UserState copyWith({User user}) => UserState(user: user ?? this.user);

  UserState stateInitial() => new UserState();
}
