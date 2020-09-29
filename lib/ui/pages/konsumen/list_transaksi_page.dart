part of 'konsumen_page.dart';

class ListTransaksiKonsumenPage extends StatefulWidget {
  @override
  _ListTransaksiKonsumenPageState createState() =>
      _ListTransaksiKonsumenPageState();
}

class _ListTransaksiKonsumenPageState extends State<ListTransaksiKonsumenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, userState) => StreamBuilder(
            stream: TransaksiServices(idKonsumen: (userState as UserLoaded).user.id).getDataTransaksi(),
            //TransaksiServices(idKonsumen: (userState as UserLoaded).user.id).transaksi,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                List<Transaksi> listTransaksi = snapshot.data;
                var sortListTransaksi= listTransaksi;
                sortListTransaksi.sort((tran1, tran2)=> tran2.waktuTransaksi.compareTo(tran1.waktuTransaksi));
                return ListView.builder(
                  itemCount: sortListTransaksi.length,
                  itemBuilder: (_, index)=> Container(
                    margin: EdgeInsets.only(bottom: (index==sortListTransaksi.length-1)?20:0),
                    child: GestureDetector(
                      onTap: (){
                        Get.to(DetailTransaksiKonsumenPage(sortListTransaksi[index].id));
                      },
                      child: CardTransaksiWidget(sortListTransaksi[index])),
                  )
                );
              } else {
                return Center(
                  child: SpinKitFoldingCube(color: mainColor, size: 50),
                );
              }
            }),
      ),
    );
  }
}
