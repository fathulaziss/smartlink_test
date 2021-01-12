part of 'widgets.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                margin: EdgeInsets.symmetric(horizontal: 75),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ic_home.png"))),
              ),
              SizedBox(
                height: 3,
              ),
              Text("Home",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                margin: EdgeInsets.symmetric(horizontal: 75),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/ic_transaksi.png"),
                  fit: BoxFit.contain,
                )),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "Transaksi",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],
      ),
    );
  }
}
