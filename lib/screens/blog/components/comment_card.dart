import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/CommentItem.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({required this.commentItem});

  final CommentItem commentItem;

  @override
  State<CommentCard> createState() => _CommentCardState(comment: commentItem);
}

class _CommentCardState extends State<CommentCard> {
  _CommentCardState({required this.comment});

  CommentItem comment;
  bool showSubComment = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CircleAvatar(
              backgroundColor: KBlack.withOpacity(.2),
              backgroundImage: NetworkImage(comment.avatar),
            ),
          ),
          // Username-Content-Likes-Replies
          Expanded(
            // Used Padding multiple times to maintain perfect alignment due to the
            // tap animation on our like button
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // username
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    comment.username,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000).withOpacity(.8)
                    ),
                  ),
                ),
                // content
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    comment.content,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF000000).withOpacity(.8)
                    ),
                  ),
                ),
                // likes and reply button
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // Likes
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (comment.liked == false) {
                            comment.liked = true;
                            comment.likes_count++;

                            if (comment.disliked == true) {
                              comment.disliked = false;
                              comment.dislikes_count--;
                            }
                          }
                        });
                      },
                      customBorder: CircleBorder(),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: SvgPicture.asset(
                          "assets/icons/thumbs-up.svg",
                          height: 18,
                          color: comment.liked == true
                              ? KPrimaryColor
                              : Color(0xFF000000).withOpacity(.5),
                        ),
                      ),
                    ),
                    Text(
                      "${comment.likes_count}",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF000000).withOpacity(.5),
                      ),
                    ),
                    SizedBox(width: 20),
                    // Dislike
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (comment.disliked == false) {
                            comment.disliked = true;
                            comment.dislikes_count++;

                            if (comment.liked == true) {
                              comment.liked = false;
                              comment.likes_count--;
                            }
                          }
                        });
                      },
                      customBorder: CircleBorder(),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: SvgPicture.asset(
                          "assets/icons/thumbs-down.svg",
                          height: 18,
                          color: comment.disliked == true
                              ? KPrimaryColor
                              : Color(0xFF000000).withOpacity(.5),
                        ),
                      ),
                    ),
                    Text(
                      "${comment.dislikes_count}",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF000000).withOpacity(.5),
                      ),
                    ),
                    // Replies Button
                    SizedBox(width: 25),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Reply",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000).withOpacity(.8),
                          ),
                        ))
                  ],
                ),
                // sub-comments-button
                InkWell(
                  onTap: () {
                    setState(() {
                      showSubComment = !showSubComment;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: comment.sub_comments_count > 0 ?
                      Text(
                      'Replies ${comment.sub_comments_count}',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: KLightBlue,
                      ),
                    ) :
                      SizedBox(height: 0),
                  ),
                ),

                // show subcomments
                showSubComment == true ?
                Column(
                  children: List<Widget>.generate(
                    commentItems.length,
                    (index) => CommentCard(commentItem: commentItems[index])),
                ) :
                SizedBox(),
              ],
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
