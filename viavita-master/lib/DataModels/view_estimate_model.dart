class EstimateModel {
  final String estimateId;
  final String taskId;
  final String estimateAmount;
  final String estimateDescription;
  final String estimateStatus;
  final String estimateCreated;
  final String taskDescription;
  final String location;
  final String budget;
  final String deadlineDate;
  final String categoryName;

  EstimateModel({
    required this.estimateId,
    required this.taskId,
    required this.estimateAmount,
    required this.estimateDescription,
    required this.estimateStatus,
    required this.estimateCreated,
    required this.taskDescription,
    required this.location,
    required this.budget,
    required this.deadlineDate,
    required this.categoryName,
  });

  factory EstimateModel.fromJson(Map<String, dynamic> json) {
    return EstimateModel(
      // Handling Stringegers safely
      estimateId: json['estimate_id']?.toString() ?? "",
      taskId: json['task_id']?.toString() ?? "",
      budget: json['budget']?.toString() ?? "",

      // Handling strings safely
      estimateAmount: json['estimate_amount']?.toString() ?? "0.00",
      estimateDescription: json['estimate_description']?.toString() ?? "",
      estimateStatus: json['estimate_status']?.toString() ?? "",
      estimateCreated: json['estimate_created']?.toString() ?? "",
      taskDescription: json['task_description']?.toString() ?? "",
      location: json['location']?.toString() ?? "",
      deadlineDate: json['deadline_date']?.toString() ?? "",
      categoryName: json['category_name']?.toString() ?? "",
    );
  }
}