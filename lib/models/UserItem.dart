class UserItem {
  final String cover, avatar, username, name, occupation, company, about;
  int id, followers_count, following_count;
  bool is_following;
  final List<String> skills;

  final facebook, instagram, website, youtube, twitter, linkedin;

  UserItem({
    required this.id,
    required this.cover,
    required this.avatar,
    required this.username,
    required this.name,
    required this.occupation,
    required this.company,
    required this.about,
    required this.skills,
    required this.followers_count,
    required this.following_count,

    required this.is_following,
    this.facebook, this.instagram, this.website, this.youtube, this.twitter, this.linkedin,
  });
}

List userItems = [
  UserItem(
    id: 1,
    cover: "cover-image_d2ukrv.jpg",
    avatar: "me_e4ufyk.jpg",
    username: "dandizzy",
    name: "chukwu daniel",
    occupation: "software engineer",
    about: aboutDefault,
    company: "seefriends",
    skills: ['Python', 'Java', 'Flutter'],
    instagram: 'https://instagram.com/danielllchukwu',
    twitter: 'https://twitter.com/daniellchukwu',
    followers_count: 4,
    following_count: 5,
    is_following: false,
  ),
  UserItem(
    id: 2,
    cover:
        "cover-image_d2ukrv.jpg",
    avatar:
        "nhytevizpbsibl3egk8b.jpg",
    username: "pg13",
    name: "paul george",
    occupation: "basketballer",
    company: "LA Clippers",
    about: "Hello there, I am now on Let's blog",
    skills: [],
    facebook: 'https://instagram.com/danielllchukwu',
    youtube: 'https://twitter.com/daniellchukwu',
    website: 'chukwudaniel.netlify.app',
    followers_count: 25,
    following_count: 1,
    is_following: false,
  ),
  UserItem(
    id: 3,
    cover:
        "cover-image_d2ukrv.jpg",
    avatar:
        "oyaewkauyrax9v3ie1ae.jpg",
    username: "uncledrew",
    name: "Kyrie Irving",
    occupation: "influencer",
    about: aboutDefault,
    skills: ['basketball', 'drawing', 'gaming'],
    company: "brooklyn nets",
    followers_count: 12,
    following_count: 3,
    is_following: true,
  ),
];

String aboutDefault = """
Hello there, my  name is Daniel. A black Nigerian Lol, still lowkey looing for \
a white Nigerian. Hello there, my  name is Daniel. A black Nigerian Lol, still \
lowkey looing for a white Nigerian. 

\tMy  Guys think I am way too unselfish and I really still am trying to figure out how they arrived at that conclusion you know, it’s really crazy to me. A black Nigerian Lol, still lowkey looing for a white Nigerian hopefully 1 day I’ll find at least one.

\tSo all my brothers I freaking love you that’s daniel my fellow black Nigerians Lol, still lowkey looing for a white Nigerian
""";


Map owner = {
  'id' : userItems[0].id,
  'cover' : userItems[0].cover,
  'avatar' : userItems[0].avatar,
  'username' : userItems[0].username,
  'name' : userItems[0].name,
  'occupation' : userItems[0].occupation,
  'company' : userItems[0].company,
  'followers_count' : userItems[0].followers_count,
  'following_count' : userItems[0].following_count,
  'is_following' : userItems[0].is_following,
  'about' : userItems[0].about,
  'skills' : userItems[0].skills,
  'instagram' : userItems[0].instagram,
  'twitter' : userItems[0].twitter,
  'facebook' : userItems[0].facebook,
  'website' : userItems[0].website,
  'linkedin' : userItems[0].linkedin,
  'youtube' : userItems[0].youtube,
};