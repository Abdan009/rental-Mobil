part of 'widgets.dart';

class CardTransaksiWidget extends StatelessWidget {
  final Transaksi transaksi;

  CardTransaksiWidget(this.transaksi);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  color:Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(transaksi.mobil.fotoMobil),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5))),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 + 10,
                    child: Text(
                      transaksi.mobil.type,
                      overflow: TextOverflow.ellipsis,
                      style:
                          blackTextFont.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      children: [
                        // Icon(Icons.payment,
                        //     size: 20, color: mainColor),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        Text(
                          NumberFormat.currency(
                                  locale: "id_ID",
                                  decimalDigits: 0,
                                  symbol: "Rp ")
                              .format(transaksi.totalHarga),
                          style: blackTextFont.copyWith(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 4 + 10,
                          child: Row(
                            children: [
                              Icon(Icons.lock_clock,
                                  size: 20, color: mainColor),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                transaksi.lamaSewa.toString() + " hari",
                                style: blackTextFont.copyWith(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Row(
                            children: [
                              Icon(Icons.calendar_view_day_rounded,
                                  size: 20, color: mainColor),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                transaksi.waktuSewa.dateAndTimeNumber,
                                style: blackTextFont.copyWith(fontSize: 12),
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
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 4 + 10,
                          child: Row(
                            children: [
                              Icon(Icons.payments, size: 20, color: mainColor),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4 -
                                    25 +
                                    10,
                                child: Text(
                                  transaksi.statusPembayaran,
                                  overflow: TextOverflow.ellipsis,
                                  style: blackTextFont.copyWith(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4 + 10,
                          child: Row(
                            children: [
                              Icon(Icons.shop, size: 20, color: mainColor),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4 -
                                    25 +
                                    10,
                                child: Text(
                                  transaksi.statusSewa,
                                  overflow: TextOverflow.ellipsis,
                                  style: blackTextFont.copyWith(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
