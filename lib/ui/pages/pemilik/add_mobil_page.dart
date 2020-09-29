part of 'pemilik_page.dart';

class AddMobilPage extends StatefulWidget {
  final Mobil mobil;
  AddMobilPage({this.mobil});
  @override
  _AddMobilPageState createState() => _AddMobilPageState();
}

class _AddMobilPageState extends State<AddMobilPage> {
  TextEditingController typeController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController jenisController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();

  File fotoMobil;
  String fotoMobilURL;
  bool isUploadFoto = false;
  bool isAddMobil = false;
  bool isDelete = false;

  @override
  void initState() {
    super.initState();
    if (widget.mobil != null) {
      typeController.text = widget.mobil.type;
      brandController.text = widget.mobil.brand;
      jenisController.text = widget.mobil.jenis;
      hargaController.text = widget.mobil.harga;
      jumlahController.text = widget.mobil.jumlah.toString();
      fotoMobilURL = widget.mobil.fotoMobil;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
            (widget.mobil != null) ? "${widget.mobil.type}" : "Tambah Mobil"),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () async {
              // if (fotoMobil == null) {
              fotoMobilURL = null;
              fotoMobil = await getImage();

              // }

              //  else {
              //   fotoMobil = null;
              // }
              setState(() {});
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: (fotoMobilURL != null || fotoMobil != null)
                      ? DecorationImage(
                          image: (fotoMobil != null)
                              ? FileImage(fotoMobil)
                              : (fotoMobilURL != null)
                                  ? NetworkImage(widget.mobil.fotoMobil)
                                  : null,
                          fit: BoxFit.cover)
                      : null),
              child: (fotoMobil == null)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.car_repair,
                          color: Colors.white,
                          size: 150,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          (widget.mobil != null)
                              ? "Tap untuk mengganti foto"
                              : "Tap untuk menambahkan foto",
                          style: whiteTextFont.copyWith(fontSize: 20),
                        )
                      ],
                    )
                  : SizedBox(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                children: [
                  FieldInputDua(
                    typeController,
                    "Type",
                    height: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FieldInputDua(brandController, "Brand", height: 50),
                  SizedBox(
                    height: 10,
                  ),
                  FieldInputDua(jenisController, "Jenis", height: 50),
                  SizedBox(
                    height: 10,
                  ),
                  FieldInputDua(
                    hargaController,
                    "Harga",
                    height: 50,
                    typeText: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FieldInputDua(jumlahController, "Jumlah",
                      height: 50, typeText: TextInputType.number),
                  SizedBox(
                    height: 20,
                  ),
                  (!isUploadFoto)
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: mainColor,
                              child: Text(
                                (widget.mobil != null) ? "Update" : "Tambahkan",
                                style: whiteTextFont.copyWith(fontSize: 20),
                              ),
                              onPressed: () async {
                                if (!(typeController.text.trim() != "" &&
                                    brandController.text.trim() != "" &&
                                    jenisController.text.trim() != "" &&
                                    hargaController.text.trim() != "" &&
                                    jumlahController.text.trim() != "")) {
                                  Flushbar(
                                    key: Key("flushbar"),
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Color(0xFFFF5C83),
                                    message:
                                        "Harap isi terlebih dahulu semua data",
                                  )..show(context);
                                } else if (fotoMobilURL == null &&
                                    fotoMobil == null) {
                                  Flushbar(
                                    key: Key("flushbar"),
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Color(0xFFFF5C83),
                                    message: "Harap tambahkan foto mobil",
                                  )..show(context);
                                } else {
                                  setState(() {
                                    isAddMobil = true;
                                  });
                                  if (fotoMobil != null) {
                                    setState(() {
                                      isUploadFoto = true;
                                    });
                                    await uploadImage(fotoMobil)
                                        .then((fotoUrl) {
                                      fotoMobilURL = fotoUrl;
                                    });
                                    if(widget.mobil!=null)
                                    {await deleteImage(widget.mobil.fotoMobil);
                                    }
                                    isUploadFoto = false;
                                  }
                                  if (!isUploadFoto) {
                                    MobilServices.updateMobil(Mobil(
                                        id: (widget.mobil != null)
                                            ? widget.mobil.id
                                            : null,
                                        type: typeController.text,
                                        brand: brandController.text,
                                        harga: hargaController.text,
                                        jenis: jenisController.text,
                                        jumlah:
                                            int.parse(jumlahController.text),
                                        fotoMobil: fotoMobilURL));
                                    Get.offAll(HomePemilikPage(initialPage: 1,));
                                  }
                                }
                              }),
                        )
                      : Center(
                          child: SpinKitDualRing(
                            color: mainColor,
                            size: 30,
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  (widget.mobil != null)
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: (!isDelete)
                              ? RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Colors.red,
                                  child: Text(
                                    "Hapus",
                                    style: whiteTextFont.copyWith(fontSize: 20),
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      
                                    });
                                    isDelete = true;
                                    await deleteImage(widget.mobil.fotoMobil);
                                    MobilServices.deleteMobil(widget.mobil.id);
                                    Get.offAll(HomePemilikPage(initialPage: 1,));
                                  })
                              : SpinKitFadingCube(
                                  size: 30,
                                  color: mainColor,
                                ),
                        )
                      : SizedBox(),

                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
