part of 'pemilik_page.dart';

class MobilPemilikPage extends StatefulWidget {
  @override
  _MobilPemilikPageState createState() => _MobilPemilikPageState();
}

class _MobilPemilikPageState extends State<MobilPemilikPage> {
  //StreamController streamController = StreamController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(    
          stream: MobilServices().mobil,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              List<Mobil> listMobil = snapshot.data;

              return Container(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: listMobil.length,
                      itemBuilder: (_, index) => Container(
                        margin: EdgeInsets.only(
                          top: (index == 0) ? 20 : 10,
                          bottom: (index == listMobil.length - 1) ? 50 : 0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(AddMobilPage(mobil: listMobil[index],));
                          },
                          child: CardListMobil(listMobil[index]),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(AddMobilPage());
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: defaultMargin),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: mainColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(0.0, 4.0),
                                  blurRadius: 5.0,
                                ),
                              ]),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: SpinKitFadingCube(
                  size: 50,
                  color: mainColor,
                ),
              );
            }
          }),
    );
  }
}
