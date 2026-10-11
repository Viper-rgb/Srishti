
class AllRequiremtsShopModel {
  final String taskId;
  final String jobCategory;
  final String categoryName;
  final String taskDescription;
  final String location;
  final String budget;
  final String deadlineDate;
  final String taskStatus;
  final String workerId;
  final String requirements;
  final String workerEmail;
  final String workerPhone;

  AllRequiremtsShopModel({
    required this.taskId,
    required this.jobCategory,
    required this.categoryName,
    required this.taskDescription,
    required this.location,
    required this.budget,
    required this.deadlineDate,
    required this.taskStatus,
    required this.workerId,
    required this.requirements,
    required this.workerEmail,
    required this.workerPhone,
  });

  factory AllRequiremtsShopModel.fromJson(Map<String, dynamic> json) {
    return AllRequiremtsShopModel(
      taskId: json['task_id'] ?? '',
      jobCategory: json['job_category'] ?? '',
      categoryName: json['category_name'] ?? '',
      taskDescription: json['task_description'] ?? '',
      location: json['location'] ?? '',
      budget: json['budget'] ?? '',
      deadlineDate: json['deadline_date'] ?? '',
      taskStatus: json['task_status'] ?? '',
      workerId: json['worker_id'] ?? '',
      requirements: json['requirements'] ?? '',
      workerEmail: json['worker_email'] ?? '',
      workerPhone: json['worker_phone'] ?? '',
    );
  }
}