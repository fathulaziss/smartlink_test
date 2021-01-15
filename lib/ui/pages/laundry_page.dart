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
        // note: Header
        Container(
          width: double.infinity,
          height: 100,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
            if (userState is UserLoaded) {
              if (imageFileToUpload != null) {
                uploadImage(imageFileToUpload).then((downloadURL) {
                  imageFileToUpload = null;
                  BlocProvider.of<UserBloc>(context)
                      .add(UpdateData(profileImage: downloadURL));
                });
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: mainColor, width: 1)),
                    child: Stack(
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (userState.user.profilePicture == ""
                                      ? AssetImage("assets/user_pic.png")
                                      : NetworkImage(
                                          userState.user.profilePicture)),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Wellcome,\n" + userState.user.name,
                    style: blackTextFont.copyWith(fontSize: 14),
                  ),
                ],
              );
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            }
          }),
        ),

        //note : MENU LAUNDRY
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: GestureDetector(
            onTap: () async {
              await AuthServices.signOut();
              BlocProvider.of<UserBloc>(context).add(SignOut());
            },
            child: Container(
              height: 50,
              color: mainColor,
              child: Text(
                "SIGN OUT",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
