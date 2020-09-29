part of 'widgets.dart';

class CardListMobil extends StatelessWidget {
  final Mobil mobil;
  CardListMobil(this.mobil);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height:200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  image: DecorationImage(
                      image: NetworkImage(mobil.fotoMobil), fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2-50,
                    child: Text(
                      mobil.type,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: blackTextFont.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                                locale: "id_ID",
                                decimalDigits: 0,
                                symbol: "Rp ")
                            .format(int.parse(mobil.harga)) +
                        " /hari",
                    style: blueTextFont.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          child: Text(
                            "Brand ",
                            style: blackTextFont,
                          ),
                        ),
                        Text(
                          ": ${mobil.brand}",
                          style: blackTextFont,
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          child: Text(
                            "Jenis",
                            style: blackTextFont,
                          ),
                        ),
                        Text(
                          ": ${mobil.jenis}",
                          style: blackTextFont,
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          child: Text(
                            "Sisa",
                            style: blackTextFont,
                          ),
                        ),
                        Text(
                          ": ${mobil.jumlah} mobil",
                          style: blackTextFont,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
