part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class SignUpSuccess extends AppState{}
class SignUpError extends AppState{}
class LoginSuccess extends AppState{}
class LoginError extends AppState{}
class LoginAdminSuccess extends AppState{}
class LoginAdminError extends AppState{}
class ValiduserSuccess extends AppState{}
class ValiduserError extends AppState{}
class ValidemailSuccess extends AppState{}
class ValidemailError extends AppState{}
class UserErrorcase extends AppState{}
class UserLoaded extends AppState{
  List<Usermodel>users;
  UserLoaded(this.users);
}
class uploadProfile extends AppState{}
class SelectUserSucess extends AppState{}
class SelectUserError extends AppState{}
class PhotoprofileError extends AppState{}
class Visibility extends AppState{}
class UnVisibility extends AppState{}