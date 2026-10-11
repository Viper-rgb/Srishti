// import 'package:flutter/material.dart';
// import 'package:via_vita_mobile_app/CommonScreens/colors.dart';


// class AddTasksScreen extends StatefulWidget {
//   const AddTasksScreen({super.key});

//   @override
//   State<AddTasksScreen> createState() => _AddTasksScreenState();
// }

// class _AddTasksScreenState extends State<AddTasksScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: colors.background_color,
//       // 1. App Bar
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           'Add Tasks',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w500,
//             fontSize: 17,
//           ),
//         ),
//         backgroundColor: colors.background_color,
//         elevation: 0,
//         centerTitle: false,
//       ),
      
//       // 2. Body with Scrollable Form
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             // Job Category
//             _buildLabel('Job Category'),
//             _buildJobCategoryField(),
//             const SizedBox(height: 20),

//             // Description
//             _buildLabel('Description'),
//             _buildDescriptionField(),
//             const SizedBox(height: 20),

//             // Location
//             _buildLabel('Location'),
//             _buildInputField(hintText: 'Location'),
//             const SizedBox(height: 20),

//             // Estimated Budget
//             _buildLabel('Estimated Budget'),
//             _buildBudgetField(),
//             const SizedBox(height: 20),

//             // Expected days for completion
//             _buildLabel('Expected days for completion'),
//             _buildDateField(context),
//             const SizedBox(height: 40),
            
//             // Confirm Button
//             _buildConfirmButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   // Helper Widget for Field Labels
//   Widget _buildLabel(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontWeight: FontWeight.w500,
//           fontSize: 14,
//           color: Colors.black87,
//         ),
//       ),
//     );
//   }

//   // Helper for generic text input fields
//   Widget _buildInputField({
//     required String hintText,
//     int maxLines = 1,
//     Widget? prefixIcon,
//     Widget? suffixIcon,
//   }) {
//     return TextFormField(
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: TextStyle(color: Colors.black87,fontSize: 14),
//         fillColor: Colors.grey.shade100,
//         filled: true,
//         prefixIcon: prefixIcon,
//         suffixIcon: suffixIcon,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide.none, // Hide default border
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//             vertical: 18.0, horizontal: 15.0),
//       ),
//     );
//   }

//   // Job Category Field (Dropdown)
//   Widget _buildJobCategoryField() {
//     return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//         hintText: 'Job Category',
//         hintStyle: const TextStyle(color: Colors.grey,fontSize: 14),
//         fillColor: Colors.grey.shade100,
//         filled: true,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide.none,
//         ),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
//       ),
//       items: const [
//         DropdownMenuItem(value: '1', child: Text('Job Category',style: TextStyle(fontSize: 14),)),
//         // Add more items here
//       ],
//       onChanged: (String? newValue) {
//         // Handle dropdown selection
//       },
//       // Set an initial value that matches the hint text
//       value: '1', 
//       isExpanded: true,
//       icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
//     );
//   }

//   // Description Field
//   Widget _buildDescriptionField() {
//     return _buildInputField(
//       hintText: 'Description',
      
//       maxLines: 4,
//     );
//   }

//   // Budget Field
//   Widget _buildBudgetField() {
//     return _buildInputField(
//       hintText: '₹ 0/-',
    
//     );
//   }

//   // Date Field
//   Widget _buildDateField(BuildContext context) {
//     return _buildInputField(
//       hintText: 'DD/MM/YYYY',
//       suffixIcon: Padding(
//         padding: const EdgeInsets.only(right: 8.0),
//         child: IconButton(
//           icon: const Icon(Icons.calendar_today, size: 20, color: Colors.black54),
//           onPressed: () async {
//             // Simulate date picker interaction
//             await showDatePicker(
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime.now(),
//               lastDate: DateTime(2030),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   // Confirm Button with Gradient
//   Widget _buildConfirmButton() {
//     return Container(
//       width: double.infinity,
//       height: 50,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         // Apply the gradient color from dark red to orange
//         gradient: const LinearGradient(
//           colors: [
//            colors.app_color_1,colors.app_color_2
//           ],
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: () {
           
//           },
//           borderRadius: BorderRadius.circular(10),
//           child: const Center(
//             child: Text(
//               'Confirm',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:toastification/toastification.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:intl/intl.dart';
import 'package:via_vita_mobile_app/CommonScreens/toastwidget.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Customer_BottomNavigation/customer_bottom_screen.dart';
import 'package:via_vita_mobile_app/Providers/add_task_provider.dart';
import 'package:via_vita_mobile_app/Providers/profile_provider.dart'; // For date formatting


class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({super.key});

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  // 1. Define Controllers
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  
  String? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    // 2. Fetch categories when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AddTaskProvider>(context, listen: false).fetchCategories();
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _locationController.dispose();
    _budgetController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  // Helper for Date Selection
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
       
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: colors.app_color_1,
            onPrimary: colors.container_color,    
            onSurface: Colors.black
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: colors.app_color_1
            ),
          ),
        ),
        child: child!,
      );
    },
    );
    if (picked != null) {
      setState(() {
        // Format date to YYYY-MM-DD for API compatibility
        _dateController.text = DateFormat('dd-MM-yyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 3. Use Consumer to access Provider data
    return Consumer<AddTaskProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: colors.background_color,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text('Add Tasks', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16)),
            backgroundColor: colors.background_color,
            elevation: 0,
          ),
          body: provider.isLoading && provider.categories.isEmpty 
            ? const Center(child: CircularProgressIndicator()) 
            : SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildLabel('Job Category'),
                _buildJobCategoryField(provider),
                const SizedBox(height: 20),

                _buildLabel('Description'),
                _buildInputField(hintText: 'Description', controller: _descriptionController, maxLines: 4),
                const SizedBox(height: 20),

                _buildLabel('Location'),
                _buildInputField(hintText: 'Location', controller: _locationController),
                const SizedBox(height: 20),

                _buildLabel('Estimated Budget'),
                _buildInputField(hintText: '₹ 0/-', controller: _budgetController, keyboardType: TextInputType.number),
                const SizedBox(height: 20),

                _buildLabel('Expected Deadline'),
                _buildDateField(context),
                const SizedBox(height: 40),
                
                provider.isLoading 
                  ? const Center(child: CircularProgressIndicator()) 
                  : _buildConfirmButton(provider),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black87)),
    );
  }

  Widget _buildInputField({
    required String hintText,
    required TextEditingController controller,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black45, fontSize: 14),
        fillColor: Colors.grey.shade100,
        filled: true,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0),
      ),
    );
  }

  // Updated Job Category Dropdown
  Widget _buildJobCategoryField(AddTaskProvider provider) {
    return DropdownButtonFormField<String>(
      value: _selectedCategoryId,
      decoration: InputDecoration(
        hintText: 'Select Category',
        hintStyle: TextStyle(fontSize: 14),
        fillColor: Colors.grey.shade100,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
      ),
      items: provider.categories.map((cat) {
        return DropdownMenuItem(
          value: cat.id.toString(), // Assuming your model has an id
          child: Text(cat.categoryTitle ?? "Unknown", style: const TextStyle(fontSize: 14)),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedCategoryId = newValue;
        });
      },
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
    );
  }

  Widget _buildDateField(BuildContext context) {
    return _buildInputField(
      hintText: 'DD-MM-YYY',
      controller: _dateController,
      suffixIcon: IconButton(
        icon: const Icon(Icons.calendar_today, size: 20, color: Colors.black54),
        onPressed: () => _selectDate(context),
      ),
    );
  }

  Widget _buildConfirmButton(AddTaskProvider provider) {
        final customerid=Provider.of<ProfileProvider>(context);

    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(colors: [colors.app_color_1, colors.app_color_2]),
      ),
      child: InkWell(
        onTap: () async {
  // 1. Get the profile data
  final profile = Provider.of<ProfileProvider>(context, listen: false).profile;

  // 2. Validation
  if (_selectedCategoryId == null || _descriptionController.text.isEmpty) {
    ToastManager.showSingle(context, title: 'Please fill all fields',type: ToastificationType.info);
    return;
  }
  
  // 3. Check if profile/id exists to avoid crashes
  if (profile == null) {
    ToastManager.showSingle(context, title: 'User profile not found',type: ToastificationType.info);
    return;
  }

  // 4. Call API - Convert ID to String here
  await provider.addTask(
    jobCategory: _selectedCategoryId!,
    description: _descriptionController.text,
    location: _locationController.text,
    budget: _budgetController.text,
    deadlineDate: _dateController.text,
    customerId: profile.id.toString(), // <--- CONVERT INT TO STRING HERE
  );

  if (provider.isSuccess) {
    ToastManager.showSingle(context, title:provider.message,type: ToastificationType.success);
   
    
  } else {
   ToastManager.showSingle(context, title:provider.message,type: ToastificationType.success);
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CustomerBottomScreen())); 
  }
},
        child: const Center(
          child: Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}