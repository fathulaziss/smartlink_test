part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/logo.png"),
                        fit: BoxFit.contain)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 45),
                child: Text(
                  "Wellcome to \nLaundryKu",
                  style: blackTextFont.copyWith(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 260,
                height: 46,
                child: RaisedButton(
                  onPressed: () {},
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22)),
                  elevation: 0,
                  child: Text(
                    "Get Started",
                    style: whiteTextFont.copyWith(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
