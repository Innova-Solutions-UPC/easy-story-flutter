import 'package:easy_story_flutter/iam/domain/entities/user.dart';
import 'package:flutter/material.dart';
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
    return Container(
      decoration: SignInBackgroundImage(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 36, top: 130),
              child: Text(
                'Welcome\n To EasyStory',
                style: TextStyle(
                    color: Colors.white, fontSize: 25, fontFamily: 'Roboto'),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
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
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              SignInButton(context, email.text.trim(),
                                  password.text.trim()),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          SignInFooterButtons(context)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
