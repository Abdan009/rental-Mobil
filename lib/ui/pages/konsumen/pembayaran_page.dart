part of 'konsumen_page.dart';

class PembayaranPage extends StatefulWidget {
  final Transaksi transaksi;
  PembayaranPage(this.transaksi);
  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  String fotoBuktiURL;
  File fotoBuktiFile;
  bool isUploadFoto = false;
  @override
  Widget build(BuildContext context) {
   // print(widget.transaksi.mobil.id);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Pembayaran"),
        ),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Pembayaran Melalui",
                          style: blackTextFont.copyWith(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.secretdiscoveries.com/wp-content/uploads/2016/04/Vector-Logo-Bank-BRI-PNG.png"),
                                  fit: BoxFit.cover)),
                        ),
                        Text(
                          "Nomor Rekening",
                          style: blackTextFont.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "030812431681298437129",
                          style: blackTextFont.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "AN: PT. Eraeru Dermayu",
                          style: blackTextFont.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              "Upload bukti pembayaran",
                              style: blackTextFont.copyWith(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 5),
                          GestureDetector(
                            onTap: () async {
                              (fotoBuktiFile == null)
                                  ? fotoBuktiFile = await getImage()
                                  : fotoBuktiFile = null;
                              setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                image: (fotoBuktiFile != null)
                                    ? DecorationImage(
                                        image: FileImage(fotoBuktiFile),
                                        fit: BoxFit.cover)
                                    : null,
                              ),
                              child: (fotoBuktiFile == null)
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.picture_in_picture,
                                          color: Colors.white,
                                          size: 150,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Tap untuk menambahkan foto",
                                          style: whiteTextFont.copyWith(
                                              fontSize: 20),
                                        )
                                      ],
                                    )
                                  : SizedBox(),
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
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                    (!isUploadFoto)
                        ? Container(
                            child: RaisedButton(
                              onPressed: () async {
                                if (fotoBuktiFile == null) {
                                  Flushbar(
                                    key: Key("flushbar"),
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Color(0xFFFF5C83),
                                    message: "Pilih foto terlebih dahulu",
                                  )..show(context);
                                } else {
                                  setState(() {
                                    isUploadFoto = true;
                                  });
                                  await uploadImage(fotoBuktiFile)
                                      .then((fotoUrl) {
                                    fotoBuktiURL = fotoUrl;
                                  });
                                  isUploadFoto = false;

                                  if (isUploadFoto == false) {
                                   await TransaksiServices.updateTransaksi(widget.transaksi.copyWhite(
                                      buktiPembayaran: fotoBuktiURL,
                                      statusPembayaran: "Validasi"
                                    ));
                                    Get.back(); 
                                  }
                                }
                              },
                              color: mainColor,
                              elevation: 0,
                              child: Text(
                                "Upload Bukti Pembayaran",
                                style: whiteTextFont,
                              ),
                            ),
                          )
                        : Center(
                            child: SpinKitDualRing(
                              color: mainColor,
                              size: 30,
                            ),
                          ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
