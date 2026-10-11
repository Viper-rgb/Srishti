// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:intl/intl.dart';
// // import 'package:toastification/toastification.dart';
// // import 'package:via_vita_mobile_app/CommonScreens/toastwidget.dart';
// // import 'package:via_vita_mobile_app/Customer/Screens/Customer_BottomNavigation/customer_bottom_screen.dart';
// // import 'package:via_vita_mobile_app/Providers/edit_task_provider.dart';
// // import 'package:via_vita_mobile_app/Worker/WokerBottom/worker_bottom_screen.dart';

// // class EditTaskScreen extends StatefulWidget {
// //   final Map taskData; 
// //   const EditTaskScreen({super.key, required this.taskData});

// //   @override
// //   State<EditTaskScreen> createState() => _EditTaskScreenState();
// // }

// // class _EditTaskScreenState extends State<EditTaskScreen> {
// //   final _formKey = GlobalKey<FormState>();
  
// //   late TextEditingController _descController;
// //   late TextEditingController _locController;
// //   late TextEditingController _budgetController;
// //   late TextEditingController _dateController;
// //   String? _selectedCategoryId;

// //   @override
// //   void initState() {
// //     super.initState();
// //     // Initialize controllers with passed data
// //     _descController = TextEditingController(text: widget.taskData['description']);
// //     _locController = TextEditingController(text: widget.taskData['location']);
// //     _budgetController = TextEditingController(text: widget.taskData['budget']);
// //     _dateController = TextEditingController(text: widget.taskData['deadline_date']);
// //     _selectedCategoryId = widget.taskData['job_category_id'].toString();

// //     // Fetch categories when screen opens
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       context.read<EditTaskProvider>().fetchCategories();
// //     });
// //   }

// //   Future<void> _pickDate() async {
// //     DateTime? picked = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime.now(),
// //       firstDate: DateTime.now(),
// //       lastDate: DateTime(2030),
// //     );
// //     if (picked != null) {
// //       setState(() {
// //         _dateController.text = DateFormat('dd-MM-yyyy').format(picked);
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final taskProvider = Provider.of<EditTaskProvider>(context);

// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         title: const Text("Edit Tasks", 
// //           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.symmetric(horizontal: 20),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const SizedBox(height: 10),
// //               _buildLabel("Job Category"),
// //               _buildDropdown(taskProvider),

// //               const SizedBox(height: 20),
// //               _buildLabel("Description"),
// //               _buildField(_descController, "Description", maxLines: 4),

// //               const SizedBox(height: 20),
// //               _buildLabel("Location"),
// //               _buildField(_locController, "Location"),

// //               const SizedBox(height: 20),
// //               _buildLabel("Estimated Budget"),
// //               _buildField(_budgetController, "₹0/-", isNumber: true),

// //               const SizedBox(height: 20),
// //               _buildLabel("Expected days for completion"),
// //               _buildField(_dateController, "DD/MM/YYYY", 
// //                 isReadOnly: true, 
// //                 icon: Icons.calendar_today_outlined, 
// //                 onTap: _pickDate),

// //               const SizedBox(height: 40),
              
// //               // Submit Button
// //               SizedBox(
// //                 width: double.infinity,
// //                 height: 55,
// //                 child: ElevatedButton(
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: const Color(0xFFD34323), // Specific orange from image
// //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //                     elevation: 0,
// //                   ),
// //                   onPressed: taskProvider.isLoading ? null : _submitForm,
// //                   child: taskProvider.isLoading 
// //                     ? const CircularProgressIndicator(color: Colors.white)
// //                     : const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   void _submitForm() {
// //     if (_formKey.currentState!.validate()) {
// //       context.read<EditTaskProvider>().updateTask(
// //         taskId: widget.taskData['task_id'].toString(),
// //         description: _descController.text,
// //         location: _locController.text,
// //         budget: _budgetController.text,
// //         deadlineDate: _dateController.text,
// //         jobCategoryId: _selectedCategoryId!,
// //         onSuccess: () {
// //           ToastManager.showSingle(context, title: 'Task Updated Successfully',type: ToastificationType.success);
// //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CustomerBottomScreen()));
// //         },
// //         onError: (err) {
// //           ToastManager.showSingle(context, title: err,type: ToastificationType.error);
          
// //         },
// //       );
// //     }
// //   }

// //   Widget _buildLabel(String text) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 8),
// //       child: Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87)),
// //     );
// //   }

// //   Widget _buildField(TextEditingController controller, String hint, {int maxLines = 1, bool isNumber = false, bool isReadOnly = false, IconData? icon, VoidCallback? onTap}) {
// //     return TextFormField(
// //       controller: controller,
// //       maxLines: maxLines,
// //       readOnly: isReadOnly,
// //       onTap: onTap,
// //       keyboardType: isNumber ? TextInputType.number : TextInputType.text,
// //       decoration: InputDecoration(
// //         hintText: hint,
// //         hintStyle: const TextStyle(color: Colors.blueGrey, fontSize: 14),
// //         filled: true,
// //         fillColor: const Color(0xFFF7F8F9), // Light background from image
// //         suffixIcon: icon != null ? Icon(icon, color: Colors.blueGrey, size: 20) : null,
// //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
// //       ),
// //       validator: (v) => v!.isEmpty ? "This field is required" : null,
// //     );
// //   }

// //   Widget _buildDropdown(EditTaskProvider provider) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 12),
// //       decoration: BoxDecoration(
// //         color: const Color(0xFFF7F8F9),
// //         borderRadius: BorderRadius.circular(10),
// //       ),
// //       child: DropdownButtonHideUnderline(
// //         child: DropdownButton<String>(
// //           value: _selectedCategoryId,
// //           isExpanded: true,
// //           hint: const Text("Job Category", style: TextStyle(color: Colors.blueGrey, fontSize: 14)),
// //           icon: const Icon(Icons.keyboard_arrow_down, color: Colors.blueGrey),
// //           items: provider.categories.map((cat) {
// //             return DropdownMenuItem(value: cat.id, child: Text(cat.categoryTitle));
// //           }).toList(),
// //           onChanged: (val) => setState(() => _selectedCategoryId = val),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:toastification/toastification.dart';
// import 'package:via_vita_mobile_app/CommonScreens/toastwidget.dart';
// import 'package:via_vita_mobile_app/Customer/Screens/Customer_BottomNavigation/customer_bottom_screen.dart';
// import 'package:via_vita_mobile_app/Providers/edit_task_provider.dart';
// import 'package:via_vita_mobile_app/Providers/cutomer_viewall_taskprovider.dart'; // Import this

// class EditTaskScreen extends StatefulWidget {
//   final Map taskData; 
//   const EditTaskScreen({super.key, required this.taskData});

//   @override
//   State<EditTaskScreen> createState() => _EditTaskScreenState();
// }

// class _EditTaskScreenState extends State<EditTaskScreen> {
//   final _formKey = GlobalKey<FormState>();
  
//   late TextEditingController _descController;
//   late TextEditingController _locController;
//   late TextEditingController _budgetController;
//   late TextEditingController _dateController;
//   String? _selectedCategoryId;

//   @override
//   void initState() {
//     super.initState();
//     // Use .toString() to prevent errors if budget is an int/double from API
//     _descController = TextEditingController(text: widget.taskData['description']?.toString() ?? "");
//     _locController = TextEditingController(text: widget.taskData['location']?.toString() ?? "");
//     _budgetController = TextEditingController(text: widget.taskData['budget']?.toString() ?? "");
//     _dateController = TextEditingController(text: widget.taskData['deadline_date']?.toString() ?? "");
//     _selectedCategoryId = widget.taskData['job_category_id']?.toString();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<EditTaskProvider>().fetchCategories();
//     });
//   }

//   @override
//   void dispose() {
//     _descController.dispose();
//     _locController.dispose();
//     _budgetController.dispose();
//     _dateController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2030),
//     );
//     if (picked != null) {
//       setState(() {
//         _dateController.text = DateFormat('dd-MM-yyyy').format(picked);
//       });
//     }
//   }

//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       final prefs = await SharedPreferences.getInstance();
//       final customerId = prefs.getString("customer_id");

//       context.read<EditTaskProvider>().updateTask(
//         taskId: widget.taskData['task_id'].toString(),
//         description: _descController.text.trim(),
//         location: _locController.text.trim(),
//         budget: _budgetController.text.trim(), // Ensure budget is trimmed
//         deadlineDate: _dateController.text.trim(),
//         jobCategoryId: _selectedCategoryId!,
//         onSuccess: () {
//           // IMPORTANT: Refresh the Home Screen Provider so the budget isn't 0
//           if (customerId != null) {
//             Provider.of<CutomerViewallTaskprovider>(context, listen: false)
//                 .fetchNewCustomerViewallTasks(customerId);
//           }

//           ToastManager.showSingle(context, title: 'Task Updated Successfully', type: ToastificationType.success);
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CustomerBottomScreen()));
//         },
//         onError: (err) {
//           ToastManager.showSingle(context, title: err, type: ToastificationType.error);
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final taskProvider = Provider.of<EditTaskProvider>(context);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text("Edit Tasks", 
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 10),
//               _buildLabel("Job Category"),
//               _buildDropdown(taskProvider),

//               const SizedBox(height: 20),
//               _buildLabel("Description"),
//               _buildField(_descController, "Description", maxLines: 4),

//               const SizedBox(height: 20),
//               _buildLabel("Location"),
//               _buildField(_locController, "Location"),

//               const SizedBox(height: 20),
//               _buildLabel("Estimated Budget"),
//               _buildField(_budgetController, "Enter Amount", isNumber: true),

//               const SizedBox(height: 20),
//               _buildLabel("Expected days for completion"),
//               _buildField(_dateController, "DD-MM-YYYY", 
//                 isReadOnly: true, 
//                 icon: Icons.calendar_today_outlined, 
//                 onTap: _pickDate),

//               const SizedBox(height: 40),
              
//               SizedBox(
//                 width: double.infinity,
//                 height: 55,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFD34323),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   ),
//                   onPressed: taskProvider.isLoading ? null : _submitForm,
//                   child: taskProvider.isLoading 
//                     ? const CircularProgressIndicator(color: Colors.white)
//                     : const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ... (Keep the _buildLabel, _buildField and _buildDropdown helper methods from previous response)
//   Widget _buildLabel(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87)),
//     );
//   }

//   Widget _buildField(TextEditingController controller, String hint, {int maxLines = 1, bool isNumber = false, bool isReadOnly = false, IconData? icon, VoidCallback? onTap}) {
//     return TextFormField(
//       controller: controller,
//       maxLines: maxLines,
//       readOnly: isReadOnly,
//       onTap: onTap,
//       keyboardType: isNumber ? TextInputType.number : TextInputType.text,
//       decoration: InputDecoration(
//         hintText: hint,
//         filled: true,
//         fillColor: const Color(0xFFF7F8F9),
//         suffixIcon: icon != null ? Icon(icon, color: Colors.blueGrey, size: 20) : null,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
//       ),
//       validator: (v) => (v == null || v.isEmpty) ? "This field is required" : null,
//     );
//   }

//   Widget _buildDropdown(EditTaskProvider provider) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(color: const Color(0xFFF7F8F9), borderRadius: BorderRadius.circular(10)),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           value: provider.categories.any((c) => c.id.toString() == _selectedCategoryId) ? _selectedCategoryId : null,
//           isExpanded: true,
//           hint: const Text("Job Category", style: TextStyle(color: Colors.blueGrey, fontSize: 14)),
//           items: provider.categories.map((cat) {
//             return DropdownMenuItem(value: cat.id.toString(), child: Text(cat.categoryTitle));
//           }).toList(),
//           onChanged: (val) => setState(() => _selectedCategoryId = val),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';
import 'package:via_vita_mobile_app/CommonScreens/toastwidget.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Customer_BottomNavigation/customer_bottom_screen.dart';
import 'package:via_vita_mobile_app/Providers/edit_task_provider.dart';
import 'package:via_vita_mobile_app/Providers/cutomer_viewall_taskprovider.dart';

class EditTaskScreen extends StatefulWidget {
  final Map taskData; 
  const EditTaskScreen({super.key, required this.taskData});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _descController;
  late TextEditingController _locController;
  late TextEditingController _budgetController;
  late TextEditingController _dateController;
  String? _selectedCategoryId;

  @override
  void initState() {
    super.initState();

    // BUG FIX: Strip "₹" and extra spaces from the budget string so it's a clean number
    // Example: "₹ 500" becomes "500"
    String rawBudget = widget.taskData['budget']?.toString() ?? "";
    String cleanBudget = rawBudget.replaceAll(RegExp(r'[^0-9.]'), '');

    _descController = TextEditingController(text: widget.taskData['description']?.toString() ?? "");
    _locController = TextEditingController(text: widget.taskData['location']?.toString() ?? "");
    _budgetController = TextEditingController(text: cleanBudget);
    _dateController = TextEditingController(text: widget.taskData['deadline_date']?.toString() ?? "");
    _selectedCategoryId = widget.taskData['job_category_id']?.toString();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EditTaskProvider>().fetchCategories();
    });
  }

  @override
  void dispose() {
    _descController.dispose();
    _locController.dispose();
    _budgetController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      final customerId = prefs.getString("customer_id");

      // Ensure we only send the numeric value
      String finalBudget = _budgetController.text.trim().replaceAll(RegExp(r'[^0-9.]'), '');

      context.read<EditTaskProvider>().updateTask(
        taskId: widget.taskData['task_id'].toString(),
        description: _descController.text.trim(),
        location: _locController.text.trim(),
        budget: finalBudget, // Sending clean numeric string
        deadlineDate: _dateController.text.trim(),
        jobCategoryId: _selectedCategoryId!,
        onSuccess: () {
          // REFRESH the Home Screen list so the new budget/description shows up immediately
          if (customerId != null) {
            Provider.of<CutomerViewallTaskprovider>(context, listen: false)
                .fetchNewCustomerViewallTasks(customerId);
          }

          ToastManager.showSingle(context, 
            title: 'Task Updated Successfully', 
            type: ToastificationType.success);
          
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (context) => const CustomerBottomScreen())
          );
        },
        onError: (err) {
          ToastManager.showSingle(context, title: err, type: ToastificationType.error);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<EditTaskProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Edit Tasks", 
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildLabel("Job Category"),
              _buildDropdown(taskProvider),

              const SizedBox(height: 20),
              _buildLabel("Description"),
              _buildField(_descController, "Description", maxLines: 4),

              const SizedBox(height: 20),
              _buildLabel("Location"),
              _buildField(_locController, "Location"),

              const SizedBox(height: 20),
              _buildLabel("Estimated Budget"),
              _buildField(_budgetController, "Enter Amount", isNumber: true),

              const SizedBox(height: 20),
              _buildLabel("Expected days for completion"),
              _buildField(_dateController, "DD-MM-YYYY", 
                isReadOnly: true, 
                icon: Icons.calendar_today_outlined, 
                onTap: _pickDate),

              const SizedBox(height: 40),
              
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD34323),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: taskProvider.isLoading ? null : _submitForm,
                  child: taskProvider.isLoading 
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Submit", 
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, 
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87)),
    );
  }

  Widget _buildField(TextEditingController controller, String hint, 
      {int maxLines = 1, bool isNumber = false, bool isReadOnly = false, IconData? icon, VoidCallback? onTap}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      readOnly: isReadOnly,
      onTap: onTap,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF7F8F9),
        suffixIcon: icon != null ? Icon(icon, color: Colors.blueGrey, size: 20) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      ),
      validator: (v) => (v == null || v.isEmpty) ? "This field is required" : null,
    );
  }

  Widget _buildDropdown(EditTaskProvider provider) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: const Color(0xFFF7F8F9), borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: provider.categories.any((c) => c.id.toString() == _selectedCategoryId) 
              ? _selectedCategoryId 
              : null,
          isExpanded: true,
          hint: const Text("Job Category", style: TextStyle(color: Colors.blueGrey, fontSize: 14)),
          items: provider.categories.map((cat) {
            return DropdownMenuItem(value: cat.id.toString(), child: Text(cat.categoryTitle));
          }).toList(),
          onChanged: (val) => setState(() => _selectedCategoryId = val),
        ),
      ),
    );
  }
}