class AadharDataModel {
  String? aadharno;
  String? name;
  String? dob;
  String? gender;
  String? phoneno;

  AadharDataModel(
      {this.aadharno, this.name, this.dob, this.gender, this.phoneno});

  AadharDataModel.fromJson(Map<String, dynamic> json) {
    aadharno = json['aadharno'];
    name = json['name'];
    dob = json['dob'];
    gender = json['gender'];
    phoneno = json['phoneno'];
  }
}
