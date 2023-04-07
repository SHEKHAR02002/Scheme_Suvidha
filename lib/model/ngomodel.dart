class NgoModel {
  String? ngoaddress;
  String? ngocontact;
  String? ngodetail;
  String? ngoemail;

  String? ngofacebook;
  String? ngotwitter;
  String? ngowebsite;
  String? ngoinsta;

  String? ngofoundin;
  String? ngofoundcontact;
  String? ngofoundname;

  String? ngoid;
  String? ngologo;

  String? ngoname;

  bool? verification;

  NgoModel(
    this.ngoaddress,
    this.ngocontact,
    this.ngodetail,
    this.ngoemail,
    this.ngofacebook,
    this.ngofoundcontact,
    this.ngofoundin,
    this.ngofoundname,
    this.ngoid,
    this.ngologo,
    this.ngoinsta,
    this.ngoname,
    this.ngotwitter,
    this.ngowebsite,
    this.verification,
  );

  Map<String, dynamic> toMap() {
    return {
      'ngoAddress': ngoaddress,
      'ngoContact': ngocontact,
      'ngoDetails': ngodetail,
      'ngoEmail': ngoemail,
      'ngoFacebook': ngofacebook,
      'ngoFoundedIn': ngofoundin,
      'ngoFounderContact': ngofoundcontact,
      'ngoFounderName': ngofoundname,
      'ngoId': ngoid,
      'ngoLogo': ngologo,
      'ngoName': ngoname,
      'ngoTwitter': ngotwitter,
      'ngoWebsite': ngowebsite
    };
  }

  NgoModel.fromMap(Map<String, dynamic> map) {
    ngoaddress = map['ngoAddress'];
    ngocontact = map['ngoContact'];
    ngodetail = map['ngoDetails'];
    ngoemail = map['ngoEmail'];
    ngofacebook = map['ngoFacebook'];
    ngofoundin = map['ngoFoundedIn'];
    ngofoundcontact = map['ngoFounderContact'];
    ngofoundname = map['ngoFounderName'];
    ngoid = map['ngoId'];
    ngologo = map['ngoLogo'];
    ngoname = map['ngoName'];
    ngotwitter = map['ngoTwitter'];
    ngowebsite = map['ngoWebsite'];
  }
}
