import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Detail/completed_task_detail_screen.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Detail/detail_screen.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Detail/inprogresstask_detail_screen.dart';
import 'package:via_vita_mobile_app/DataModels/task_model.dart';
import 'package:via_vita_mobile_app/Providers/task_status_provider.dart';
import 'package:via_vita_mobile_app/Worker/Detail/inprogresstask_detail_screen.dart'; 

enum TaskStatusFilter { pending, inProgress, completed }

class TasksScreen extends StatefulWidget {
  final String customerId; 

  const TasksScreen({Key? key, required this.customerId}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TaskStatusFilter _selectedStatus = TaskStatusFilter.pending;

  @override
  void initState() {
    super.initState();
    // Fetch data when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TaskStatusProvider>(context, listen: false).fetchAllTasksStatus(widget.customerId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Tasks',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Consumer<TaskStatusProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // FIX: Logic moved directly here to avoid function errors
          List<TaskModel> currentTasks = [];
          
          if (_selectedStatus == TaskStatusFilter.pending) {
            currentTasks = provider.pendingTasks;
          } else if (_selectedStatus == TaskStatusFilter.inProgress) {
            currentTasks = provider.inProgressTasks;
          } else if (_selectedStatus == TaskStatusFilter.completed) {
            currentTasks = provider.completedTasks;
          }

          return Column(
            children: [
              // Segmented Control for Task Status
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Row(
                  children: [
                    _buildStatusButton(TaskStatusFilter.pending, 'Pending Task'),
                    const SizedBox(width: 10),
                    _buildStatusButton(TaskStatusFilter.inProgress, 'In Progress'),
                    const SizedBox(width: 10),
                    _buildStatusButton(TaskStatusFilter.completed, 'Completed'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // List of Task Cards
              Expanded(
                child: currentTasks.isEmpty
                    ? Center(
                        child: Text(
                          'No ${_getTabName(_selectedStatus)} tasks.',
                          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: currentTasks.length,
                        itemBuilder: (context, index) {
                          final task = currentTasks[index];
                          return _buildTaskCard(task, provider);
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  String _getTabName(TaskStatusFilter status) {
    switch (status) {
      case TaskStatusFilter.pending: return "pending";
      case TaskStatusFilter.inProgress: return "in-progress";
      case TaskStatusFilter.completed: return "completed";
    }
  }

  Widget _buildStatusButton(TaskStatusFilter status, String label) {
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
            color: isSelected ? colors.task_progress_color : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? colors.progress_bar_text_color : colors.task_text_color,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard(TaskModel task, TaskStatusProvider provider) {
  return InkWell(
    onTap: () {
      if (_selectedStatus == TaskStatusFilter.completed) {
        // NAVIGATE TO COMPLETED DETAIL SCREEN
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CompletedTaskDetailScreen(
              title: task.categoryname,
              budget: task.budget ?? '0',
              location: task.location ?? 'Not specified',
              deadline: task.deadlineDate ?? 'N/A',
              description: task.description ?? 'No description provided.',
              taskId: task.taskId,
            ),
          ),
        );
      }
      
      else if(_selectedStatus == TaskStatusFilter.inProgress){
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => InprogressCustomerDetailScreen(
              title: task.categoryname,
              budget: task.budget ?? '0',
              location: task.location ?? 'Not specified',
              deadline: task.deadlineDate ?? 'N/A',
              description: task.description ?? 'No description provided.',
              taskId: task.taskId,
            ),
          ),
        );

      }
       else {
        // NAVIGATE TO REGULAR DETAIL SCREEN (Pending/In Progress)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TaskDetailScreen(
              title: task.categoryname,
              deadline: task.deadlineDate,
              budget: task.budget,
              description: task.description,
              location: task.location,
              categoryid: task.jobCategory,
              id: task.taskId,
            ),
          ),
        );
      }
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
              offset: const Offset(0, 3),
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
                  task.categoryname, 
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: colors.task_text_color,
                  ),
                ),
                Text(
                  "₹${task.budget ?? '0'}/-",
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: colors.task_text_color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: colors.divider_color),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    task.description ?? "No description provided",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: colors.task_text_color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
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