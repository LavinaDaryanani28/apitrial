abstract class SignUpEvents{}
class SignUpUserEvents extends SignUpEvents{
  String email;
  String username;
  String password;
  String phonenumber;
  SignUpUserEvents({required this.email,required this.password,required this.username,required this.phonenumber,});
}