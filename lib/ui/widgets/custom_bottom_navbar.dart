part of 'widgets.dart';

class CustomBottomNavBar extends StatelessWidget {
  final selectedIndex;
  final Function(int index) onTap;

  CustomBottomNavBar({this.selectedIndex = 0, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/ic_home" +
                              ((selectedIndex == 0)
                                  ? ".png"
                                  : "_normal.png")))),
                ),
                SizedBox(
                  height: 3,
                ),
                Text("Home",
                    style: (selectedIndex == 0)
                        ? GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)
                        : GoogleFonts.poppins(
                            color: "E5E5E5".toColor(),
                            fontSize: 12,
                            fontWeight: FontWeight.w500))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  margin: EdgeInsets.symmetric(horizontal: 90),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/ic_transaksi" +
                        ((selectedIndex == 1) ? ".png" : "_normal.png")),
                    fit: BoxFit.contain,
                  )),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Transaksi",
                  style: (selectedIndex == 1)
                      ? GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)
                      : GoogleFonts.poppins(
                          color: "E5E5E5".toColor(),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/ic_user" +
                        ((selectedIndex == 2) ? ".png" : "_normal.png")),
                    fit: BoxFit.contain,
                  )),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Profile",
                  style: (selectedIndex == 2)
                      ? GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)
                      : GoogleFonts.poppins(
                          color: "E5E5E5".toColor(),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
