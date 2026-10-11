import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/color/colors.dart';
import 'package:via_vita_mobile_app/screens/DetailScreen/detail_screen.dart';



class Task {
  final String title;
  final String description;
  final String price;
  final TaskStatus status;

  Task({
    required this.title,
    required this.description,
    required this.price,
    required this.status,
  });
}

enum TaskStatus { pending, inProgress, completed }

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TaskStatus _selectedStatus = TaskStatus.pending;

  final List<Task> allTasks = [
    Task(
      title: 'Electrical Work',
      description: 'Rewire living room, install ceiling fans and light fixtures.',
      price: '₹25,000/-',
      status: TaskStatus.pending,
    ),
    Task(
      title: 'Gardening',
      description: 'Plant new shrubs, trim hedges, and prepare garden soil.',
      price: '₹5,000/-',
      status: TaskStatus.pending,
    ),
    Task(
      title: 'House Cleaning',
      description: 'Deep clean 3BHK home including kitchen, bathrooms, and living area.',
      price: '₹2,500/-',
      status: TaskStatus.inProgress,
    ),
    Task(
      title: 'Plumbing Repair',
      description: 'Fix leaky faucet in kitchen and unclog bathroom drain.',
      price: '₹1,500/-',
      status: TaskStatus.inProgress,
    ),
    Task(
      title: 'Painting Job',
      description: 'Paint two bedrooms and a living room with chosen colors.',
      price: '₹12,000/-',
      status: TaskStatus.completed,
    ),
    Task(
      title: 'AC Servicing',
      description: 'Full servicing of two split AC units.',
      price: '₹1,000/-',
      status: TaskStatus.completed,
    ),
  ];

  List<Task> get _filteredTasks {
    return allTasks.where((task) => task.status == _selectedStatus).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Custom height for the AppBar
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
            onPressed: () {
              Navigator.of(context).pop(); // Go back
            },
          ),
          title: const Text(
            'Tasks',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        
        
        ),
      ),
      body: Column(
        children: [
          // Segmented Control for Task Status
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              children: [
                _buildStatusButton(TaskStatus.pending, 'Pending Task'),
                const SizedBox(width: 10),
                _buildStatusButton(TaskStatus.inProgress, 'In Progress'),
                const SizedBox(width: 10),
                _buildStatusButton(TaskStatus.completed, 'Completed'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // List of Task Cards
          Expanded(
            child: _filteredTasks.isEmpty
                ? Center(
                    child: Text(
                      'No ${_selectedStatus.toString().split('.').last} tasks.',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: _filteredTasks.length,
                    itemBuilder: (context, index) {
                      final task = _filteredTasks[index];
                      return _buildTaskCard(task);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusButton(TaskStatus status, String label) {
    bool isSelected = _selectedStatus == status;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedStatus = status;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected ? colors.task_progress_color : Colors.white, // Light red/orange background
            borderRadius: BorderRadius.circular(8),
            
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? colors.progress_bar_text_color : colors.task_text_color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard(Task task) {
    return InkWell(
      onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaintingDetailsScreen()));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colors.task_list_color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: colors.task_text_color
                  ),
                ),
                Text(
                  task.price,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: colors.task_text_color// Price color
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: colors.divider_color
            ),
           SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    task.description,
                    style: TextStyle(
                      fontSize: 13,
                      color: colors.task_text_color,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  color: colors.task_text_color,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}