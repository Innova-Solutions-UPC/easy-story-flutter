import 'package:easy_story_flutter/iam/presentation/sign_in/widgets/sign_in_background_image.dart';
import 'package:easy_story_flutter/publishing/api/publishing_api.dart';
import 'package:easy_story_flutter/publishing/infrastructure/models/write_model.dart';
import 'package:flutter/material.dart';

//import '../../../../common/widgets/drawer_widget.dart';

class PublishingUserPostDetails extends StatefulWidget {
  PublishingUserPostDetails({Key? key}) : super(key: key);

  @override
  State<PublishingUserPostDetails> createState() =>
      _PublishingUserPostDetailsState();
}

class _PublishingUserPostDetailsState extends State<PublishingUserPostDetails> {
  Future<WriteModel>? post;

  @override
  void initState() {
    super.initState();
  }

  Future<WriteModel> getPostDetails(String slug) async {
    return PublishingApi().getAPost(slug);
  }

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 177, 116, 164),
        onPressed: () {
          Navigator.pushNamed(context, '/edit-publishing');
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.transparent,
      ),
      //drawer: EasyStoryDrawerMenu(),
      body: Container(
        decoration: SignInBackgroundImage(),
        child: FutureBuilder<WriteModel>(
          future: getPostDetails(arguments.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Card(
                elevation: 1.0,
                margin: EdgeInsets.only(
                    bottom: 2.0, top: 14.0, left: 15.0, right: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    Image.network(
                      snapshot.data!.image.isEmpty
                          ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4vgxRDCfxDtQKPA7Q_-AuKsf44qb0LHcydDgRVOQB&s"
                          : snapshot.data!.image,
                      fit: BoxFit.fill,
                    ),
                    ListTile(
                      title: Text(snapshot.data!.title),
                      subtitle: Text(snapshot.data!.description),
                    ),
                    new Text(
                      snapshot.data!.content,
                      style: new TextStyle(
                        color: Color.fromARGB(255, 85, 84, 84),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
