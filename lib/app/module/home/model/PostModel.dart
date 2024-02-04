class PostModel {
  int? id;
  DateTime? date;
  DateTime? dateGmt;
  Guid? guid;
  DateTime? modified;
  DateTime? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Guid? title;
  Content? content;
  Yoast_head_json? yoast_head_json;

  PostModel({
    required this.id,
    required this.date,
    required this.dateGmt,
    required this.guid,
    required this.modified,
    required this.modifiedGmt,
    required this.slug,
    required this.status,
    required this.type,
    required this.link,
    required this.title,
    required this.content,
    required this.yoast_head_json,
  });

  PostModel.fromJson(dynamic json) {
    id = json["id"];
    date = DateTime.parse(json["date"]);
    dateGmt = DateTime.parse(json["date_gmt"]);
    guid = Guid.fromJson(json["guid"]);
    modified = DateTime.parse(json["modified"]);
    modifiedGmt = DateTime.parse(json["modified_gmt"]);
    slug = json["slug"];
    status = json["status"];
    type = json["type"];
    link = json["link"];
    title = Guid.fromJson(json["title"]);
    content = Content.fromJson(json["content"]);
    yoast_head_json = Yoast_head_json.fromJson(json["yoast_head_json"]);
  }
}

class Yoast_head_json {
  Yoast_head_json({required this.ogImage, required this.twitter_misc, required this.article_published_time, required this.author});

  String article_published_time;
  String author;
  List<OgImage> ogImage;
  Twitter_misc twitter_misc;

  factory Yoast_head_json.fromJson(Map<String, dynamic> json) => Yoast_head_json(
      article_published_time: json['article_published_time'],
      author: json['author'],
      ogImage: List<OgImage>.from(json["og_image"].map((x) => OgImage.fromJson(x))),
      twitter_misc: Twitter_misc.fromJson(json["twitter_misc"])
      //twitter_misc: json["twitter_misc"]
      );

  Map<String, dynamic> toJson() => {
        "og_image": List<dynamic>.from(ogImage.map((x) => x.toJson())),
        "twitter_misc": twitter_misc.toJson(),
      };
}

class Twitter_misc {
  String reading_time;
  String writed_by;

  Twitter_misc({required this.reading_time, required this.writed_by});

  factory Twitter_misc.fromJson(Map<String, dynamic> json) =>
      Twitter_misc(reading_time: json["Est. reading time"], writed_by: json["Written by"]);

  Map<String, dynamic> toJson() => {"Est. reading time": reading_time, "Written by": writed_by};
}

class OgImage {
  OgImage({
    required this.width,
    required this.height,
    required this.url,
  });

  int width;
  int height;
  String url;

  factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
        width: json["width"],
        height: json["height"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
      };
}

class Content {
  Content({
    required this.rendered,
    required this.protected,
  });

  String rendered;
  bool protected;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class Guid {
  Guid({
    required this.rendered,
  });

  String rendered;

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}
