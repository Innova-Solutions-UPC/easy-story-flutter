//import 'package:easy_story_flutter/common/widgets/drawer_widget.dart';
import 'package:easy_story_flutter/publishing/api/publishing_api.dart';
import 'package:easy_story_flutter/publishing/infrastructure/models/write_model.dart';
import 'package:easy_story_flutter/publishing/presentation/publishing_lists_posts/widgets/publishing_item.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/drawer_widget.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../../iam/presentation/sign_in/widgets/sign_in_background_image.dart';

class PublishingUserPosts extends StatefulWidget {
  const PublishingUserPosts({Key? key}) : super(key: key);

  @override
  State<PublishingUserPosts> createState() => _PublishingUserPostsState();
}

class _PublishingUserPostsState extends State<PublishingUserPosts> {
  late Future<List<WriteModel>> posts;

  @override
  void initState() {
    super.initState();
    posts = getPosts();
  }

  Future<List<WriteModel>> getPosts() async {
    return await PublishingApi().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 177, 116, 164),
        onPressed: () {
          Navigator.pushNamed(context, '/write-publishing');
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: Container(
        decoration: SignInBackgroundImage(),
        child: FutureBuilder<List<WriteModel>>(
            future: posts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return PublishingItem(
                        context,
                        snapshot.data![index].title.toString(),
                        snapshot.data![index].description.toString(),
                        snapshot.data![index].content.toString(),
                        snapshot.data![index].hashtags.toString(),
                        snapshot.data![index].image.toString(),
                        snapshot.data![index].id.toString(),
                        snapshot.data![index].slug.toString());
                  },
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
