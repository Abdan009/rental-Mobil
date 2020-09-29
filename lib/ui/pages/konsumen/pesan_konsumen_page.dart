part of 'konsumen_page.dart';

class PesanKonsumenPage extends StatefulWidget {
  final format = DateFormat("dd-MM-yyyy");

  final Mobil mobil;
  PesanKonsumenPage(this.mobil);
  @override
  _PesanKonsumenPageState createState() => _PesanKonsumenPageState();
}

class _PesanKonsumenPageState extends State<PesanKonsumenPage> {
  TextEditingController lamaSewa = TextEditingController(text: "0");
  TextEditingController waktuAwalPenyewaanController = TextEditingController();

  DateTime waktuAwalPenyewaan;
  DateTime waktuLamaSewa;
  int totalHarga = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Sewa Mobil",
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, userState) => Container(
          margin: EdgeInsets.only(
              top: 20, left: defaultMargin, right: defaultMargin),
          child: ListView(
            children: [
              FieldInputDua(
                lamaSewa,
                "Lama Sewa (hari)",
                height: 50,
                inputFormater: [FilteringTextInputFormatter.digitsOnly],
                typeText: TextInputType.numberWithOptions(),
                onChange: (item) {
                  setState(() {
                    totalHarga =
                        int.parse(item) * int.parse(widget.mobil.harga);
                    if (item == null) {
                      totalHarga = 0;
                    }
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              FieldInputDua(
                waktuAwalPenyewaanController,
                "Waktu Awal Penyewaan",
                suffixIcon: Icon(Icons.calendar_today),
                calendar: true,
                format: widget.format,
                dateTime: (context, currentValue) {
                  return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100))
                      .then((date) {
                    setState(() {
                      waktuAwalPenyewaan = date;
                      if (date != null) {
                        // umurController.text =
                        //     (DateTime.now().year - date.year).toString();
                        waktuLamaSewa = waktuAwalPenyewaan
                            .add(Duration(days: int.parse(lamaSewa.text)));
                      }
                    });
                    return waktuAwalPenyewaan;
                  });
                },
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "Total harga",
                    style: blackTextFont.copyWith(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    NumberFormat.currency(
                            locale: "id_ID", decimalDigits: 0, symbol: "Rp ")
                        .format(totalHarga),
                    style: blackTextFont.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: RaisedButton(
                  color: mainColor,
                  onPressed: () async {
                    if (!(lamaSewa.text.trim() != "" &&
                        waktuAwalPenyewaan != null &&
                        lamaSewa.text.trim() != "0")) {
                      Flushbar(
                        key: Key("flushbar"),
                        duration: Duration(milliseconds: 1500),
                        flushbarPosition: FlushbarPosition.TOP,
                        backgroundColor: Color(0xFFFF5C83),
                        message: "Harap isi terlebih dahulu semua data",
                      )..show(context);
                    } else if (waktuAwalPenyewaan
                        .isBefore(DateTime.now().add(Duration(days: 2)))) {
                      Flushbar(
                        key: Key("flushbar"),
                        duration: Duration(milliseconds: 1500),
                        flushbarPosition: FlushbarPosition.TOP,
                        backgroundColor: Color(0xFFFF5C83),
                        message:
                            "Awal waktu penyewaan minimal 2 hari sebelum hari penyewaan",
                      )..show(context);
                    } else {
                      TransaksiServices.updateTransaksi(Transaksi(
                          idMobil: widget.mobil.id,
                          idKonsumen: (userState as UserLoaded).user.id,
                          konsumen: (userState as UserLoaded).user,
                          mobil: widget.mobil,
                          totalHarga: totalHarga,
                          lamaSewa: int.parse(lamaSewa.text),
                          waktuTransaksi: DateTime.now(),
                          waktuSewa: waktuAwalPenyewaan,
                          waktuLamaSewa: waktuLamaSewa,
                          statusPembayaran: "Belum Dibayar",
                          buktiPembayaran: "",
                          statusSewa: "Pembayaran",
                          ));
                      await MobilServices.updateMobil(widget.mobil.copyWith(
                        jumlah: widget.mobil.jumlah-1
                      ));
                      
                      Get.offAll(HomeKonsumen(initialPage: 1,));
                    }
                  },
                  child: Text(
                    "Pesan Sekarang",
                    style: whiteTextFont,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void totalHargaF() {
    setState(() {
      totalHarga = int.parse(lamaSewa.text) * int.parse(widget.mobil.harga);
    });
  }
}
