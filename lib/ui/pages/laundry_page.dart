part of 'pages.dart';

class LaundryPage extends StatefulWidget {
  @override
  _LaundryPageState createState() => _LaundryPageState();
}

class _LaundryPageState extends State<LaundryPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 100,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: mainColor, width: 1),
                    ),
                    child: Stack(
                      children: [
                        // SpinKitFadingCircle(
                        //   color: mainColor,
                        //   size: 50,
                        // ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/user_pic.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Wellcome, \nAzis",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
