import 'dart:math';

import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/main_app_bar.dart';
import 'package:letsblog_flutter/models/UserItem.dart';
import 'package:letsblog_flutter/screens/edit_profile/components/edit_section.dart';
import 'package:letsblog_flutter/screens/profile/components/user_cover_avatar.dart';
import 'package:letsblog_flutter/utils.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  // Avatar
  var avatarFile;  // To be displayed in an image widget for preview
  var avatarPath;  // To be sent to cloudinary in order to get back a response of images URL

  // Cover
  var coverFile;  // To be displayed in an image widget for preview
  var coverPath;  // To be sent to cloudinary in order to get back a response of images URL

  // This function updates the state of our avatar variables
  void updateAvatar(Map img) {
    setState(() => avatarFile = img['imageFile']);
    setState(() => avatarPath = img['imagePath']);
  }
  // This function updates the state of our cover variables
  void updateCover(Map img) {
    setState(() => coverFile = img['imageFile']);
    setState(() => coverPath = img['imagePath']);
  }

  // Section InputField Controllers
  // Profile
  Map<String, List> profileControllers = {
    'name':     [TextEditingController(), 50],  // [0]TextController, [1]maxCharacters
    'username': [TextEditingController(), 50],
    'email':    [TextEditingController(), 50],
    'location': [TextEditingController(), 50],
    'bio':      [TextEditingController(), 300],
  };
  // Socials
  Map<String, List> socialsControllers = {
    'website':   [TextEditingController(), 200],
    'facebook':  [TextEditingController(), 200],
    'instagram': [TextEditingController(), 200],
    'twitter':   [TextEditingController(), 200],
    'linkedin':  [TextEditingController(), 200],
    'youtube':   [TextEditingController(), 200],
  };

  // Work
  Map<String, List> workControllers = {
    'occupation':    [TextEditingController(), 50],
    'place of work': [TextEditingController(), 50],
  };

  // Skills
  Map<String, List> skillsControllers = {
    'enter skill': [TextEditingController(), 50]
  };

  // Form Submission
  void submitForm() {
    print('submit form');
  }

  // dispose all TextEditingController when this screen unmounts


  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    if (data != null) {
      // do something with data
    }
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Cover, Avatar
            UserCoverAvatarEdit(
              avatar: owner['avatar'],
              cover: owner['cover'],
              user: owner,
              mode: 'edit',
              pressUpdateCover: updateCover,
              pressUpdateAvatar: updateAvatar,
              avatarFile: avatarFile,
              coverFile: coverFile,
            ),

            // Input Sections
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  // Profile EditSection
                  EditSection(title: 'Profile', profileControllers: profileControllers),
                  getDivider(),

                  // Socials EditSection
                  EditSection(title: 'Socials', profileControllers: socialsControllers),
                  getDivider(),

                  // Work EditSection
                  EditSection(title: 'Work', profileControllers: workControllers),
                  getDivider(),

                  // Skill EditSection
                  EditSection(title: 'Skills', profileControllers: skillsControllers),
                  getDivider(),


                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: MainAppBar(
        title: 'Edit Profile',
        showBackButton: true,
        showActionButton: true,
        actionText: 'save',
        pressSubmit: submitForm,
      ),
    );
  }
}
