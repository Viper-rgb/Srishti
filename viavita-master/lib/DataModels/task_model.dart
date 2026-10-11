class TaskModel {
  final String taskId;
  final String jobCategory;
  final String categoryname;
  final String description;
  final String location;
  final String budget;
  final String deadlineDate;
  final String status;
  final String customerId;
  final String createdDate;
 // final CustomerDetails? customerDetails;

  TaskModel({
    required this.taskId,
    required this.jobCategory,
    required this.categoryname,
    required this.description,
    required this.location,
    required this.budget,
    required this.deadlineDate,
    required this.status,
    required this.customerId,
    required this.createdDate,
    //this.customerDetails,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskId: json['task_id'] ?? '',
      jobCategory: json['job_category'] ?? '',
      categoryname: json['category_name'] ?? '',
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      budget: json['budget'] ?? '0',
      deadlineDate: json['deadline_date'] ?? '',
      status: json['status'] ?? '0',
      customerId: json['customer_id'] ?? '',
      createdDate: json['created_date'] ?? '',
      // customerDetails: json['customer_details'] != null
      //     ? CustomerDetails.fromJson(json['customer_details'])
      //     : null,
    );
  }
}

