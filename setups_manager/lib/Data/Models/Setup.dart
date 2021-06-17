// @dart=2.9
class Setup {
  String id;
  String build;
  String health;
  String inUseBy;
  String name;
  bool nuage;
  String hotfix;
  String state;
  String cephDeploymentType;
  String usedFor;
  String version;
  DateTime lastEdit;

  Setup(
      {this.id,
      this.build,
      this.health,
      this.inUseBy,
      this.name,
      this.nuage,
      this.hotfix,
      this.state,
      this.cephDeploymentType,
      this.usedFor,
      this.version,
      this.lastEdit});

  Setup.fromJson(Map<String, dynamic> json, String id) {
    this.id = id;
    build = json['build'];
    health = json['health'];
    inUseBy = json['inUseBy'];
    name = json['name'];
    nuage = json['nuage'];
    hotfix = json['hotfix'];
    state = json['state'];

    cephDeploymentType = json['cephDeploymentType'];
    usedFor = json['usedFor'];
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
    data['hotfix'] = this.hotfix;
    data['state'] = this.state;
    data['cephDeploymentType'] = this.cephDeploymentType;
    data['usedFor'] = this.usedFor;
    data['version'] = this.version;
    data['lastEdit'] = this.lastEdit;
    return data;
  }
}
