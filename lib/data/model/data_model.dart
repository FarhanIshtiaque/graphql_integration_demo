class DataModel {
  String? missionName;
  String? launchDateLocal;
  LaunchSite? launchSite;
  Links? links;
  Rocket? rocket;

  DataModel(
      {this.missionName,
        this.launchDateLocal,
        this.launchSite,
        this.links,
        this.rocket});

  DataModel.fromJson(Map<String, dynamic> json) {
    missionName = json['mission_name'];
    launchDateLocal = json['launch_date_local'];
    launchSite = json['launch_site'] != null
        ? new LaunchSite.fromJson(json['launch_site'])
        : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    rocket =
    json['rocket'] != null ? new Rocket.fromJson(json['rocket']) : null;
  }


}

class LaunchSite {
  String? siteNameLong;

  LaunchSite({this.siteNameLong});

  LaunchSite.fromJson(Map<String, dynamic> json) {
    siteNameLong = json['site_name_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['site_name_long'] = this.siteNameLong;
    return data;
  }
}

class Links {
  String? articleLink;
  String? videoLink;

  Links({this.articleLink, this.videoLink});

  Links.fromJson(Map<String, dynamic> json) {
    articleLink = json['article_link'];
    videoLink = json['video_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article_link'] = this.articleLink;
    data['video_link'] = this.videoLink;
    return data;
  }
}

class Rocket {
  String? rocketName;

  Rocket({this.rocketName});

  Rocket.fromJson(Map<String, dynamic> json) {
    rocketName = json['rocket_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rocket_name'] = this.rocketName;
    return data;
  }
}
