part of 'pages.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Get.off(Wrapper(),
        transition: Transition.zoom, duration: Duration(seconds: 1));
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: mainColor),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width-2*defaultMargin,
                // padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/mobil.png"))),
              ),
              Text("Ini Rental Mobil", style: whiteTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}
