import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/widgets/box_decoration.dart';
import '../widgets/publishing_widgets.dart';

class UpdatePublishingScreenDetail extends StatefulWidget {
  UpdatePublishingScreenDetail({Key? key}) : super(key: key);

  @override
  State<UpdatePublishingScreenDetail> createState() =>
      UpdatePublishingScreenDetailState();
}

class UpdatePublishingScreenDetailState
    extends State<UpdatePublishingScreenDetail> {
  TextEditingController title = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController content = new TextEditingController();
  String urlImage = "";
  dynamic data;
  TextEditingController hashtags = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments;
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit this your own Stories "),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        floatingActionButton: PublishingButtonEdit(
          context,
          title.text.trim(),
          description.text.trim(),
          content.text.trim(),
          hashtags.text.trim(),
          urlImage,
          arguments.toString(),
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
