part of 'widgets.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/ic_home.png"))),
          ),
          Container(
            width: 32,
            height: 32,
            margin: EdgeInsets.symmetric(horizontal: 83),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/ic_transaksi.png"),
              fit: BoxFit.contain,
            )),
          ),
        ],
      ),
    );
  }
}
