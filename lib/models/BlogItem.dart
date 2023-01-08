class BlogItem {
  final String cover, category, title, content, username, avatar;
  int likes_count, dislikes_count, views;
  bool liked, disliked, is_following;

  BlogItem(
      {
        required this.cover,
        required this.category,
        required this.title,
        required this.content,
        required this.username,
        required this.avatar,
        required this.views,
        required this.likes_count,
        required this.dislikes_count,
        required this.liked,
        required this.disliked,
        required this.is_following,
  });
}

List<BlogItem> blogItems = [
  BlogItem(
      cover: "bxa1cip6ywjsstkltvje.webp",
      // cover: "https://res.cloudinary.com/dhtcwqsx4/image/upload/v1668353592/pvf8gjt6azuqjunmqfjy.webp",
      category: "Football",
      title: "Messi Emotional After Firing Argentina To The World Cup Finals",
      content: "Lionel Messi may have saved Argentina's World Cup hopes with a left foot missile from 3-point range and it's just not nice",
      username: "dandizzy",
      avatar: "me_e4ufyk.jpg",
      views: 15,
      likes_count: 5,
      dislikes_count: 2,
      liked: true,
      disliked: false,
      is_following: true,
  ),
  BlogItem(
      cover: "pvf8gjt6azuqjunmqfjy.webp",
      category: "Football",
      title: "Messi Emotional After Firing Argentina To The World Cup Finals",
      content: "Lionel Messi may have saved Argentina's World Cup hopes with a left foot missile from 3-point range and it's just not nice",
      username: "dandizzy",
      avatar: "me_e4ufyk.jpg",
      views: 7,
      likes_count: 4,
      dislikes_count: 0,
      liked: true,
      disliked: false,
      is_following: false,
  ),
];
