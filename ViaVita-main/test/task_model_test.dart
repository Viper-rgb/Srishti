import 'package:flutter_test/flutter_test.dart';
import 'package:workers_app/data/models/api_models.dart';

void main() {
  test('AcceptedTaskModel handles alternate backend field names', () {
    final model = AcceptedTaskModel.fromJson({
      'task_id': 12,
      'category': 'Plumbing',
      'job_category': 'Plumbing',
      'description': 'Fix leaking pipe and install new faucet',
      'location': 'Coimbatore',
      'budget': 2500,
      'deadline_date': '2026-01-20',
      'status': 'in_progress',
      'customer_id': 7,
      'created_date': '2026-01-12',
      'requirement': 'Need complete toolkit',
    });

    expect(model.taskId, '12');
    expect(model.jobCategory, 'Plumbing');
    expect(model.categoryName, 'Plumbing');
    expect(model.taskDescription, 'Fix leaking pipe and install new faucet');
    expect(model.location, 'Coimbatore');
    expect(model.requirements, 'Need complete toolkit');
  });
}
