import 'package:easy_story_flutter/profile/api/profile_api.dart';
import 'package:easy_story_flutter/profile/infrastructure/models/profile_model.dart';
import 'package:easy_story_flutter/profile/presentation/profile/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return Container(
      decoration: ProfileBackgroundImage(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
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
                                onPressed: () {
                                  Navigator.pushNamed(context, '/user-posts');
                                },
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
                                onPressed: () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  final String? userName =
                                      prefs.getString('username');

                                  Navigator.pushNamed(context, '/edit-profile',
                                      arguments: userName);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 100.0,
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
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/user-posts');
                                        },
                                        child: Text(
                                          'My posts',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.black,
                                          primary: Color(0xff4c505b),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                        )),
                                  ],
                                );
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: Center(
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.purple,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                );
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
      ),
    );
  }
}
