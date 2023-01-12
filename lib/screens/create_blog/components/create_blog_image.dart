import 'package:flutter/material.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'dart:io';

import 'package:letsblog_flutter/utils.dart';

class CreateBlogImage extends StatefulWidget {
  CreateBlogImage({Key? key, this.pickedImage}) : super(key: key);
  var pickedImage;

  @override
  State<CreateBlogImage> createState() => _CreateBlogImageState();
}

class _CreateBlogImageState extends State<CreateBlogImage> {

  @override
  Widget build(BuildContext context) {
    double ds = getSize(context);
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      decoration: widget.pickedImage != null
          ? BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: FileImage(widget.pickedImage)))
          : BoxDecoration(
        color: KBlack.withOpacity(.8),
      ),
      child: widget.pickedImage == null
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/camera.svg',
                color: Color(0xFFFFFFFF).withOpacity(.8),
                width: 50,
              )),
          Text(
            'Tap Here To Upload an Image',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: ds * 1.6,
                color: Colors.white),
          ),
        ],
      )
          : SizedBox(),
    );
  }
}
