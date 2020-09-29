part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final format = DateFormat("dd-MM-yyyy");
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ulangiPasswordController = TextEditingController();

  DateTime tanggalLahir;
  bool isSignUp = false;
  bool isUploadFoto = false;
  File fotoProfile;
  String fotoProfilURL;

  List<String> listGender = ["Laki-laki", "Perempuan"];
  List<DropdownMenuItem> generateItem() {
    List<DropdownMenuItem> items = [];

    for (var item in listGender) {
      items.add(DropdownMenuItem(
        child: Text(item),
        value: item,
      ));
    }
    return items;
  }

  String selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
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
                    //width: MediaQuery.of(context).size.width / 2 - 20,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: accentColor2),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                        hint: Text("Lenis Kelamin"),
                        isExpanded: true,
                        underline: Container(),
                        value: selectedGender,
                        items: generateItem(),
                        onChanged: (item) {
                          setState(() {
                            selectedGender = item;
                          });
                        })),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    //width: MediaQuery.of(context).size.width-2*defaultMargin,
                    child: FieldInputDua(emailController, 'Email')),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    //width: MediaQuery.of(context).size.width-2*defaultMargin,
                    child: FieldInputDua(
                      tanggalLahirController,
                      "Tanggal Lahir",
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
                            tanggalLahir = date;
                          });
                          return tanggalLahir;
                        });
                      },
                    )
                    ),
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
                Container(                    //width: MediaQuery.of(context).size.width-2*defaultMargin,
                    child: FieldInputDua(alamatController, 'Alamat Lengkap', height: 100,)),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    //width: MediaQuery.of(context).size.width-2*defaultMargin,
                    child: FieldInputDua(passwordController, 'Password',
                        obsecureText: true, maxLines: 1)),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    //width: MediaQuery.of(context).size.width-2*defaultMargin,
                    child: FieldInputDua(
                      ulangiPasswordController,
                      'Ulangi Password',
                      obsecureText: true,
                      maxLines: 1,
                    )),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                (!isSignUp)?Container(
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
                            tanggalLahir != null &&
                            noHpController.text.trim() != "" &&
                            passwordController.text.trim() != "" &&
                            ulangiPasswordController.text.trim() != "")) {
                          Flushbar(
                            key: Key("flushbar"),
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFFFF5C83),
                            message: "Harap isi terlebih dahulu semua data",
                          )..show(context);
                        } else if (passwordController.text.trim() !=
                            ulangiPasswordController.text.trim()) {
                          Flushbar(
                            key: Key("flushbar"),
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFFFF5C83),
                            message: "Password yang anda masukan tidak sama",
                          )..show(context);
                        } else if (!(EmailValidator.validate(
                            emailController.text))) {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFFFF5C83),
                            message: "Email yang anda masukan salah",
                          )..show(context);
                        } else if (passwordController.text.length < 6) {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFFFF5C83),
                            message: "Masukan password minimal 6 digit",
                          )..show(context);
                        } else if (noHpController.text.length <= 10) {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFFFF5C83),
                            message:
                                "Mohon periksa kembali nomor hp yang anda masukan",
                          )..show(context);
                        } else if (selectedGender == null) {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFFFF5C83),
                            message: "Harap pilih jenis kelamin",
                          )..show(context);
                        } 
                        // else if (noHpController.text.trim().substring(0, 4) !=
                        //     "+628") {
                        //   print(noHpController.text.substring(0, 3));
                        //   Flushbar(
                        //     duration: Duration(milliseconds: 1500),
                        //     flushbarPosition: FlushbarPosition.TOP,
                        //     backgroundColor: Color(0xFFFF5C83),
                        //     message:
                        //         "Harap periksa kembali nomor hp,masukan dengan awalan (+62)",
                        //   )..show(context);
                        // } 
                        else {
                          setState(() {
                            isSignUp = true;
                          });
                          if (fotoProfile != null) {
                            setState(() {
                              isUploadFoto = true;
                            });
                            await uploadImage(fotoProfile).then((fotoUrl) {
                              fotoProfilURL = fotoUrl;
                              isUploadFoto = false;
                            });
                          }
                          if (!isUploadFoto) {
                            SignInSignOutResult result =
                                await AuthServices.signUp(
                                    emailController.text,
                                    passwordController.text,
                                    namaController.text,
                                    tanggalLahir,
                                    noHpController.text,
                                    alamatController.text,
                                    selectedGender,
                                    fotoProfilURL?? "",
                                    "Konsumen");
                            if (result.user == null) {
                              setState(() {
                                isSignUp = false;
                              });
                              Flushbar(
                                duration: Duration(milliseconds: 1500),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message: result.message,
                              )..show(context);
                              
                            }else{
                                Get.offAll(Wrapper());
                              }
                          }
                        }
                      }),
                ): Center(
                  child: SpinKitChasingDots(
                    size: 30,
                    color: mainColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun ? ',
                        style: greyTextFont,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(SignUpPage());
                        },
                        child: Text(
                          'Sign In',
                          style: blueTextFont,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        )
        );
  }
}
