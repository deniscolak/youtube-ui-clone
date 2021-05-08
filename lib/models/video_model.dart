class VideoModel {
  String id;
  String author;
  String authorImg;
  String title;
  String videoImg;
  String duration;
  String createdAt;
  String views;
  String likes;
  String dislikes;
  bool isTop;
  bool isShort;

  VideoModel(
      {this.id,
      this.author,
      this.authorImg,
      this.title,
      this.videoImg,
      this.duration,
      this.createdAt,
      this.views,
      this.likes,
      this.dislikes,
      this.isTop,
      this.isShort});

  VideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    authorImg = json['authorImg'];
    title = json['title'];
    videoImg = json['videoImg'];
    duration = json['duration'];
    createdAt = json['createdAt'];
    views = json['views'];
    likes = json['likes'];
    dislikes = json['dislikes'];
    isTop = json['isTop'];
    isShort = json['isShort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['author'] = this.author;
    data['title'] = this.title;
    data['videoImg'] = this.videoImg;
    data['duration'] = this.duration;
    data['createdAt'] = this.createdAt;
    data['views'] = this.views;
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    data['isTop'] = this.isTop;
    data['isShort'] = this.isShort;
    return data;
  }
}

List<VideoModel> topVideos = videos
    .map((t) => VideoModel.fromJson(t))
    .where((item) => item.isTop == true)
    .toList();
List<VideoModel> shortVideos = videos
    .map((t) => VideoModel.fromJson(t))
    .where((item) => item.isShort == true)
    .toList();
List<VideoModel> allVideos = videos
    .map((t) => VideoModel.fromJson(t))
    .where((item) => item.isTop == false)
    .toList();

var videos = [
  {
    "id": "1",
    "author": "Deniz",
    "authorImg": "assets/avatar.png",
    "title": "Flutter Trendyol Login UI Clone w/Animations | Speed Code",
    "videoImg": "assets/deniz-codes-sc.png",
    "duration": "3:20",
    "createdAt": "5 days ago",
    "views": "200",
    "likes": "78",
    "dislikes": "4",
    "isTop": true,
    "isShort": true
  },
  {
    "id": "2",
    "author": "Huwaei",
    "authorImg": "assets/avatar.png",
    "title": "Flutter Paribu UI Clone | Speed Code",
    "videoImg": "assets/deniz-codes-sc1.png",
    "duration": "2:10",
    "createdAt": "1 week ago",
    "views": "128",
    "likes": "9",
    "dislikes": "4",
    "isTop": false,
    "isShort": true
  },
  {
    "id": "1",
    "author": "Deniz",
    "authorImg": "assets/avatar.png",
    "title": "Flutter Trendyol Login UI Clone w/Animations | Speed Code",
    "videoImg": "assets/deniz-codes-sc.png",
    "duration": "3:20",
    "createdAt": "5 days ago",
    "views": "200",
    "likes": "78",
    "dislikes": "4",
    "isTop": false,
    "isShort": true
  },
  {
    "id": "3",
    "author": "Huawei Mobil Türkiye",
    "authorImg": "assets/huawei-avatar.jpeg",
    "title": "Huawei AppGallery'de Boş Yok",
    "videoImg": "assets/deniz-codes-hw.jpeg",
    "duration": "2:18",
    "createdAt": "2 weeks ago",
    "views": "1.2M",
    "likes": "60k",
    "dislikes": "35",
    "isTop": false,
    "isShort": true
  },
  {
    "id": "4",
    "author": "Huawei",
    "authorImg": "assets/huawei-avatar.jpeg",
    "title": "HUAWE WATCH GT2 Pro - Stay in the zone",
    "videoImg": "assets/deniz-codes-hw-gt2.jpeg",
    "duration": "2:15",
    "createdAt": "2 months ago",
    "views": "11K",
    "likes": "35",
    "dislikes": "4",
    "isTop": false,
    "isShort": true
  },
  {
    "id": "5",
    "author": "Huawei",
    "authorImg": "assets/huawei-avatar.jpeg",
    "title": "HUAWEI FreeBuds 4i – Perfect Sound Anytime",
    "videoImg": "assets/deniz-codes-hw-buds.jpeg",
    "duration": "4:30",
    "createdAt": "3 months ago",
    "views": "1.5M",
    "likes": "30k",
    "dislikes": "4",
    "isTop": false,
    "isShort": true
  }
];
