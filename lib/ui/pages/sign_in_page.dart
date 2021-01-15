part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToSplashPage());

        return;
      },
      child: GeneralPage(
        title: 'Sign In',
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
              child: Text(
                "Email Address",
                style: blackTextFont,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: 'Type your email address'),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
              child: Text(
                "Password",
                style: blackTextFont,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: 'Type your password'),
              ),
            ),
            // Button SignIn
            Container(
              width: double.infinity,
              height: 45,
              margin: EdgeInsets.only(top: 24),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: isSigningIn
                  ? SpinKitFadingCircle(
                      color: mainColor,
                    )
                  : RaisedButton(
                      onPressed: () async {
                        setState(() {
                          isSigningIn = true;
                        });

                        SignInSignUpResult result = await AuthServices.signIn(
                            emailController.text, passwordController.text);

                        if (result.user == null) {
                          setState(() {
                            isSigningIn = false;
                          });

                          Get.snackbar("", "",
                              backgroundColor: 'D9435E'.toColor(),
                              icon: Icon(
                                MdiIcons.closeCircleOutline,
                                color: Colors.white,
                              ),
                              titleText: Text(
                                "Sign In Failed",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              messageText: Text(
                                result.message,
                                style: GoogleFonts.poppins(color: Colors.white),
                              ));
                        }
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: mainColor,
                      child: Text('Sign In', style: whiteTextFont),
                    ),
            ),
            //Button Sign Up
            Container(
              width: double.infinity,
              height: 45,
              margin: EdgeInsets.only(top: 24),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: RaisedButton(
                onPressed: () {
                  context
                      .read<PageBloc>()
                      .add(GoToRegistrationPage(RegistrationData()));
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: accentColor2,
                child: Text(
                  "Create New Account",
                  style: whiteTextFont,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
