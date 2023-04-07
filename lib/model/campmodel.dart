class CampsModel {
  String? campbenefit;
  String? campcategory;
  String? camporganization;
  String? campid;
  String? date;
  String? campdescription;
  String? campplace;
  String? camptime;
  String? image;
  String? name;

  CampsModel(
    this.campbenefit,
    this.campcategory,
    this.campdescription,
    this.campid,
    this.camporganization,
    this.campplace,
    this.camptime,
    this.date,
    this.image,
    this.name,
  );

  Map<String, dynamic> toMap() {
    return {
      'campbenefit': campbenefit,
      'Category': campcategory,
      'discription': campdescription,
      'campid': campid,
      'Organization': camporganization,
      'place': campplace,
      'time': camptime,
      'date': date,
      'image': image,
      "campname": name
    };
  }

  // CampsModel.fromSnapshot(snapshot)
  //     : campbenefit = snapshot.data()['campbenefit'],
  //       campcategory = snapshot.data()['Category'],
  //       campdescription = snapshot.data()['discription'],
  //       campid = snapshot.data()['campid'],
  //       camporganization = snapshot.data()['Organization'],
  //       campplace = snapshot.data()['place'],
  //       camptime = snapshot.data()['time'],
  //       date = snapshot.data()['date'],
  //       image = snapshot.data()['image'],
  //       name = snapshot.data()['campname'];

  CampsModel.fromMap(Map<String, dynamic> map) {
    campbenefit = map['campbenefit'];
    campcategory = map['Category'];
    campdescription = map['discription'];
    campid = map['campId'];
    camporganization = map['Organization'];
    campplace = map['place'];
    camptime = map['time'];
    date = map['time'];
    image = map['image'];
    name = map['campname'];
  }
}
