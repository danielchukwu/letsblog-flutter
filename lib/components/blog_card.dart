import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:letsblog_flutter/components/blog_card/blog_image.dart';
import 'package:letsblog_flutter/components/blog_card/category_views.dart';
import 'package:letsblog_flutter/components/single_avatar.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/BlogItem.dart';
import 'package:letsblog_flutter/models/UserItem.dart';
import 'package:letsblog_flutter/utils.dart';

class BlogCard extends StatelessWidget {
  /// This class displays a custom blog card widget in either
  /// the 'view' mode (default) or the 'edit' mode.
  /// @params
  /// | blog (Map) - containing data to be displayed on the blog card
  /// | mode (String) - available options are 'view' (default) and 'edit' mode
  ///
  /// This returns a blog card widget
  BlogCard({required this.blog, this.mode = 'view'});

  final BlogItem blog;
  final String mode;

  @override
  Widget build(BuildContext context) {
    double ds = getSize(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/blogs",
          arguments: {
            'cover': this.blog.cover,
            'category': this.blog.category,
            'title': this.blog.title,
            'content': this.blog.content,
            'username': this.blog.username,
            'avatar': this.blog.avatar,
            'views': this.blog.views,
            'likes_count': this.blog.likes_count,
            'dislikes_count': this.blog.dislikes_count,
            'liked': this.blog.liked,
            'disliked': this.blog.disliked,
            'is_following': this.blog.is_following,
          },
        );
      },
      child: Column(
        children: <Widget>[
          // Blog Image
          BlogImage(imageUrl: blog.cover),

          // Blog Texts
          Padding(
            padding:
                EdgeInsets.only(left: ds * 1.7, right: ds * 1.7, top: ds * 2.0),
            child: Column(
              children: <Widget>[
                // Blog Category-Views
                BlogCategorySection(
                  title: blog.category.toUpperCase(),
                  views_count: blog.likes_count,
                  showEditDeleteOption: mode == 'view' ? false : true,
                  pressDelete: showDeleteOptionsPopup,
                  parentContext: context,
                ),

                // Blog Title
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    blog.title,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                        fontSize: 23,
                        color: KBlack.withOpacity(.8)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // Blog Content
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    blog.content,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      height: 1.7,
                    ),
                    maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),

                // Username & Avatar
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: mode == 'view'
                        ? [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/profile',
                                    arguments: {
                                      'id': userItems[2].id,
                                      'cover': userItems[2].cover,
                                      'avatar': userItems[2].avatar,
                                      'username': userItems[2].username,
                                      'name': userItems[2].name,
                                      'occupation': userItems[2].occupation,
                                      'company': userItems[2].company,
                                      'followers_count':
                                          userItems[2].followers_count,
                                      'following_count':
                                          userItems[2].following_count,
                                      'is_following': userItems[2].is_following,
                                      'about': userItems[2].about,
                                      'skills': userItems[2].skills,
                                      'instagram': userItems[2].instagram,
                                      'twitter': userItems[2].twitter,
                                      'facebook': userItems[2].facebook,
                                      'website': userItems[2].website,
                                      'linkedin': userItems[2].linkedin,
                                      'youtube': userItems[2].youtube,
                                    });
                              },
                              child: Text(
                                blog.username,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: KBlack.withOpacity(.8),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            SingleRoundAvatar(
                              avatarUrl: blog.avatar,
                              width: 40,
                              height: 40,
                            )
                          ]
                        : [
                            // Views
                            BlogTextIcon(
                                text: '5',
                                iconOpacity: .3,
                                textOpacity: .6,
                                textSize: ds * 1.6,
                                iconHeight: ds * 1.4,
                                spaceBetween: ds),
                            SizedBox(width: 30),

                            // Likes
                            BlogTextIcon(
                                text: '5',
                                iconSrc: 'assets/icons/thumbs-up.svg',
                                iconOpacity: .3,
                                textOpacity: .6,
                                textSize: ds * 1.6,
                                iconHeight: ds * 1.5,
                                spaceBetween: ds),
                            SizedBox(width: 30),

                            // Comments
                            BlogTextIcon(
                                text: '5',
                                iconSrc: 'assets/icons/comment-solid.svg',
                                iconOpacity: .3,
                                textOpacity: .6,
                                textSize: ds * 1.6,
                                iconHeight: ds * 1.4,
                                spaceBetween: ds),
                          ],
                  ),
                )

                //
              ],
            ),
          ),
        ],
      ),
    );
  }
}