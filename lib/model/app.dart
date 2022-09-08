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

  final String title;
  final String subtitle;
  final String logoImageUrl;

  App(this.title, this.subtitle, this.logoImageUrl);

  App.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        subtitle = json['subtitle'],
        logoImageUrl = json['logoImageUrl'];

  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'logoImageUrl': logoImageUrl
  };

}