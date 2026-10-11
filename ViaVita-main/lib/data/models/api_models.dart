//here the data model (list) Used for Storing data from API when services and then extract data into data model variables

class AcceptedTaskModel {
  final String taskId;
  final String jobCategory;
  final String? categoryName;
  final String taskDescription;
  final String location;
  final String budget;
  final String deadlineDate;
  final String status;
  final String customerId;
  final String createdDate;
  final String requirements;

  AcceptedTaskModel({
    required this.taskId,
    required this.jobCategory,
    required this.categoryName,
    required this.taskDescription,
    required this.location,
    required this.budget,
    required this.deadlineDate,
    required this.status,
    required this.customerId,
    required this.createdDate,
    required this.requirements,
  });

  static String _stringFromJson(Map<String, dynamic> json, List<String> keys,
      {String fallback = ''}) {
    for (final key in keys) {
      final value = json[key];
      if (value != null) {
        return value.toString();
      }
    }
    return fallback;
  }

  factory AcceptedTaskModel.fromJson(Map<String, dynamic> json) {
    final categoryName = _stringFromJson(json, ['category_name', 'category', 'job_category', 'title']);
    final description = _stringFromJson(json, ['task_description', 'description', 'details', 'summary'], fallback: '');
    final requirements = _stringFromJson(json, ['requirements', 'requirement', 'requirements_list'], fallback: '');
    final location = _stringFromJson(json, ['location', 'address', 'site_address'], fallback: 'Not specified');
    final budget = _stringFromJson(json, ['budget', 'price', 'estimated_budget'], fallback: '0');
    final deadlineDate = _stringFromJson(json, ['deadline_date', 'expected_deadline', 'deadline'], fallback: 'N/A');
    final status = _stringFromJson(json, ['status', 'task_status', 'progress_status'], fallback: '');
    final customerId = _stringFromJson(json, ['customer_id', 'user_id', 'customerId'], fallback: '');
    final createdDate = _stringFromJson(json, ['created_date', 'createdAt', 'created_at'], fallback: '');
    final taskId = _stringFromJson(json, ['task_id', 'id', 'taskId'], fallback: '');
    final jobCategory = _stringFromJson(json, ['job_category', 'category', 'category_name'], fallback: 'General');

    return AcceptedTaskModel(
      taskId: taskId,
      jobCategory: jobCategory,
      categoryName: categoryName.isNotEmpty ? categoryName : null,
      taskDescription: description,
      location: location,
      budget: budget,
      deadlineDate: deadlineDate,
      status: status,
      customerId: customerId,
      createdDate: createdDate,
      requirements: requirements,
    );
  }
}