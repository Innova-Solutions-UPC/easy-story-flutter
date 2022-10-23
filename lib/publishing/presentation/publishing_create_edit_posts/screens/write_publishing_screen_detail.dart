//import 'package:easy_story_flutter/publishing/presentation/publishing_create_edit_posts/widgets/publishing_description_field.dart';
import 'package:easy_story_flutter/common/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/publishing_widgets.dart';

class WritePublishingScreenDetail extends StatefulWidget {
  WritePublishingScreenDetail({Key? key}) : super(key: key);

  @override
  State<WritePublishingScreenDetail> createState() =>
      _WritePublishingScreenDetailState();
}

class _WritePublishingScreenDetailState
    extends State<WritePublishingScreenDetail> {
  TextEditingController title = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController content = new TextEditingController();
  String urlImage =
      'https://www.fundacion-affinity.org/sites/default/files/los-10-sonidos-principales-del-perro.jpg';

  TextEditingController hashtags = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: SignInBackgroundImage(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create your own Stories"),
          backgroundColor: Colors.transparent,
        ),
        drawer: EasyStoryDrawerMenu(),
        backgroundColor: Colors.transparent,
        floatingActionButton: PublishingButtonCreate(
          context,
          title.text.trim(),
          description.text.trim(),
          content.text.trim(),
          hashtags.text.trim(),
          urlImage,
        ),
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
                    PublishingTitleField(title),
                    SizedBox(
                      height: 30,
                    ),
                    PublishingDescriptionField(description),
                    SizedBox(
                      height: 30,
                    ),
                    PublishingContentField(content),
                    SizedBox(
                      height: 30,
                    ),
                    PublishingHashtagsField(hashtags),
                    SizedBox(
                      height: 30,
                    ),
                    PublishingImage(urlImage),
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
