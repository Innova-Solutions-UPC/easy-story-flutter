import 'package:easy_story_flutter/social/api/social_api.dart';
import 'package:easy_story_flutter/social/infrastructure/models/post_model.dart';
import 'package:easy_story_flutter/social/presentation/comments/screens/social_post_comments_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../widgets/social_background.dart';

class SocialFeedPost extends StatefulWidget {
  const SocialFeedPost({Key? key}) : super(key: key);

  @override
  State<SocialFeedPost> createState() => _SocialFeedPostState();
}

class _SocialFeedPostState extends State<SocialFeedPost> {
  Future<PostModel>? post;

  @override
  void initState() {
    super.initState();
  }

  Future<PostModel> getPostDetails(String slug) async {
    print(await SocialApi().getAPost(slug));
    return await SocialApi().getAPost(slug);
  }

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments;
    return Container(
      decoration: SocialBackgroundImage(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            child: FutureBuilder<PostModel>(
              future: getPostDetails(arguments.toString()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    clipBehavior: Clip.none,
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
                        new Html(
                          data: """${snapshot.data!.content}""",
                        ),
                        new Text(
                          snapshot.data!.authorName.toString(),
                          textAlign: TextAlign.end,
                          style: new TextStyle(
                            color: Color.fromARGB(255, 85, 84, 84),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/comments',
                                  arguments: arguments.toString());
                            },
                            child: Text(
                              'comments',
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.black,
                              primary: Color(0xff4c505b),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            )),
                        // SocialPostCommentsList(),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return Container(
                    decoration: SocialBackgroundImage(),
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
