import 'package:easy_story_flutter/common/widgets/box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:easy_story_flutter/profile/presentation/profile/widgets/profile_widgets.dart';

class ProfileEditScreen extends StatefulWidget {
  ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments;
    TextEditingController username = new TextEditingController();
    TextEditingController email = new TextEditingController();
    TextEditingController phone = new TextEditingController();
    TextEditingController password = new TextEditingController();
    TextEditingController bio = new TextEditingController();
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Edit Your Profile"),
          backgroundColor: Colors.transparent,
        ),
        floatingActionButton: ProfileButtonEdit(context),
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 36, top: 130),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.000000001,
                    right: MediaQuery.of(context).size.width * 0.10,
                    left: MediaQuery.of(context).size.width * 0.10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 35, top: 35),
                    ),
                    ProfileUserNameField(username),
                    SizedBox(
                      height: 30,
                    ),
                    ProfileEmailField(email),
                    SizedBox(
                      height: 30,
                    ),
                    ProfilePhoneField(phone),
                    SizedBox(
                      height: 30,
                    ),
                    ProfilePasswordField(password),
                    SizedBox(
                      height: 30,
                    ),
                    ProfileBioField(bio),
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
