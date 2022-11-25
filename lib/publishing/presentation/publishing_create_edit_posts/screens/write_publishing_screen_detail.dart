//import 'package:easy_story_flutter/publishing/presentation/publishing_create_edit_posts/widgets/publishing_description_field.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  String urlImage = "";

  dynamic data;
  TextEditingController hashtags = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create your own Stories"),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        floatingActionButton: PublishingButtonCreate(
          context,
          title.text.trim(),
          description.text.trim(),
          content.text.trim(),
          hashtags.text.trim(),
          data,
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
                    PublishingImage(data, urlImage),
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
