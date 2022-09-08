class AppInfoM {
  final String title;
  final String subtitle;
  final Rating ratings;
  final String age;
  final String chart;
  final String developer;
  final String language;
  final String size;
  final Update update;
  final String logoImageUrl;
  final String backgroundImageUrl;
  final List? previewImages;

  AppInfoM(
      this.title,
      this.subtitle,
      this.ratings,
      this.age,
      this.chart,
      this.developer,
      this.language,
      this.size,
      this.update,
      this.logoImageUrl,
      this.backgroundImageUrl,
      this.previewImages);

  AppInfoM.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        subtitle = json['subtitle'],
        ratings = Rating.fromJson(json['ratings']),
        age = json['age'],
        chart = json['chart'],
        developer = json['developer'],
        language = json['language'],
        size = json['size'],
        update = Update.fromJson(json['update']),
        logoImageUrl = json['logoImageUrl'],
        backgroundImageUrl = json['backgroudImageUrl'],
        previewImages = json['previewImages'];

  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'ratings': ratings.toJson(),
    'age': age,
    'chart': chart,
    'developer': developer,
    'language': language,
    'size': size,
    'update': update.toJson(),
    'logoImageUrl': logoImageUrl,
    'backgroudImageUrl': backgroundImageUrl,
    'previewImages': previewImages
  };
}

class Rating {
  final String count;
  final String value;

  Rating(this.count, this.value);

  Rating.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        value = json['value'];

  Map<String, dynamic> toJson() => {
    'count': count,
    'value': value,
  };
}

class Update {
  final String version;
  final String time;
  final String body;

  Update(this.version, this.time, this.body);

  Update.fromJson(Map<String, dynamic> json)
      : version = json['version'],
        time = json['time'],
        body = json['body'];

  Map<String, dynamic> toJson() => {
    'version': version,
    'time': time,
    'body': body,
  };
}
