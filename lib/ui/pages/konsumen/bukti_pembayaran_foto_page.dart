part of 'konsumen_page.dart';

class BuktiPembayaranPage extends StatelessWidget {
  final String buktiPembayaran;
  BuktiPembayaranPage(this.buktiPembayaran);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("Bukti Pembayaran"),
      ),
      body: Stack(
        children: [
          Center(child: SpinKitDoubleBounce(color: mainColor, size: 50,)),
          Center(
            child: Container(
              child: Image(image: NetworkImage(buktiPembayaran)),
            ),
          ),

        ],
      ),
    );
  }
}