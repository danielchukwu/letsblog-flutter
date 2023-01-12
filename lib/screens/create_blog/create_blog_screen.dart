import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/input_fields.dart';
import 'package:letsblog_flutter/components/main_app_bar.dart';
import 'package:letsblog_flutter/screens/blog/components/blog_image.dart';
import 'package:letsblog_flutter/screens/create_blog/components/create_blog_image.dart';
import 'package:letsblog_flutter/utils.dart';

class CreateBlogScreen extends StatefulWidget {
  CreateBlogScreen({Key? key}) : super(key: key);
  static String routeName = '/create-blog';

  @override
  State<CreateBlogScreen> createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  String? categoryInputValue = '';

  // To be displayed in an image widget for preview
  var pickedImage;
  // To be sent to cloudinary in order to get back a response of images URL
  var imagePath;

  Map? data;

  /// This function updates the state of our image variables
  void updatePickedImage(Map croppedImage) {
    setState(() {
      pickedImage = croppedImage['imageFile'];
    });
    setState(() {
      imagePath = croppedImage['imagePath'];
    });
  }

  void sumbitForm() async {
    // first upload the croppedImage to cloudinary
    String imgUrl = await uploadImage(imagePath: imagePath);
    print('imgUrl: ');
    print(imgUrl);

    // Next up send blog data to backend
    print('imageFile: ${pickedImage}');
    print('imagePath: ${imagePath}');
    print('title: ${titleController.text}');
    print('category: ${categoryInputValue}');
    print('content: ${contentController.text}');
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var nData = ModalRoute.of(context)!.settings.arguments;
    print(nData);
    double ds = getSize(context);
    Map data = {};
    // if data was passed into this screen. Update the input fields
    if (nData != null) {
        data = nData as Map;
        this.data = data;
        setState(() {
          titleController.text = data['title'];
          categoryInputValue = data['category'];
          contentController.text = data['content'];
        });
    }

    return Scaffold(
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: Form(
          child: Column(
            children: <Widget>[
              // Blog Image
              InkWell(
                onTap: () => showImageSourcePopup(context: context, press: updatePickedImage),
                child: !data.isEmpty && pickedImage == null
                    ? BlogImage(imgUrl: data['img'],)
                    : CreateBlogImage(pickedImage: pickedImage)
              ),

              // Title, Category, Content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Blog Title
                    Text(
                      'Blog Info',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: ds * 2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    // Title
                    SizedBox(height: 20),
                    CustomInputField(
                        title: 'Title', inputController: titleController),

                    // Category Input
                    DropdownInputField(
                        press: (newValue) {
                          setState(() => categoryInputValue = newValue);
                    }),

                    // Content TextArea
                    SizedBox(height: 20),
                    CustomInputField(
                        title: 'Content',
                        inputController: contentController,
                        minLines: 10,
                        maxLines: 20,
                        maxCharacters: 5000),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  PreferredSize buildAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: MainAppBar(
          title: 'Create Blog', showBackButton: true, showActionButton: true, pressSubmit: sumbitForm,),
    );
  }
}
