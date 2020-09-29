part of 'pages.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bloc.BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
        if (userState is UserLoaded) {
          if (userState.user.role == "Pemilik") {
            return HomePemilikPage();
          } else {
            return HomeKonsumen();
          }
        } else {
          return Center(
            child: SpinKitCubeGrid(
              size: 50,
              color: mainColor,
            ),
          );
        }
      }),
    );
  }
}
