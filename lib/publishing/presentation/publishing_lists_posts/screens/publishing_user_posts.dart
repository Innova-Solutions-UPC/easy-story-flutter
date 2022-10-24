import 'package:easy_story_flutter/common/widgets/drawer_widget.dart';
import 'package:easy_story_flutter/publishing/api/publishing_api.dart';
import 'package:easy_story_flutter/publishing/presentation/publishing_lists_posts/widgets/publishing_item.dart';
import 'package:flutter/material.dart';

import '../../../../iam/presentation/sign_in/widgets/sign_in_background_image.dart';

class PublishingUserPosts extends StatefulWidget {
  const PublishingUserPosts({Key? key}) : super(key: key);

  @override
  State<PublishingUserPosts> createState() => _PublishingUserPostsState();
}

class _PublishingUserPostsState extends State<PublishingUserPosts> {
  var dataPosts;
  @override
  void initState() {
    super.initState();
    obtain();

    //PublishingListBlocDetail();
  }

  Future<dynamic> obtain() async {
    dataPosts = await PublishingApi().get_all_my_posts();

    // print(dataPosts);
    // print(dataPosts["items"][0]["title"]);
    return await dataPosts;
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
      appBar: AppBar(
        title: Text("Your Stories"),
        backgroundColor: Colors.transparent,
      ),
      drawer: EasyStoryDrawerMenu(),
      body: Container(
        decoration: SignInBackgroundImage(),
        child: ListView.builder(
          itemCount: dataPosts == null ? 0 : dataPosts.length,
          itemBuilder: (BuildContext context, i) {
            return PublishingItem(
              context,
              dataPosts["items"][i]["title"],
              dataPosts["items"][i]["description"],
              dataPosts["items"][i]["content"],
              dataPosts["items"][i]["hashtags"][0]["name"],
              dataPosts["items"][i]["image"],
              dataPosts["items"][i]["id"],
            );
          },
        ),
      ),
    );
  }
}
