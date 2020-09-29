part of 'konsumen_page.dart';

class HomeKonsumen extends StatefulWidget {
  final int initialPage;
  HomeKonsumen({this.initialPage});

  @override
  _HomeKonsumenState createState() => _HomeKonsumenState();
}

class _HomeKonsumenState extends State<HomeKonsumen> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  bool isTransaksi = false;
  bool isMobil = false;
  bool isProfil = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialPage != null) {
      pageController = PageController(initialPage: widget.initialPage);
      currentPage = widget.initialPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Rental Mobil"),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            color: mainColor,
            child: Row(
              children: [
                
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPage = 0;
                          pageController.jumpToPage(0);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.car_rental,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Mobil",
                              style: whiteTextFont,
                            )
                          ],
                        ),
                      ),
                    ),
                    (currentPage == 0)
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 1000),
                              width: MediaQuery.of(context).size.width / 3,
                              height: 5,
                              color: Colors.white,
                            ),
                          )
                        : SizedBox()
                  ],
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPage = 1;
                          pageController.jumpToPage(1);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.payment,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Transaksi",
                              style: whiteTextFont,
                            )
                          ],
                        ),
                      ),
                    ),
                    (currentPage == 1)
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 1000),
                              width: MediaQuery.of(context).size.width / 3,
                              height: 5,
                              color: Colors.white,
                            ),
                          )
                        : SizedBox()
                  ],
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPage = 2;
                          pageController.jumpToPage(2);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Profil",
                              style: whiteTextFont,
                            )
                          ],
                        ),
                      ),
                    ),
                    (currentPage == 2)
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 1000),
                              width: MediaQuery.of(context).size.width / 3,
                              height: 5,
                              color: Colors.white,
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 80),
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                ListMobilRentalPage(),
                ListTransaksiKonsumenPage(),
                ProfilKonsumenPage()
              ],
            ),
          )
        ],
      ),
    );
  }
}
