abstract class LoginEvent {}

class LoginClicked extends LoginEvent{
  final String phone;
  final String password;
  LoginClicked({required this.phone, required this.password});
}

