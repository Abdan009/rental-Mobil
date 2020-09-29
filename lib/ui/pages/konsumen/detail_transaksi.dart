part of 'konsumen_page.dart';

class DetailTransaksiKonsumenPage extends StatefulWidget {
  final String idTransaksi;
  DetailTransaksiKonsumenPage(this.idTransaksi);
  @override
  _DetailTransaksiKonsumenPageState createState() =>
      _DetailTransaksiKonsumenPageState();
}

class _DetailTransaksiKonsumenPageState
    extends State<DetailTransaksiKonsumenPage> {
  bool isDelete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Detail Order"),
      ),
      body: StreamBuilder(
          stream: TransaksiServices(idTransaksi: widget.idTransaksi)
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
                                title: Text("Nama penyewa"),
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                trailing: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    transaksi.konsumen.namaLengkap,
                                    style: blackTextFont,
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
                                title: Text("Satus Pembayaran"),
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                trailing: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    transaksi.statusPembayaran,
                                    style: blueTextFont,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text("Satus Order"),
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                trailing: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    transaksi.statusSewa,
                                    style: blueTextFont,
                                    textAlign: TextAlign.end,
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
                              onPressed: (transaksi.statusSewa != "Dibatalkan")
                                  ? () async {
                                      if (transaksi.buktiPembayaran != "") {
                                        Get.to(BuktiPembayaranPage(
                                            transaksi.buktiPembayaran));
                                      } else {
                                        Get.to(PembayaranPage(transaksi));
                                      }
                                    }
                                  : null,
                              color: mainColor,
                              elevation: 0,
                              child: Text(
                                (transaksi.buktiPembayaran == "")
                                    ? "Bayar Sekarang"
                                    : "Lihat Bukti Pembayaran",
                                style: whiteTextFont,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          (!(transaksi.buktiPembayaran != "" &&
                                  transaksi.statusSewa != "Dibatalkan" &&
                                  transaksi.statusPembayaran !=
                                      "Belum Dibayar"))
                              ? Container(
                                  child: (!isDelete)
                                      ? RaisedButton(
                                          onPressed: (transaksi.statusSewa !=
                                                  "Dibatalkan")
                                              ? () async {
                                                  setState(() {
                                                    isDelete = true;
                                                  });
                                                  await TransaksiServices
                                                      .updateTransaksi(
                                                    transaksi.copyWhite(
                                                        statusSewa:
                                                            "Dibatalkan"),
                                                  );
                                                  isDelete = false;
                                                }
                                              : null,
                                          color: Colors.red,
                                          elevation: 0,
                                          child: Text(
                                            "Batalkan",
                                            style: whiteTextFont,
                                          ),
                                        )
                                      : SpinKitDoubleBounce(
                                          color: mainColor,
                                          size: 30,
                                        ))
                              : SizedBox(),
                        ],
                      ),
                    ),
                  )
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
}
