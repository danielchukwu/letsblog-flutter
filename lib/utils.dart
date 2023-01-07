import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:letsblog_flutter/constraints.dart';

final String cloudinary_host =
    "https://res.cloudinary.com/dhtcwqsx4/image/upload/v1671830526/";

final String FONT_FAMILY = 'Poppins';

// Functions
/// This function helps capitalize the first
/// character of every new word in the String data passed in
///
/// The return value is a capitalized string result
String capitalize(String value) {
  String newValue = '';
  for (int i = 0; i < value.length; i++) {
    if (i == 0) {
      newValue += value[0].toUpperCase();
      continue;
    } else if (value[i - 1] == ' ') {
      newValue += value[i].toUpperCase();
    } else {
      newValue += value[i];
    }
  }
  return newValue;
}


/// This function Removes d or 'ed' from a string and then adds 's'
///
/// The return value is a string value
String removeED(String value) {
  int len = value.length;
  if (value == 'liked'){
    return "${value.substring(0, len-1)}s";
  } else if (value.substring(len-2, len) == 'ed') {
    return "${value.substring(0, len-2)}s";
  }
  return "${value}s";
}


/// This function takes a type parameter and according to the type
/// given it returns a text to be prepended to a notification item
String getAppendText({type}){
  switch (type) {
    case ('follow'):
      return ' started following you.';
    case ('liked_blog'):
      return ' liked your blog.';
    case ('liked_comment'):
      return ' liked your comment.';
    case ('commented_blog'):
      return ' commented on your blog.';
    case ('commented_comment'):
      return ' commented on your comment.';
    default:
      return '';
  }
}

/// This function gets u a default 10px size on any screen
///
/// The return value is 10 pixels
double getSize(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  Orientation orientation = MediaQuery.of(context).orientation;
  double defaultSize = orientation == Orientation.landscape
    ? screenHeight * .024
    : screenWidth * .024;
  return defaultSize;   // Its default is 10px
}


/// This function picks an image from either the gallery or the camera
///
/// | source: can either be ImageSource.gallery or ImageSource.camera
/// | context: is of type BuildContext
/// | updateImage: is a function that is to be called
Future pickImage({
  context,
  ImageSource source=ImageSource.gallery,
  Function? press,
  CropAspectRatioPreset? ratio,
  CropStyle? cropShape
}) async {

  final img = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (img == null) return NullThrownError();
  Map croppedImage = await cropImage(
      context: context,
      imagePath: img.path,
      ratio: ratio!,
      cropShape: cropShape!,
  );
  if (press == null) { throw NullThrownError(); }

  // // update the states of the variables
  // press!(croppedImage!['imageFile'], croppedImage!['imagePath']);

  // update the state after image is selected and cropped
  // with
  print(croppedImage);
  press!(croppedImage);

  // // upload to cloudinary
  // uploadImage(imagePath);
}


/// This function takes an image path and crops it based on the
/// CropAspectRatioPreset type provided.
///
/// Here is a list of the available types
/// | CropAspectRatioPreset.square
/// | CropAspectRatioPreset.ratio3x2
/// | CropAspectRatioPreset.original
/// | CropAspectRatioPreset.ratio4x3
/// | CropAspectRatioPreset.ratio16x9
///
/// This returns a Map Data Structure containing the two items =>
/// | imageFile: which can be previewed in flutter using Image.file or FileImage
/// | imagePath: which can be sent to cloudinary to be saved
Future cropImage({context, imagePath, CropAspectRatioPreset? ratio,
  CropStyle cropShape = CropStyle.rectangle}) async {

  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: imagePath,
    aspectRatioPresets: [ratio!],
    cropStyle: cropShape,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: KPrimaryColor,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      IOSUiSettings(
        title: 'Cropper',
      ),
      WebUiSettings(
        context: context,
      ),
    ],
  );
  return {
    "imageFile": File(croppedFile!.path),
    "imagePath": croppedFile!.path
  };
}


/// This function takes an image path and uploads the image to cloudinary
///
/// The return value is the uploaded images url
Future<String> uploadImage({imagePath}) async {
  // Create cloudinary instance using Cloud name and Preset name
  final cloudinary = CloudinaryPublic('dhtcwqsx4', 'zsjlducw', cache: false);

  try {
    CloudinaryResponse response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(imagePath,
          resourceType: CloudinaryResourceType.Image),
    );
    // response.secureUrl grabs the returned full url of the image after its
    // upload therefore we split the full url and grab the needed portion then
    // store that in our db
    String imgUrl = response.secureUrl.split('/').last;
    return imgUrl;
  } on CloudinaryException catch (e) {
    print(e.message);
    print(e.request);
  }
  return '';
}


/// This function displays a pop up that requires the user
/// to select where they would like to get an image from
/// either the camera or the gallery
///
/// This returns a popup thats displayed on the screen
Future? showImageSourcePopup({
  context, Function? press,
  CropStyle cropShape=CropStyle.rectangle,
  CropAspectRatioPreset ratio=CropAspectRatioPreset.ratio3x2 }) async {
  if (Platform.isAndroid) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          height: 150,
          width: MediaQuery.of(context).size.width - 40,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  pickImage(
                    context: context,
                    source: ImageSource.camera, press: press,
                    ratio: ratio, cropShape: cropShape
                  );
                Navigator.pop(context);},
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () {
                  pickImage(
                    context: context,
                    source: ImageSource.gallery, press: press,
                    ratio: ratio, cropShape: cropShape
                  );
                  Navigator.pop(context);
                },
              )
            ],
          ),
        )
    );
  }
  else if (Platform.isIOS) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
              onPressed: () {
                pickImage(
                  context: context,
                  source: ImageSource.camera, press: press,
                  ratio: ratio, cropShape: cropShape
                );
                Navigator.pop(context);
              },
              child: Text(
                'Camera',
                style: TextStyle(fontFamily: 'Poppins'),
              )),
          CupertinoActionSheetAction(
              onPressed: () {
                pickImage(
                  context: context,
                  source: ImageSource.gallery, press: press,
                  ratio: ratio, cropShape: cropShape
                );
                Navigator.pop(context);
              },
              child: Text(
                'Gallery',
                style: TextStyle(fontFamily: 'Poppins'),
              )),
        ],
      ),
    );
  }
}


/// This function displays a popup that ask's
/// if a user is sure they want to delete a blog
Future showDeleteOptionsPopup(context) {
  double ds = getSize(context);
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Container(
        width: ds * 40,
        height: ds * 15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Question
            Center(
              child: Text(
                'Are you sure about deleting this blog?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: ds * 1.8,
                  color: KBlack.withOpacity(.8),
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Yes or No
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'YES',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: KPrimaryColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'NO',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: KPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}



// STYLES
TextStyle headerStyle = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
  fontSize: 20,
  color: KBlack.withOpacity(.8)
);


// Widgets
Widget getDivider() {
    return Divider(height: 0, color: KBlack.withOpacity(.1), thickness: 1);
}