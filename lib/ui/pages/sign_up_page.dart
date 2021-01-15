part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData registrationData;

  SignUpPage(this.registrationData);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User user;
  File pictureFile;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool isSigningUp = false;

  @override
  void initState() {
    super.initState();

    nameController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToLoginPage());

        return;
      },
      child: GeneralPage(
        title: 'Sign Up',
        onBackButtonPressed: () {
          context.read<PageBloc>().add(GoToLoginPage());
        },
        child: Column(
          children: [
            // upload photo profile
            GestureDetector(
              onTap: () async {
                PickedFile pickedFile =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  pictureFile = File(pickedFile.path);
                  setState(() {});
                }
              },
              child: Container(
                width: 110,
                height: 110,
                margin: EdgeInsets.only(top: 26),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: accentColor2,
                    width: 1,
                  ),
                ),
                child: (pictureFile != null)
                    ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(pictureFile),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image:
                                (widget.registrationData.profileImage == null)
                                    ? AssetImage("assets/photo.png")
                                    : FileImage(
                                        widget.registrationData.profileImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
            // input nama
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
              child: Text(
                "Full Name",
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
                controller: nameController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: 'Type your full name'),
              ),
            ),
            // input email
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
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
            // input password
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
            // button sign up
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24),
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: (isSigningUp)
                  ? SpinKitFadingCircle(
                      color: mainColor,
                      size: 50,
                    )
                  : RaisedButton(
                      onPressed: () async {
                        if (!(nameController.text.trim() != "" &&
                            emailController.text.trim() != "" &&
                            passwordController.text.trim() != "")) {
                          Get.snackbar("", "",
                              backgroundColor: 'D9435E'.toColor(),
                              icon: Icon(
                                MdiIcons.closeCircleOutline,
                                color: Colors.white,
                              ),
                              titleText: Text(
                                "Registration Failed",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              messageText: Text(
                                "Please fill all the fields",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ));
                        } else if (passwordController.text.length < 6) {
                          Get.snackbar("", "",
                              backgroundColor: 'D9435E'.toColor(),
                              icon: Icon(
                                MdiIcons.closeCircleOutline,
                                color: Colors.white,
                              ),
                              titleText: Text(
                                "Registration Failed",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              messageText: Text(
                                "Password length minimal 6 character",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ));
                        } else if (!EmailValidator.validate(
                            emailController.text)) {
                          Get.snackbar("", "",
                              backgroundColor: 'D9435E'.toColor(),
                              icon: Icon(
                                MdiIcons.closeCircleOutline,
                                color: Colors.white,
                              ),
                              titleText: Text(
                                "Registration Failed",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              messageText: Text(
                                "Wrong formatted email address",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ));
                        } else {
                          widget.registrationData.profileImage = pictureFile;
                          widget.registrationData.name = nameController.text;
                          widget.registrationData.email = emailController.text;
                          widget.registrationData.password =
                              passwordController.text;

                          setState(() {
                            isSigningUp = true;
                          });

                          imageFileToUpload = pictureFile;

                          SignInSignUpResult result = await AuthServices.signUp(
                              emailController.text,
                              passwordController.text,
                              nameController.text);

                          if (result.user == null) {
                            setState(() {
                              isSigningUp = false;

                              Get.snackbar("", "",
                                  backgroundColor: 'D9435E'.toColor(),
                                  icon: Icon(
                                    MdiIcons.closeCircleOutline,
                                    color: Colors.white,
                                  ),
                                  titleText: Text(
                                    "Sign Up Failed",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  messageText: Text(
                                    result.message,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ));
                            });
                          }
                        }
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: mainColor,
                      child: Text(
                        'Create New Account',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
