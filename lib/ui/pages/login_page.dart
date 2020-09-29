part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSignIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign In"),
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
                      passwordController,
                      'Password',
                      obsecureText: true,
                      maxLines: 1,
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(SignUpPage());
                        },
                        child: Text(
                          'Lupa Password ?',
                          style: greyTextFont,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 50,
                  //width: MediaQuery.of(context).size.height-2*defaultMargin,
                  child: (!isSignIn)
                      ? RaisedButton(
                          child: Text(
                            "Sign In",
                            style: whiteTextFont,
                          ),
                          color: mainColor,
                          onPressed: () async {
                            if (!(emailController.text.trim() != "" &&
                                passwordController.text.trim() != "")) {
                              Flushbar(
                                key: Key("flushbar"),
                                duration: Duration(milliseconds: 1500),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message: "Harap isi terlebih dahulu semua data",
                              )..show(context);
                            } else if (!(EmailValidator.validate(
                                emailController.text))) {
                              Flushbar(
                                duration: Duration(milliseconds: 1500),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message: "Email yang anda masukan tidak sesuai",
                              )..show(context);
                            } else {
                              setState(() {
                                isSignIn = true;
                              });
                              SignInSignOutResult result =
                                  await AuthServices.signIn(
                                      emailController.text,
                                      passwordController.text);
                              if (result.user == null) {
                                setState(() {
                                  isSignIn = false;
                                });
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message: result.message,
                                )..show(context);
                              }
                            }
                          })
                      : SpinKitDoubleBounce(
                          color: mainColor,
                          size: 30,
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
                        'Belum punya akun ? ',
                        style: greyTextFont,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(SignUpPage());
                        },
                        child: Text(
                          'Daftar',
                          style: blueTextFont,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
