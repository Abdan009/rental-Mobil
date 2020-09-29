part of 'pemilik_page.dart';

class DetailKonsumenPage extends StatelessWidget {
  final Users user;
  DetailKonsumenPage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Profil Konsumen"),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                      color: mainColor,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://tedas.id/wp-content/uploads/2020/02/11.-perusahaan-terbesar-di-indonesia-3.jpg"),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          image: DecorationImage(
                              image: (user.foto != "")
                                  ? NetworkImage(user.foto)
                                  : NetworkImage(
                                      "https://www.pngarts.com/files/5/Avatar-Face-Transparent-Background-PNG.png"),
                              fit: BoxFit.cover)),
                    ),
                  )),
              Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: ListTile(
                      //contentPadding: EdgeInsets.symmetric(vertical: 0),
                      //dense: true,
                      title: Text(
                        "Nama Lengkap",
                        style: blackTextFont,
                      ),
                      trailing: Text(user.namaLengkap, style: blackTextFont),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      //contentPadding: EdgeInsets.symmetric(vertical: 0),
                      //dense: true,
                      title: Text(
                        "Jenis Kelamin",
                        style: blackTextFont,
                      ),
                      trailing: Text(user.gender, style: blackTextFont),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      //contentPadding: EdgeInsets.symmetric(vertical: 0),
                      //dense: true,
                      title: Text(
                        "Email",
                        style: blackTextFont,
                      ),
                      trailing: Text(user.email, style: blackTextFont),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      //contentPadding: EdgeInsets.symmetric(vertical: 0),
                      //dense: true,
                      title: Text(
                        "Nomor Hp",
                        style: blackTextFont,
                      ),
                      trailing: Text(user.nomorHp, style: blackTextFont),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      //contentPadding: EdgeInsets.symmetric(vertical: 0),
                      //dense: true,
                      title: Text(
                        "Tanggal lahir",
                        style: blackTextFont,
                      ),
                      trailing: Text(user.tanggalLahir.dateAndTimeLahir,
                          style: blackTextFont),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      //contentPadding: EdgeInsets.symmetric(vertical: 0),
                      //dense: true,
                      title: Text(
                        "Alamat",
                        style: blackTextFont,
                      ),
                      trailing: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          user.alamat,
                          style: blackTextFont,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
