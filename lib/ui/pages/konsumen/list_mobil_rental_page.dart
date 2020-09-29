part of 'konsumen_page.dart';

class ListMobilRentalPage extends StatefulWidget {
  @override
  _ListMobilRentalPageState createState() => _ListMobilRentalPageState();
}

class _ListMobilRentalPageState extends State<ListMobilRentalPage> {
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
                child: ListView.builder(
                  itemCount: listMobil.length,
                  itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.only(
                      top: (index == 0) ? 20 : 10,
                      bottom: (index == listMobil.length - 1) ? 50 : 0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(DetailMobilPage(listMobil[index]));
                      },
                      child: CardListMobil(listMobil[index]),
                    ),
                  ),
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