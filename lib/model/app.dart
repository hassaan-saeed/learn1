class Apps {
  final List<App> apps;

  Apps(this.apps);

  Apps.fromJson(Map<String, dynamic> json)
      : apps = (json['apps'] as List).map((app) => App.fromJson(app)).toList();

  Map<String, dynamic> toJson() => {
    'apps' : apps
  };
}

class App {

  final String id;
  final String title;
  final String subtitle;
  final String logoImageUrl;

  App(this.title, this.subtitle, this.logoImageUrl, this.id);

  App.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        subtitle = json['subtitle'],
        logoImageUrl = json['logoImageUrl'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'subtitle': subtitle,
    'logoImageUrl': logoImageUrl
  };

}