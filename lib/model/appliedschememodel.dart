class ApplySchmeDetail {
  String? applicationid;
  String? userid;
  String? name;
  bool? activited;
  String? phoneno;
  int? progress;
  String? schemeid;
  String? schemename;
  String? status;

  ApplySchmeDetail(
      {required this.activited,
      required this.applicationid,
      required this.name,
      required this.phoneno,
      required this.progress,
      required this.schemeid,
      required this.schemename,
      required this.status,
      required this.userid});

  ApplySchmeDetail.fromMap(Map<String, dynamic> map) {
    activited = map['Activited'];
    applicationid = map['Applicationid'];
    name = map['userName'];
    phoneno = map['phoneno'];
    progress = map['progress'];
    schemeid = map['schemeId'];
    schemename = map['schemename'];
    status = map['status'];
    userid = map['userId'];
  }
}
