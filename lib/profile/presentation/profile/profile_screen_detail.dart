import 'package:easy_story_flutter/profile/api/profile_api.dart';
import 'package:easy_story_flutter/profile/infrastructure/models/profile_model.dart';
import 'package:easy_story_flutter/profile/presentation/profile/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/drawer_widget.dart';

class ProfileScreenDetail extends StatefulWidget {
  @override
  ProfileScreenDetailState createState() => new ProfileScreenDetailState();
}

class ProfileScreenDetailState extends State<ProfileScreenDetail>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Profile"),
        backgroundColor: Colors.transparent,
      ),
      drawer: EasyStoryDrawerMenu(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: ProfileBackgroundImage(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 134, 34, 26),
                            child: IconButton(
                              color: Colors.white,
                              icon: const Icon(Icons.logout),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Mi Perfil",
                            style: TextStyle(
                              color: Color.fromARGB(255, 34, 24, 121),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 0, 26, 141),
                            child: IconButton(
                              color: Colors.white,
                              icon: const Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 150.0,
                      backgroundImage: NetworkImage(
                          "https://media.istockphoto.com/photos/portrait-of-successful-black-male-modern-day-student-holding-picture-id1311634222?k=20&m=1311634222&s=612x612&w=0&h=1a0XDWnZNPjk_5n7maZdzowaDfBcBohwoiZZF69qS9A="),
                      backgroundColor: Colors.transparent,
                    ),
                    Card(
                        elevation: 10,
                        color: Color.fromARGB(110, 1, 238, 255),
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        child: FutureBuilder<ProfileModel>(
                          future: ProfileApi().getMyProfile(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  H1Label("Usuario: " +
                                      snapshot.data!.username.toString()),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  H1Label("Correo Electrónico: " +
                                      snapshot.data!.email.toString()),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  H1Label("Teléfono celular: 51924785339"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  H1Label("Contraseña: ********"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  H1Label("Bio: Vivi en Lima"),
                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
