

class Bookingmodel {
  final int taskId;
  final String description;
  final String location;
  final int budget;
  final String deadline;
  final String status;

  Bookingmodel({
    required this.taskId,
    required this.description,
    required this.location,
    required this.budget,
    required this.deadline,
    required this.status,
  });

  factory Bookingmodel.fromJson(Map<String, dynamic> json) {
    return Bookingmodel(
      taskId: json['task_id'] ?? 0,
      description: json['task_description'] ?? '',
      location: json['location'] ?? '',
      budget: json['budget'] ?? 0,
      deadline: json['deadline_date'] ?? '',
      status: json['task_status'] ?? '',
    );
  }
}

class BookingEstimateModel {
  final int estimateId;
  final String amount;
  final String description;
  final String status;
  final String shopName;
  final String shopPhone;
  final String shopEmail;
  final String address;

  BookingEstimateModel({
    required this.estimateId,
    required this.amount,
    required this.description,
    required this.status,
    required this.shopName,
    required this.shopPhone,
    required this.shopEmail,
    required this.address,
  });

  factory BookingEstimateModel.fromJson(Map<String, dynamic> json) {
    return BookingEstimateModel(
      estimateId: json['estimate_id'] ?? 0,
      amount: json['estimate_amount'] ?? '0.00',
      description: json['estimate_description'] ?? '',
      status: json['estimate_status'] ?? '',
      shopName: json['shop_name'] ?? 'Unknown Shop',
      shopPhone: json['shop_phone'] ?? '',
      shopEmail: json['shop_email'] ?? '',
      address: json['address'] ?? '',
    );
  }
}
