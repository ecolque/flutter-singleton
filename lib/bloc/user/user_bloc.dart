import 'package:bloc/bloc.dart';
import 'package:states/models/user.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    print(event);
    if (event is ActiveUser) {
      yield state.copyWith(user: event.user);
    } else if (event is ChangeAge) {
      yield state.copyWith(user: state.user.copyWith(age: event.age));
    } else if (event is AddProfs) {
      final newProfs = [...state.user.profs, event.prof];
      yield state.copyWith(user: state.user.copyWith(profs: newProfs));
    } else if (event is DeleteUser) {
      yield state.stateInitial();
    }
  }
}
