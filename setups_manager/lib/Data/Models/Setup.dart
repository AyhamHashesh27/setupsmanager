// @dart=2.9
class Setup {
  String id;
  String build;
  String health;
  String inUseBy;
  String name;
  bool nuage;
  String pack;
  String state;
  String type;
  String userFor;
  String version;
  DateTime lastEdit;

  Setup(
      {this.id,
      this.build,
      this.health,
      this.inUseBy,
      this.name,
      this.nuage,
      this.pack,
      this.state,
      this.type,
      this.userFor,
      this.version,
      this.lastEdit});

  Setup.fromJson(Map<String, dynamic> json, String id) {
    this.id = id;
    build = json['build'];
    health = json['health'];
    inUseBy = json['inUseBy'];
    name = json['name'];
    nuage = json['nuage'];
    pack = json['pack'];
    state = json['state'];
    type = json['type'];
    userFor = json['userFor'];
    version = json['version'];
    lastEdit = json['lastEdit'].toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['build'] = this.build;
    data['health'] = this.health;
    data['inUseBy'] = this.inUseBy;
    data['name'] = this.name;
    data['nuage'] = this.nuage;
    data['pack'] = this.pack;
    data['state'] = this.state;
    data['type'] = this.type;
    data['userFor'] = this.userFor;
    data['version'] = this.version;
    data['lastEdit'] = this.lastEdit;
    return data;
  }
}
