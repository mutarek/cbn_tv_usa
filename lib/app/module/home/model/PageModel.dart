class PageModel {
  int? id;
  Guid? title;
  Content? content;

  PageModel({this.id, this.title, this.content});

  PageModel.fromJson(dynamic json) {
    id = json["id"];
    title = json['title'] != null ? Guid.fromJson(json['title']) : null;
    content =
        json['content'] != null ? Content.fromJson(json['content']) : null;
  }
}

class Guid {
  String? rendered;

  Guid({this.rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = rendered;
    return data;
  }
}

class Content {
  String? rendered;

  Content({this.rendered});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['rendered'] = rendered;
    return data;
  }
}
