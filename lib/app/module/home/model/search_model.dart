class SearchModel {
  int? id;
  String? date;
  String? dateGmt;
  Guid? guid;
  String? modified;
  String? modifiedGmt;
  String? slug;
  String? status;
  String? link;
  Guid? title;
  Content? content;
  int? featuredMedia;
  YoastHeadJson? yoastHeadJson;

  SearchModel(
      {this.id,
        this.date,
        this.dateGmt,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.slug,
        this.status,
        this.link,
        this.title,
        this.content,
        this.featuredMedia,
        this.yoastHeadJson,
        });

  SearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? new Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    link = json['link'];
    title = json['title'] != null ? new Guid.fromJson(json['title']) : null;
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;

    featuredMedia = json['featured_media'];
    yoastHeadJson = json['yoast_head_json'] != null
        ? new YoastHeadJson.fromJson(json['yoast_head_json'])
        : null;
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
    data['rendered'] = this.rendered;
    return data;
  }
}

class Content {
  String? rendered;
  bool? protected;

  Content({this.rendered, this.protected});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    data['protected'] = this.protected;
    return data;
  }
}

class Meta {
  String? footnotes;

  Meta({this.footnotes});

  Meta.fromJson(Map<String, dynamic> json) {
    footnotes = json['footnotes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['footnotes'] = this.footnotes;
    return data;
  }
}

class YoastHeadJson {
  TwitterMisc? twitterMisc;

  YoastHeadJson(
      {
        this.twitterMisc,
        });

  YoastHeadJson.fromJson(Map<String, dynamic> json) {
    twitterMisc = json['twitter_misc'] != null
        ? new TwitterMisc.fromJson(json['twitter_misc'])
        : null;
  }
}

class TwitterMisc {
  String? writtenBy;

  TwitterMisc({this.writtenBy});

  TwitterMisc.fromJson(Map<String, dynamic> json) {
    writtenBy = json['Written by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Written by'] = this.writtenBy;
    return data;
  }
}

class Schema {
  String? context;
  List<Graph>? graph;

  Schema({this.context, this.graph});

  Schema.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    if (json['@graph'] != null) {
      graph = <Graph>[];
      json['@graph'].forEach((v) {
        graph!.add(new Graph.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@context'] = this.context;
    if (this.graph != null) {
      data['@graph'] = this.graph!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Graph {
  String? type;
  String? id;
  IsPartOf? isPartOf;
  Author? author;
  String? headline;
  String? datePublished;
  String? dateModified;
  IsPartOf? mainEntityOfPage;
  int? wordCount;
  int? commentCount;
  IsPartOf? publisher;
  String? inLanguage;
  List<PotentialAction>? potentialAction;
  String? url;
  String? name;
  IsPartOf? breadcrumb;
  List<ItemListElement>? itemListElement;
  String? description;
  Logo? logo;
  Image? image;

  Graph(
      {this.type,
        this.id,
        this.isPartOf,
        this.author,
        this.headline,
        this.datePublished,
        this.dateModified,
        this.mainEntityOfPage,
        this.wordCount,
        this.commentCount,
        this.publisher,
        this.inLanguage,
        this.potentialAction,
        this.url,
        this.name,
        this.breadcrumb,
        this.itemListElement,
        this.description,
        this.logo,
        this.image});

  Graph.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    id = json['@id'];
    isPartOf = json['isPartOf'] != null
        ? new IsPartOf.fromJson(json['isPartOf'])
        : null;
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    headline = json['headline'];
    datePublished = json['datePublished'];
    dateModified = json['dateModified'];
    mainEntityOfPage = json['mainEntityOfPage'] != null
        ? new IsPartOf.fromJson(json['mainEntityOfPage'])
        : null;
    wordCount = json['wordCount'];
    commentCount = json['commentCount'];
    publisher = json['publisher'] != null
        ? new IsPartOf.fromJson(json['publisher'])
        : null;
    inLanguage = json['inLanguage'];
    if (json['potentialAction'] != null) {
      potentialAction = <PotentialAction>[];
      json['potentialAction'].forEach((v) {
        potentialAction!.add(new PotentialAction.fromJson(v));
      });
    }
    url = json['url'];
    name = json['name'];
    breadcrumb = json['breadcrumb'] != null
        ? new IsPartOf.fromJson(json['breadcrumb'])
        : null;
    if (json['itemListElement'] != null) {
      itemListElement = <ItemListElement>[];
      json['itemListElement'].forEach((v) {
        itemListElement!.add(new ItemListElement.fromJson(v));
      });
    }
    description = json['description'];
    logo = json['logo'] != null ? new Logo.fromJson(json['logo']) : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['@id'] = this.id;
    if (this.isPartOf != null) {
      data['isPartOf'] = this.isPartOf!.toJson();
    }
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['headline'] = this.headline;
    data['datePublished'] = this.datePublished;
    data['dateModified'] = this.dateModified;
    if (this.mainEntityOfPage != null) {
      data['mainEntityOfPage'] = this.mainEntityOfPage!.toJson();
    }
    data['wordCount'] = this.wordCount;
    data['commentCount'] = this.commentCount;
    if (this.publisher != null) {
      data['publisher'] = this.publisher!.toJson();
    }
    data['inLanguage'] = this.inLanguage;
    if (this.potentialAction != null) {
      data['potentialAction'] =
          this.potentialAction!.map((v) => v.toJson()).toList();
    }
    data['url'] = this.url;
    data['name'] = this.name;
    if (this.breadcrumb != null) {
      data['breadcrumb'] = this.breadcrumb!.toJson();
    }
    if (this.itemListElement != null) {
      data['itemListElement'] =
          this.itemListElement!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    if (this.logo != null) {
      data['logo'] = this.logo!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class IsPartOf {
  String? id;

  IsPartOf({this.id});

  IsPartOf.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.id;
    return data;
  }
}

class Author {
  String? name;
  String? id;

  Author({this.name, this.id});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['@id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['@id'] = this.id;
    return data;
  }
}

class PotentialAction {
  String? type;
  String? name;
  List<String>? target;
  String? queryInput;

  PotentialAction({this.type, this.name, this.target, this.queryInput});

  PotentialAction.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    name = json['name'];
    target = json['target'].cast<String>();
    queryInput = json['query-input'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['name'] = this.name;
    data['target'] = this.target;
    data['query-input'] = this.queryInput;
    return data;
  }
}

class ItemListElement {
  String? type;
  int? position;
  String? name;
  String? item;

  ItemListElement({this.type, this.position, this.name, this.item});

  ItemListElement.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    position = json['position'];
    name = json['name'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['position'] = this.position;
    data['name'] = this.name;
    data['item'] = this.item;
    return data;
  }
}

class Logo {
  String? type;
  String? inLanguage;
  String? id;
  String? url;
  String? contentUrl;
  int? width;
  int? height;
  String? caption;

  Logo(
      {this.type,
        this.inLanguage,
        this.id,
        this.url,
        this.contentUrl,
        this.width,
        this.height,
        this.caption});

  Logo.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    inLanguage = json['inLanguage'];
    id = json['@id'];
    url = json['url'];
    contentUrl = json['contentUrl'];
    width = json['width'];
    height = json['height'];
    caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['inLanguage'] = this.inLanguage;
    data['@id'] = this.id;
    data['url'] = this.url;
    data['contentUrl'] = this.contentUrl;
    data['width'] = this.width;
    data['height'] = this.height;
    data['caption'] = this.caption;
    return data;
  }
}

class Image {
  String? id;
  String? type;
  String? inLanguage;
  String? url;
  String? contentUrl;
  String? caption;

  Image(
      {this.id,
        this.type,
        this.inLanguage,
        this.url,
        this.contentUrl,
        this.caption});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
    type = json['@type'];
    inLanguage = json['inLanguage'];
    url = json['url'];
    contentUrl = json['contentUrl'];
    caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.id;
    data['@type'] = this.type;
    data['inLanguage'] = this.inLanguage;
    data['url'] = this.url;
    data['contentUrl'] = this.contentUrl;
    data['caption'] = this.caption;
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Authors {
  bool? embeddable;
  String? href;

  Authors({this.embeddable, this.href});

  Authors.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['embeddable'] = this.embeddable;
    data['href'] = this.href;
    return data;
  }
}

class VersionHistory {
  int? count;
  String? href;

  VersionHistory({this.count, this.href});

  VersionHistory.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['href'] = this.href;
    return data;
  }
}

class WpTerm {
  String? taxonomy;
  bool? embeddable;
  String? href;

  WpTerm({this.taxonomy, this.embeddable, this.href});

  WpTerm.fromJson(Map<String, dynamic> json) {
    taxonomy = json['taxonomy'];
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxonomy'] = this.taxonomy;
    data['embeddable'] = this.embeddable;
    data['href'] = this.href;
    return data;
  }
}

class Curies {
  String? name;
  String? href;
  bool? templated;

  Curies({this.name, this.href, this.templated});

  Curies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    href = json['href'];
    templated = json['templated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['href'] = this.href;
    data['templated'] = this.templated;
    return data;
  }
}
