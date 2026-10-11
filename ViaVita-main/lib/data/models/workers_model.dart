

class WorkerProfileModel {
  final String userId;
  final String username;
  final String phoneNo;
  final String role;
  final String status;
  final String createdDate;
  final String deviceToken;
  final String workerId;
  final String name;
  final String gender;
  final String age;
  final String phoneNumber;
  final String email;
  final String state;
  final String district;
  final String address;
  final String idProof;
  final String avatar;
  final String subscriptionExpiry;

  WorkerProfileModel({
    required this.userId,
    required this.username,
    required this.phoneNo,
    required this.role,
    required this.status,
    required this.createdDate,
    required this.deviceToken,
    required this.workerId,
    required this.name,
    required this.gender,
    required this.age,
    required this.phoneNumber,
    required this.email,
    required this.state,
    required this.district,
    required this.address,
    required this.idProof,
    required this.avatar,
    required this.subscriptionExpiry
  });

factory  WorkerProfileModel.fromJson(Map<String, dynamic> json) {
  return WorkerProfileModel(
     userId : json['user_id']?.toString() ?? '',
    username : json['username']?.toString() ?? '',
    phoneNo : json['phone_no']?.toString() ?? '',
    role : json['role']?.toString() ?? '',
    status : json['status']?.toString() ?? '',
    createdDate : json['created_date']?.toString() ?? '',
    deviceToken : json['device_token']?.toString() ?? '',
    workerId : json['worker_id']?.toString() ?? '',
    name : json['name']?.toString() ?? '',
    gender : json['gender']?.toString() ?? '',
    age : json['age']?.toString() ?? '',
    phoneNumber : json['phone_number']?.toString() ?? '',
    email : json['email']?.toString() ?? '',
    state : json['state']?.toString() ?? '',
    district : json['district']?.toString() ?? '',
    address : json['address']?.toString() ?? '',
    idProof : json['id_proof']?.toString() ?? '',
    avatar : json['avatar']?.toString() ?? '',
    subscriptionExpiry: json['subscription_expiry']?.toString() ?? '',
  );
   
  }

}