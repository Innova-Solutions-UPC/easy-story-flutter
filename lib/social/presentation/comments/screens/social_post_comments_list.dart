import 'package:easy_story_flutter/social/infrastructure/models/comment_model.dart';
import 'package:flutter/material.dart';
import '../../../api/social_api.dart';
import '../../posts/widgets/social_background.dart';
import '../widgets/social_comment_item.dart';

class SocialPostCommentsList extends StatefulWidget {
  SocialPostCommentsList({Key? key}) : super(key: key);

  @override
  State<SocialPostCommentsList> createState() => _SocialPostCommentsListState();
}

class _SocialPostCommentsListState extends State<SocialPostCommentsList> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<CommentModel>> getPostComments(String slug) async {
    return await SocialApi().getAllTheCommentsByPostSlug(slug);
  }

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments;
    return Container(
      decoration: SocialBackgroundImage(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: FutureBuilder<List<CommentModel>>(
              future: getPostComments(arguments.toString()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return SocialCommentItem(
                        context,
                        arguments.toString(),
                        snapshot.data![index].content.toString(),
                        snapshot.data![index].userName.toString(),
                      );
                    },
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
              }),
        ),
      ),
    );
  }
}
