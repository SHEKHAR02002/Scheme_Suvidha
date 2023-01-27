import 'package:flutter_cache_manager/flutter_cache_manager.dart';

String aadharImage = "", fcmToken = "";
String? aadharNo, dob, gender, name, phoneNo;
String? udidNo,
    udidname,
    disbilitytype,
    disabilitypercentage,
    dataissue,
    validupto;

final customCacheManager = CacheManager(Config('customCacheManager',
    stalePeriod: const Duration(minutes: 2), maxNrOfCacheObjects: 100));
