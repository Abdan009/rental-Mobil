part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUser extends UserEvent{
  final String idUser;
  LoadUser(this.idUser);
  @override
  List<Object> get props => [idUser];
  
}
