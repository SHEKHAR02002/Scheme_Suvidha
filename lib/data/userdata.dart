import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:scheme/model/usermodel.dart';

String aadharImage = "", fcmToken = "";
String? aadharNo, dob, gender, name, phoneNo, aadharimage, image;
String? udidNo,
    udidname,
    disbilitytype,
    disabilitypercentage,
    dataissue,
    validupto,
    udidimage,
    passportimage;

bool registration = false, isagent = false;
AgentModel? agentDetails;
UserModel? userDetail;
String defaultPic =
    "https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/miscellaneous%2Fdefalutprofile.png?alt=media&token=fbf2357d-d893-43a7-9bcc-412f454691c4";
final customCacheManager = CacheManager(Config('customCacheManager',
    stalePeriod: const Duration(minutes: 2), maxNrOfCacheObjects: 100));

String? agentname,
    agentgender,
    agentdob,
    agentoccupation,
    agentaddress,
    agentpincode,
    agentemailid,
    agentpassword;

String? agentbyimage,
    agentbyaadharimage,
    agentbyudidimage,
    agentaadharNo,
    agentbydob,
    agentbygender,
    agentbyname,
    agentbyphoneNo,
    agentbyudidNo,
    agentbyudidname,
    agentbydisbilitytype,
    agentbydisabilitypercentage,
    agentbydataissue,
    agentbyvalidupto;
