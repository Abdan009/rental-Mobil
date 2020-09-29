part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = Colors.blue;
Color accentColor1 = Color(0xFFEFEEEE);
Color accentColor2 = Color(0xFFADADAD);
Color accentColor3 = Color(0xFFFBD460);
Color accentColor4 = Color(0xFFFF8000);

TextStyle whiteTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle blackTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle blueTextFont = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor2, fontWeight: FontWeight.w500);

TextStyle whiteNumberFont = GoogleFonts.openSans()
    .copyWith(color: Colors.white);
TextStyle blackNumberFont = GoogleFonts.openSans()
    .copyWith(color: Colors.black);
