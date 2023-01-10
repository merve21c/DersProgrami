import 'package:dersprogrami/veritaban%C4%B1/kimlikdo%C4%9Frulama.dart';


class Authantication{
  AuthService ? auth;


  Authantication({required this.apps}){

    this.auth = AuthService.instanceFor(app: apps, persistence: Persistence.NONE);
  }

  final apps;



  void checkSign(){
    AuthService.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
}
