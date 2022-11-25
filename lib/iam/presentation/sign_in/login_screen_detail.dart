import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'widgets/sign_in_widgets.dart';

class LoginScreenDetail extends StatefulWidget {
  LoginScreenDetail({Key? key}) : super(key: key);

  @override
  State<LoginScreenDetail> createState() => _LoginScreenDetailState();
}

class _LoginScreenDetailState extends State<LoginScreenDetail> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Container(
                padding: EdgeInsets.only(left: 36, top: 130),
                child: Text(
                  'Welcome\n To EasyStory',
                  style: TextStyle(
                      color: Colors.black, fontSize: 25, fontFamily: 'Roboto'),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 15,
                color: HexColor('#193f6c'),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            SignInEmailField(email),
                            SizedBox(
                              height: 30,
                            ),
                            SignInPasswordField(password),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                SignInButton(context, email.text.trim(),
                                    password.text.trim()),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
