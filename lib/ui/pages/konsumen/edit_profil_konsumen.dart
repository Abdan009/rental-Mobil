part of 'konsumen_page.dart';
class EditProfilKonsumen extends StatefulWidget {
  final Users user;
  final format = DateFormat("dd-MM-yyyy");
  EditProfilKonsumen(this.user);
  @override
  _EditProfilKonsumenState createState() => _EditProfilKonsumenState();
}

class _EditProfilKonsumenState extends State<EditProfilKonsumen> {
    TextEditingController emailController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ulangiPasswordController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  DateTime tanggalLahir;
  bool isUpdate = false;
  bool isUploadFoto = false;
  File fotoProfile;
  String fotoProfilURL;
  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      namaController.text = widget.user.namaLengkap;
      emailController.text = widget.user.email;
      alamatController.text = widget.user.alamat;
      noHpController.text = widget.user.nomorHp;
      tanggalLahirController.text = widget.user.tanggalLahir.dateAndTimeLahir;
      genderController.text = widget.user.gender;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Profil"),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 2 * defaultMargin,
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  height: 170,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (fotoProfile == null)
                                      ? AssetImage("assets/foto_profil.png")
                                      : FileImage(fotoProfile),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () async {
                            if (fotoProfile == null) {
                              fotoProfile = await getImage();
                            } else {
                              fotoProfile = null;
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage((fotoProfile == null)
                                        ? "assets/btn_add_photo.png"
                                        : "assets/btn_del_photo.png"))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    child: FieldInputDua(namaController, 'Nama Lengkap')),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    child: FieldInputDua(genderController, 'Jenis Kelamin', isEnable: false,textStyle: greyTextFont, )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    //width: MediaQuery.of(context).size.width-2*defaultMargin,
                    child: FieldInputDua(
                      emailController,
                      'Email',
                      isEnable: false,
                      textStyle: greyTextFont
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    //width: MediaQuery.of(context).size.width-2*defaultMargin,
                    child: FieldInputDua(
                      tanggalLahirController,
                      "Tanggal Lahir",
                      isEnable: false,
                      textStyle: greyTextFont
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    //width: MediaQuery.of(context).size.width-2*defaultMargin,
                    child: FieldInputDua(
                      noHpController,
                      'Nomor Hp',
                      typeText: TextInputType.number,
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    //width: MediaQuery.of(context).size.width-2*defaultMargin,
                    child: FieldInputDua(
                  alamatController,
                  'Alamat Lengkap',
                  height: 100,
                )),
                SizedBox(
                  height: 10,
                ),
                (!isUpdate)
                    ? Container(
                        width: 50,
                        //width: MediaQuery.of(context).size.height-2*defaultMargin,
                        child: RaisedButton(
                            child: Text(
                              "Sign Up",
                              style: whiteTextFont,
                            ),
                            color: mainColor,
                            onPressed: () async {
                              if (!(namaController.text.trim() != "" &&
                                  emailController.text.trim() != "" &&
                                  noHpController.text.trim() != ""
                                  )) {
                                Flushbar(
                                  key: Key("flushbar"),
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message:
                                      "Harap isi terlebih dahulu semua data",
                                )..show(context);
                              } else if (passwordController.text.trim() !=
                                  ulangiPasswordController.text.trim()) {
                                Flushbar(
                                  key: Key("flushbar"),
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message:
                                      "Password yang anda masukan tidak sama",
                                )..show(context);
                              } else if (!(EmailValidator.validate(
                                  emailController.text))) {
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message: "Email yang anda masukan salah",
                                )..show(context);
                              }  else if (noHpController.text.length <= 10) {
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message:
                                      "Mohon periksa kembali nomor hp yang anda masukan",
                                )..show(context);
                              } else if (genderController.text.trim()=="") {
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message: "Harap pilih jenis kelamin",
                                )..show(context);
                              } else {
                                setState(() {
                                  isUpdate = true;
                                });
                                if (fotoProfile != null) {
                                  setState(() {
                                    isUploadFoto = true;
                                  });
                                  await uploadImage(fotoProfile)
                                      .then((fotoUrl) {
                                    fotoProfilURL = fotoUrl;
                                    isUploadFoto = false;
                                  });
                                }
                                if (!isUploadFoto) {
                                  await UserServices.updateUser(
                                      widget.user.copyWhite(
                                   // gender: genderController.text,
                                    namaLengkap: namaController.text,
                                    email: emailController.text,
                                    nomorHp: noHpController.text,
                                    alamat: alamatController.text,
                                    foto: fotoProfilURL,
                                  ));

                                  Get.offAll(HomeKonsumen(
                                    initialPage: 2,
                                  ));
                                }
                              }
                            }),
                      )
                    : Center(
                        child: SpinKitChasingDots(
                          size: 30,
                          color: mainColor,
                        ),
                      ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ));
  }
}