part of 'pemilik_page.dart';

class ProfilPemilikPage extends StatefulWidget {
  @override
  _ProfilPemilikPageState createState() => _ProfilPemilikPageState();
}

class _ProfilPemilikPageState extends State<ProfilPemilikPage> {
  bool isSignOut = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<UserBloc, UserState>(
      builder: (_, userState) => StreamBuilder(
        stream: UserServices(idUser: (userState as UserLoaded).user.id).user,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            Users user = snapshot.data;
            return Container(
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
                        "Nama Perusahaan",
                        style: blackTextFont,
                      ),
                      trailing: Text("PT Eraeru", style: blackTextFont),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      //contentPadding: EdgeInsets.symmetric(vertical: 0),
                      //dense: true,
                      title: Text(
                        "Nama Pemilik",
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
                        width: MediaQuery.of(context).size.width/2,
                        child: Text(user.alamat,
                            style: blackTextFont, textAlign: TextAlign.end,),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width-2*defaultMargin,
                    height: 40,
                    child: RaisedButton(
                      color: mainColor,
                      onPressed: (){
                        Get.to(EditProfilPemilik(user));
                    },
                    child: Text("Edit", style: whiteTextFont,),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  (!isSignOut)?Container(
                    width: MediaQuery.of(context).size.width-2*defaultMargin,
                    height: 40,
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () async{
                        setState(() {
                          isSignOut=true;
                        });
                        await AuthServices.signOut();
                        Get.offAll(Wrapper());
                        isSignOut=false;
                    },
                    child: Text("Sign Out", style: whiteTextFont,),
                    ),
                  ): SpinKitDoubleBounce(color: mainColor, size: 30,),
                  SizedBox(
                    height: 20,
                  ),
                    ],
                  ),
                  
                ],
              ),
            );
          } else {
            return Center(
              child: SpinKitFadingCube(
                size: 50,
                color: mainColor,
              ),
            );
          }
        },
      ),
    ));
  }
}
