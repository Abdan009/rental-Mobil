part of 'pemilik_page.dart';

class TransaksiPemilikPage extends StatefulWidget {
  @override
  _TransaksiPemilikPageState createState() => _TransaksiPemilikPageState();
}

class _TransaksiPemilikPageState extends State<TransaksiPemilikPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, userState) => StreamBuilder(
            stream: TransaksiServices().getDataTransaksi(),
            //TransaksiServices(idKonsumen: (userState as UserLoaded).user.id).transaksi,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                List<Transaksi> listTransaksi = snapshot.data;
                var sortListTransaksi = listTransaksi;
                sortListTransaksi.sort((tran1, tran2) =>
                    tran2.waktuTransaksi.compareTo(tran1.waktuTransaksi));
                List<Transaksi> tranBerhasil = sortListTransaksi.where((element) => element.statusSewa=="Berhasil").toList();
                List<Transaksi> tranProses = sortListTransaksi.where((element) => element.statusSewa!="Berhasil"&&element.statusSewa!="Dibatalkan").toList();
                List<Transaksi> tranDibatalkan = sortListTransaksi.where((element) => element.statusSewa=="Dibatalkan").toList();

                int totalPendapatan=0;
                for(int i=0; i<tranBerhasil.length;i++){
                  totalPendapatan+=tranBerhasil[i].totalHarga;
                }

                return Stack(
                  children: [
                    ListView.builder(
                        itemCount: sortListTransaksi.length,
                        itemBuilder: (_, index) => Container(
                              margin:
                                  EdgeInsets.only(top: (index == 0) ? 150 : 0),
                              child: GestureDetector(
                                  onTap: () {
                                    Get.to(DetailTransaksiPemilikPage(
                                        sortListTransaksi[index]));
                                  },
                                  child: CardTransaksiWidget(
                                      sortListTransaksi[index])),
                            )),
                    Container(
                      // margin: EdgeInsets.symmetric( vertical: 10),
                      child: Card(
                        child: Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            height: 110,
                            // color: mainColor,
                            child: Column(
                              children: [
                                Text(
                                  "Total Pendapatan",
                                  style: blackTextFont.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  NumberFormat.currency(
                                              locale: "id_ID",
                                              decimalDigits: 0,
                                              symbol: "Rp ")
                                          .format(totalPendapatan),
                                  style: blueTextFont.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(height: 5,),
                                Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      child: Row(
                                        children: [
                                          Expanded(child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color:mainColor
                                            ),
                                            
                                             child: Column(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               crossAxisAlignment: CrossAxisAlignment.center,
                                               children: [
                                                 Text("Berhasil", style: whiteTextFont,),
                                                 SizedBox(height: 5,),
                                                  Text(tranBerhasil.length.toString()??"0", style: whiteTextFont,),
                                               ],
                                             ),

                                          )
                                          ),
                                           SizedBox(width: 5,),
                                          Expanded(child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color:Colors.green
                                            ),
                                            
                                             child: Column(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               crossAxisAlignment: CrossAxisAlignment.center,
                                               children: [
                                                 Text("Proses", style: whiteTextFont,),
                                                 SizedBox(height: 5,),
                                                  Text(tranProses.length.toString()??"0", style: whiteTextFont,),
                                               ],
                                             ),

                                          )
                                          ),
                                           SizedBox(width: 5,),
                                          Expanded(child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color:Colors.red
                                            ),
                                            
                                             child: Column(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               crossAxisAlignment: CrossAxisAlignment.center,
                                               children: [
                                                 Text("Dibatalkan", style: whiteTextFont,),
                                                 SizedBox(height: 5,),
                                                  Text(tranDibatalkan.length.toString()??"0", style: whiteTextFont,),
                                               ],
                                             ),

                                          )
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
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
