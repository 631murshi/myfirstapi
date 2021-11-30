class ModelClass {
  List<Memberlist>? memberlist;

  ModelClass({this.memberlist});

  ModelClass.fromJson(Map<String, dynamic> json) {
    if (json['memberlist'] != null) {
      memberlist = [];
      json['memberlist'].forEach((v) {
        memberlist!.add(new Memberlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.memberlist != null) {
      data['memberlist'] = this.memberlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Memberlist {
  String? image;
  String? name;
  String? title;
  String? popularity;
  String? like;
  String? followers;
  String? ranking;

  Memberlist(
      {this.image,
        this.name,
        this.title,
        this.popularity,
        this.like,
        this.followers,
        this.ranking});

  Memberlist.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    title = json['title'];
    popularity = json['popularity'];
    like = json['like'];
    followers = json['followers'];
    ranking = json['ranking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['title'] = this.title;
    data['popularity'] = this.popularity;
    data['like'] = this.like;
    data['followers'] = this.followers;
    data['ranking'] = this.ranking;
    return data;
  }
}
