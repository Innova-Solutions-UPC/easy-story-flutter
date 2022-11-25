import 'package:easy_story_flutter/common/widgets/box_decoration.dart';
import 'package:easy_story_flutter/publishing/api/publishing_api.dart';
import 'package:easy_story_flutter/publishing/infrastructure/models/write_model.dart';
import 'package:easy_story_flutter/publishing/presentation/publishing_create_edit_posts/widgets/publishing_widgets.dart';
import 'package:flutter/material.dart';

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
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, '/edit-publishing');
          },
          child: Icon(
            Icons.add,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
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
                  return Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
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
            ),
          ),
        ),
      ),
    );
  }
}
