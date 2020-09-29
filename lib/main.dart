import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rental_mobil/bloc/blocs.dart';
import 'package:rental_mobil/services/services.dart';
import 'package:rental_mobil/shared/shared.dart';
import 'package:rental_mobil/ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(mainColor);
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => UserBloc())],
        child: GetMaterialApp(
            debugShowCheckedModeBanner: false, home: SplashScreenPage()),
      ),
    );
  }
}
