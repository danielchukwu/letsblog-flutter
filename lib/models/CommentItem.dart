// import 'package:flutter/material.dart';

class CommentItem {
  String avatar, username, content;
  int likes_count, dislikes_count, sub_comments_count;
  bool liked, disliked;

  CommentItem(
    {
      required this.avatar,
      required this.username,
      required this.content,
      required this.likes_count,
      required this.dislikes_count,
      required this.sub_comments_count,
      required this.liked,
      required this.disliked,
    }
  );
}

List<CommentItem> commentItems = [
  CommentItem(
      avatar: "https://res.cloudinary.com/dhtcwqsx4/image/upload/v1668343840/me_e4ufyk.jpg",
      username: "ebuka",
      content: "That’s what I am talking about you know. If it wasn’t for messi, football would literally suck.",
      likes_count: 2,
      dislikes_count: 3,
      sub_comments_count: 1,
      liked: true,
      disliked: false
  ),
  CommentItem(
      avatar: "https://res.cloudinary.com/dhtcwqsx4/image/upload/v1668343840/me_e4ufyk.jpg",
      username: "cherry",
      content: "I am talking about you know. If it wasn’t for messi, football would literally suck.",
      likes_count: 0,
      dislikes_count: 0,
      sub_comments_count: 0,
      liked: false,
      disliked: false
  ),
  CommentItem(
      avatar: "https://res.cloudinary.com/dhtcwqsx4/image/upload/v1668343840/me_e4ufyk.jpg",
      username: "cherry",
      content: "That’s what I am talking about you know. If it wasn’t for messi, football would literally suck.",
      likes_count: 4,
      dislikes_count: 0,
      sub_comments_count: 2,
      liked: false,
      disliked: false
  ),
];