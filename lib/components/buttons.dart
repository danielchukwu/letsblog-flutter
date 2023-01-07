import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/texts/texts.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/UserItem.dart';
import 'package:letsblog_flutter/utils.dart';

// Follow
class FollowButton extends StatefulWidget {
  const FollowButton({Key? key, required this.data, this.updateFollowersCount}) : super(key: key);

  final Map data;
  final updateFollowersCount;

  @override
  State<FollowButton> createState() => _FollowButtonState(data: data, updateFollowersCount: updateFollowersCount);
}

class _FollowButtonState extends State<FollowButton> {
  _FollowButtonState({required this.data, this.updateFollowersCount});

  final Map data;
  final updateFollowersCount;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          data['is_following'] = !data['is_following'];
        });
        updateFollowersCount != null ? updateFollowersCount() : '';
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: data['is_following'] == true
            ? Colors.white
            : KPrimaryColor,
        side: BorderSide(
            color: data['is_following'] == true
                ? KBlack.withOpacity(.2)
                : KPrimaryColor
        ),
        fixedSize: Size.fromWidth(130),
      ),
      child: Text(
        data['is_following'] == true ? 'following' : 'follow',
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: data['is_following'] == true
                ? KBlack.withOpacity(.7)
                : Colors.white
        ),
      ),
    );
  }
}


// Edit Profile Button
class EditProfileButton extends StatelessWidget {
  const EditProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          '/edit-profile',
          arguments: owner,
        );
      },
      style: OutlinedButton.styleFrom(
          side: BorderSide(
              width: 1, color: KBlack.withOpacity(.1)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30))),
      child: TextMedium(text: "Edit Profile", weight: FontWeight.w500, opacity: .6,),
    );
  }
}


// Auth Button - Used for Login and SignUp screen
class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required String this.title,
    required Function this.press
  }) : super(key: key);

  final String title;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
          onPressed: () => {
            press()
          },
          style: TextButton.styleFrom(
            backgroundColor: KPrimaryColor,
          ),
          child: TextMedium(text: title, color: Colors.white)
      ),
    );
  }
}

