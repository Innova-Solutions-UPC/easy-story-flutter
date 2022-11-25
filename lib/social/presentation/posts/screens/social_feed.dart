import 'package:easy_story_flutter/common/widgets/box_decoration.dart';
import 'package:easy_story_flutter/social/api/social_api.dart';
import 'package:easy_story_flutter/social/infrastructure/models/post_model.dart';
import 'package:easy_story_flutter/social/presentation/posts/widgets/social_widgets.dart';
import 'package:flutter/material.dart';

class SocialFeed extends StatefulWidget {
  SocialFeed({Key? key}) : super(key: key);

  @override
  State<SocialFeed> createState() => _SocialFeedState();
}

class _SocialFeedState extends State<SocialFeed> {
  late Future<List<PostModel>> posts;

  @override
  void initState() {
    super.initState();
    posts = getFeedPosts();
  }

  Future<List<PostModel>> getFeedPosts() async {
    return await SocialApi().getAllThePosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: FutureBuilder<List<PostModel>>(
              future: posts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return SocialFeedItem(
                        context,
                        snapshot.data![index].title.toString(),
                        snapshot.data![index].description.toString(),
                        snapshot.data![index].content.toString(),
                        snapshot.data![index].hashtags.toString(),
                        snapshot.data![index].image.toString(),
                        snapshot.data![index].id.toString(),
                        snapshot.data![index].slug.toString(),
                        false,
                      );
                    },
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
              }),
        ),
      ),
    );
  }
}
