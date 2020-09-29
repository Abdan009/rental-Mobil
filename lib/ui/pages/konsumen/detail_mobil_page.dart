part of 'konsumen_page.dart';

class DetailMobilPage extends StatefulWidget {
  final Mobil mobil;
  final bool view;

  DetailMobilPage(this.mobil, {this.view=false});
  @override
  _DetailMobilPageState createState() => _DetailMobilPageState();
}

class _DetailMobilPageState extends State<DetailMobilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.mobil.type,
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(widget.mobil.fotoMobil),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: ListTile(
                      //contentPadding: EdgeInsets.symmetric(vertical: 0),
                      //dense: true,
                      title: Text(
                        "type",
                        style: blackTextFont,
                      ),
                      trailing: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          widget.mobil.type,
                          style: blackTextFont,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      //contentPadding: EdgeInsets.symmetric(vertical: 0),
                      //dense: true,
                      title: Text(
                        "Merek",
                        style: blackTextFont,
                      ),
                      trailing: Text(widget.mobil.brand, style: blackTextFont),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      //contentPadding: EdgeInsets.symmetric(vertical: 0),
                      //dense: true,
                      title: Text(
                        "harga",
                        style: blackTextFont,
                      ),
                      trailing: Text(
                          NumberFormat.currency(
                                      locale: "id_ID",
                                      decimalDigits: 0,
                                      symbol: "Rp ")
                                  .format(int.parse(widget.mobil.harga)) +
                              " /hari",
                          style: blackTextFont),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      //contentPadding: EdgeInsets.symmetric(vertical: 0),
                      //dense: true,
                      title: Text(
                        "Jenis",
                        style: blackTextFont,
                      ),
                      trailing: Text(widget.mobil.jenis, style: blackTextFont),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      //contentPadding: EdgeInsets.symmetric(vertical: 0),
                      //dense: true,
                      title: Text(
                        "Sisa",
                        style: blackTextFont,
                      ),
                      trailing: Text(widget.mobil.jumlah.toString() + " mobil",
                          style: blackTextFont),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  (widget.view ==false)
                      ? Container(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin,
                          height: 40,
                          child: RaisedButton(
                            color: mainColor,
                            onPressed: () {
                              Get.to(PesanKonsumenPage(widget.mobil));
                            },
                            child: Text(
                              "Sewa Mobil",
                              style: whiteTextFont,
                            ),
                          ),
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
