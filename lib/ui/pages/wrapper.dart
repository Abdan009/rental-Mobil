part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //AuthServices.signOut();
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);
    bool isLogin= false;
    if(firebaseUser!=null){
      context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
      isLogin = true;
    }
    else{
      isLogin= false;
    }
    return (!isLogin) ? LoginPage() : MainPage();
  }
}
