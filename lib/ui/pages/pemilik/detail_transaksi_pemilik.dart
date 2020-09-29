part of 'pemilik_page.dart';

class DetailTransaksiPemilikPage extends StatefulWidget {
  final Transaksi transaksi;

  DetailTransaksiPemilikPage(this.transaksi);
  @override
  _DetailTransaksiPemilikPageState createState() =>
      _DetailTransaksiPemilikPageState();
}

class _DetailTransaksiPemilikPageState
    extends State<DetailTransaksiPemilikPage> {
  bool isDelete = false;
  bool isUpdate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Detail Order"),
      ),
      body: StreamBuilder(
          stream: TransaksiServices(idTransaksi: widget.transaksi.id)
              .getDataTransaksi(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              List<Transaksi> listTransaksi = snapshot.data;
              Transaksi transaksi = listTransaksi.first;
              return Stack(
                children: [
                  ListView(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        child: Container(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(DetailMobilPage(
                                    transaksi.mobil,
                                    view: true,
                                  ));
                                },
                                child: Container(
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              transaksi.mobil.fotoMobil),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              ListTile(
                                title: Text("Type mobil"),
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                trailing: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    transaksi.mobil.type,
                                    style: blackTextFont,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                              ListTile(
                                onTap: (){
                                  Get.to(DetailKonsumenPage(transaksi.konsumen));
                                },
                                title: Text("Nama penyewa"),
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                trailing: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    transaksi.konsumen.namaLengkap,
                                    style: blueTextFont,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text("Lama sewa"),
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                trailing: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    transaksi.lamaSewa.toString() + " hari",
                                    style: blackTextFont,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text("Total harga"),
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                trailing: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    NumberFormat.currency(
                                            locale: "id_ID",
                                            decimalDigits: 0,
                                            symbol: "Rp ")
                                        .format(transaksi.totalHarga),
                                    style: blackTextFont,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text("Waktu order"),
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                trailing: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    transaksi
                                        .waktuTransaksi.dateAndTimeNoMinute,
                                    style: blackTextFont,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text("Waktu awal sewa"),
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                trailing: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    transaksi.waktuSewa.dateAndTimeNoMinute,
                                    style: blackTextFont,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text("Waktu akhir sewa"),
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                trailing: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    transaksi.waktuLamaSewa.dateAndTimeNoMinute,
                                    style: blackTextFont,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text("Status Pembayaran"),
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                trailing: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        transaksi.statusPembayaran,
                                        style: blueTextFont,
                                        textAlign: TextAlign.end,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: (transaksi.statusPembayaran !=
                                                "Belum Dibayar")
                                            ? () {
                                                _alertStatusPembayaran(
                                                    transaksi);
                                              }
                                            : null,
                                        child: Icon(
                                          Icons.settings,
                                          color: (transaksi.statusPembayaran !=
                                                  "Belum Dibayar")
                                              ? mainColor
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text("Status Order"),
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                trailing: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        transaksi.statusSewa,
                                        style: (transaksi.statusSewa !=
                                                "Dibatalkan")
                                            ? blueTextFont
                                            : blueTextFont.copyWith(
                                                color: Colors.red),
                                        textAlign: TextAlign.end,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: ((transaksi.statusSewa !=
                                                "Dibatalkan"&&transaksi.statusSewa!="Pembayaran"))
                                            ? () {
                                                _alertStatusOrder(transaksi);
                                              }
                                            : null,
                                        child: Icon(
                                          Icons.settings,
                                          color: ((transaksi.statusSewa !=
                                                      "Dibatalkan" &&
                                                  transaksi.buktiPembayaran !=
                                                      ""&&transaksi.statusSewa!="Pembayaran"))
                                              ? mainColor
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 90,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(1.0, 0.0),
                          blurRadius: 2.0,
                        ),
                      ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: RaisedButton(
                              onPressed: (transaksi.buktiPembayaran != "")
                                  ? () async {
                                      Get.to(BuktiPembayaranPage(transaksi.buktiPembayaran));
                                    }
                                  : null,
                              color: mainColor,
                              elevation: 0,
                              child: Text(
                                "Lihat Bukti Pembayaran",
                                style: whiteTextFont,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
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
    );
  }

  _alertStatusOrder(Transaksi transaksi) {
    return Alert(
      context: context,
      type:(transaksi.statusSewa!="Berhasil")? null:AlertType.success,
      title: (transaksi.statusSewa!="Berhasil")?"STATUS ORDER":"Order Berhasil",
      desc: (transaksi.statusSewa!="Berhasil")?"Klik Berhasil, apabila order yang dilakukan telah berhasil":"",
      buttons:  (transaksi.statusSewa!="Berhasil")?[
        DialogButton(
          child: Text(
            "Berhasil",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            setState(() {
              isUpdate = true;
            });
            await TransaksiServices.updateTransaksi(
                transaksi.copyWhite(statusSewa: "Berhasil"));
            isUpdate = false;
            Get.back();
          },
          color: mainColor,
        ),
      ]:[],
    ).show();
  }

  _alertStatusPembayaran(Transaksi transaksi) {
    return Alert(
      context: context,
      //type: AlertType.info,
      type:(transaksi.statusPembayaran=="Diterima")?AlertType.success:(transaksi.statusPembayaran=="Ditolak")?AlertType.error:null,
      title: (transaksi.statusPembayaran=="Diterima")?"Telah Diterima":(transaksi.statusPembayaran=="Ditolak")?"Telah Ditolak":"STATUS PEMBAYARAN",
      desc:(transaksi.statusPembayaran!="Diterima"&&transaksi.statusPembayaran!="Ditolak")? "Apakah pembayaran yang telah dilakukan dapat diterima ?":null,
      buttons:(transaksi.statusPembayaran!="Diterima"&&transaksi.statusPembayaran!="Ditolak")? [
        DialogButton(
          child: Text(
            "Terima",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            await TransaksiServices.updateTransaksi(
                transaksi.copyWhite(statusPembayaran: "Diterima",statusSewa: "Berhasil" ));
            Get.back();
          },
          color: mainColor,
        ),
        DialogButton(
            child: Text(
              "Tolak",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () async {
              await TransaksiServices.updateTransaksi(
                  transaksi.copyWhite(statusPembayaran: "Ditolak",statusSewa: "Dibatalkan"   ));
              Get.back();
            },
            color: Colors.red)
      ]:[],
    ).show();
  }
}
