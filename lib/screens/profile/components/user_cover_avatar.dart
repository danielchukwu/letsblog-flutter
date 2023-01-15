import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:letsblog_flutter/components/buttons.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/utils.dart';

class UserCoverAvatarEdit extends StatefulWidget {
  UserCoverAvatarEdit({
    Key? key,
    required this.avatar, required this.cover, required this.user,
    this.mode = 'view',  // 'view' or 'edit'
    this.pressUpdateFollowersCount,
    this.pressUpdateAvatar, this.pressUpdateCover,
    this.avatarFile, this.coverFile,
  }) : super(key: key);

  final Map user;
  final String avatar, cover, mode;
  // Used to update a users followers count
  final Function? pressUpdateFollowersCount;
  // Used to update a users avatar and cover
  final Function? pressUpdateAvatar, pressUpdateCover;
  // This variables are used to hold the new avatar
  // and cover selected by the user
  var avatarFile, coverFile;

  @override
  State<UserCoverAvatarEdit> createState() => _UserCoverAvatarEditState();
}

class _UserCoverAvatarEditState extends State<UserCoverAvatarEdit> {

  @override
  Widget build(BuildContext context) {
    // Contains cover, avatar, edit or follows button
    if (widget.mode == 'view') {
      return Stack(
        children: [
          Container(
            height: 200,
          ),
          // Cover
          Positioned(
              top: -20,
              child: Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("$cloudinary_host${widget.cover}"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: KBlack.withOpacity(.1),
                ),
              )),
          // Avatar
          Positioned(
            bottom: 0,
            left: 15,
            child: Container(
              height: 100,
              width: 100,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  color: KBlack.withOpacity(.2),
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.,
                  // border: Border.all(width: 5, color: Colors.white),
                  image: DecorationImage(image: NetworkImage("$cloudinary_host${widget.avatar}"))),
            ),
          ),
          // Follow || EditProfile Button
          Positioned(
            bottom: 0,
            right: 10,
            width: 130,
            height: 40,
            child: widget.user['id'] == 1
                ? EditProfileButton()
                : FollowButton(
                data: widget.user, updateFollowersCount: widget.pressUpdateFollowersCount),
          ),
        ],
      );
    }
    // Contains cover and avatar that can be clicked
    // and changed to some other avatar or cover
    return Stack(
      children: [
        Container(
          height: 200,
        ),
        // Cover
        Positioned(
            top: -20,
            child: Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: widget.coverFile == null
                    ? DecorationImage(
                        image: NetworkImage("$cloudinary_host${widget.cover}"),
                        fit: BoxFit.cover,
                    )
                    : DecorationImage(
                        image: FileImage(widget.coverFile),
                        fit: BoxFit.cover,
                    ),
                borderRadius: BorderRadius.circular(10),
                color: KBlack.withOpacity(.1),
              ),
            )
        ),
        // Cover Overlay
        Positioned(
            top: -20,
            child: InkWell(
              onTap: () {
                showImageSourcePopup(context: context, press: widget.pressUpdateCover, ratio: CropAspectRatioPreset.ratio16x9);
              },
              child: Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: KBlack.withOpacity(.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SvgPicture.asset('assets/icons/camera.svg', height: 30, color: Colors.white),
                ),
              ),
            )
        ),


        // Avatar
        Positioned(
          bottom: 0,
          left: 15,
          child: Container(
            height: 100,
            width: 100,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                image: widget.avatarFile == null
                  ? DecorationImage(
                    image: NetworkImage("$cloudinary_host${widget.avatar}"),
                    fit: BoxFit.cover,
                  )
                  : DecorationImage(
                    image: FileImage(widget.avatarFile),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.white, width: 5),
                  color: KBlack.withOpacity(.2),
                  shape: BoxShape.circle,
                ),
          ),
        ),
        // Avatar Overlay
        Positioned(
          bottom: 0,
          left: 15,
          child: InkWell(
            onTap: () {
              showImageSourcePopup(context: context, press: widget.pressUpdateAvatar, cropShape: CropStyle.circle, ratio: CropAspectRatioPreset.square);
            },
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 100,
              width: 100,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  color: KBlack.withOpacity(.5),
                  shape: BoxShape.circle
              ),
              child: Center(
                child: SvgPicture.asset('assets/icons/camera.svg', height: 25, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
