import 'package:shater/core/network/decodable.dart';


class User implements Decodable<User> {
  int? id;
  String? name;
  String? token;
  String? phone;
  String? createdAt;
  String? updatedAt;
  String? zoneWiseTopic;
  int? isOwner;
  String? image;
  int? status;
  String? firebaseToken;
  int? inAppNotification;
  int? pushNotification;
  bool? isPhoneVerified;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['token'] = token;
    data['name'] = name;
    data['phone'] = phone;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['zone_wise_topic'] = zoneWiseTopic;
    data['is_owner'] = isOwner;
    data['image'] = image;
    data['status'] = status;
    data['firebase_token'] = firebaseToken;
    data['in_app_notification'] = inAppNotification;
    data['push_notification'] = pushNotification;
    data['is_phone_verified'] = isPhoneVerified;
    // if ( store != null) {
    //   data['store'] = store!.toJson();
    // }
    return data;
  }

  @override
  User decode(dynamic data) {
    id = data['id'];
    token = data['token'];
    name = data['name'];
    phone = data['phone'];
    createdAt = data['created_at'];
    updatedAt = data['updated_at'];
    zoneWiseTopic = data['zone_wise_topic'];
    isOwner = data['is_owner'];
    image = data['image'];
    status = data['status'];
    firebaseToken = data['firebase_token'];
    pushNotification = data['push_notification'];
    isPhoneVerified = data['is_phone_verified'];
    // if (data['store'] != null) {
    //   store = StoreModel.fromJson(data['store']);
    // }
    if( data['in_app_notification'] is int){
inAppNotification = data['in_app_notification'];
    }else if(data['in_app_notification'] is bool){
  inAppNotification = (data['in_app_notification'] ?? false) ? 1 : 0;
    }

    return this;
  }
}
