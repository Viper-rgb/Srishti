import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/color/colors.dart';
import 'package:via_vita_mobile_app/screens/DetailScreen/detail_screen.dart';
import 'package:via_vita_mobile_app/screens/OfferScreen/offer_screen.dart';



class TaskAppScreen extends StatefulWidget {
  const TaskAppScreen({super.key});

  @override
  State<TaskAppScreen> createState() => _TaskAppScreenState();
}

class _TaskAppScreenState extends State<TaskAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.background_color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 1. Header Section
                const HeaderSection(),
                const SizedBox(height: 20),

                // 2. Search Bar
                const SearchBarContainer(),
                const SizedBox(height: 30),

                // 3. Your Pending Tasks Section
                const Text(
                  'Your Pending Tasks',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                const PendingTasksSection(),
                const SizedBox(height: 40),

                // 4. New Offers Section
                const Text(
                  'You have new Offers!',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                const NewOffersSection(),
                // Padding for the bottom
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 1. Header Section Widget
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
             CircleAvatar(
              radius: 25,
              // Replace with an actual image asset or network image
              backgroundImage: AssetImage(Images.profile_image), 
              backgroundColor: Colors.grey,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'Hello,',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                Text(
                  'Ashmi A B',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        Image.asset(Appicons.notification_icon,scale: 4)
      ],
    );
  }
}

// 2. Search Bar Widget
class SearchBarContainer extends StatelessWidget {
  const SearchBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: colors.form_field_color, // Light background color
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: <Widget>[
          Image.asset(Appicons.search_icon,scale: 4),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search here...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.black54,fontSize: 14),
              ),
            ),
          ),
          Image.asset(Appicons.filter_icon,scale: 4)
        ],
      ),
    );
  }
}

// 3. Pending Tasks Section Widget
class PendingTasksSection extends StatelessWidget {
  const PendingTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  <Widget>[
        Expanded(
          child: TaskCard(
            title: 'Electrical Work',
            status: 'Rewire living room, install ceiling fans and light fixtures.... ',
            price: '₹ 25,000 /-',
        
            isPending: true,
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: TaskCard(
            title: 'Gardening',
            status: 'Plant new shrubs, trim hedges, and prepare garden soil.... ',
            price: '₹ 5,000 /-',
          
            isPending: true,
          ),
        ),
        // SizedBox(width: 15),
        //  TaskCard(
        //   title: 'Garden Keeper',
        //   status: 'Awaiting Offers',
        //   imagePath: 'assets/garden_keeper.jpg', // Placeholder
        //   isPending: true,
        // ), // To allow scrolling beyond the screen
      ],
    );
  }
}

// Reusable Widget for Pending Task Card
class TaskCard extends StatelessWidget {
  final String title;
  final String status;
  final String price;
  final bool isPending;

  const TaskCard({
    super.key,
    required this.title,
    required this.status,
    required this.price,
    required this.isPending,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder:(context)=>PaintingDetailsScreen()));
      },
      child: Container(
        width: 170, // Fixed width for the card
        decoration: BoxDecoration(
          color: colors.task_list_color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ), const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 12,
                      color: colors.app_color_1,fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(colors: [colors.app_color_1,colors.app_color_2])
                    ),
                    child: Center(child: Text('View Details',style: TextStyle(color: colors.background_color,fontWeight: FontWeight.w600),)),
                  )
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     style: ElevatedButton.styleFrom(
                  //       // Gradient-like background color
                  //       backgroundColor: isPending
                  //           ? const Color.fromARGB(255, 219, 90, 48) // Orange-red gradient
                  //           : const Color.fromARGB(255, 158, 50, 48), // Darker red for offers
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       padding: const EdgeInsets.symmetric(vertical: 10),
                  //       elevation: 0,
                  //     ),
                  //     child: Text(
                  //       isPending ? 'View Details' : 'View Offers',
                  //       style: const TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 4. New Offers Section Widget
class NewOffersSection extends StatelessWidget {
  const NewOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  <Widget>[
        Expanded(
          child: OfferCard(
            taskTitle: 'Deep Clean',
            offerorName: 'Anil Thomas',
            price: '₹800 per day',
            imagePath: Images.profile_image
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: OfferCard(
            taskTitle: 'Garden Keeper',
            offerorName: 'Sarah Smith',
            price: '₹800 per day',
            imagePath:  Images.profile_image
          ),
        ),
      ],
    );
  }
}

// Reusable Widget for New Offer Card
class OfferCard extends StatelessWidget {
  final String taskTitle;
  final String offerorName;
  final String price;
  final String imagePath;

  const OfferCard({
    super.key,
    required this.taskTitle,
    required this.offerorName,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OffersScreen()));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colors.task_list_color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(imagePath), // Placeholder
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(width: 8),
                Text(
                  taskTitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 45), // Align with task title
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    offerorName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 158, 50, 48), // Price color
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10), Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(colors: [colors.app_color_1,colors.app_color_2])
                    ),
                    child: Center(child: Text('View Offers',style: TextStyle(color: colors.background_color,fontWeight: FontWeight.w600),)),
                  )
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: const Color.fromARGB(255, 158, 50, 48), // Darker red
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       padding: const EdgeInsets.symmetric(vertical: 10),
            //       elevation: 0,
            //     ),
            //     child: const Text(
            //       'View Offers',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// NOTE: You would need to create a simple 'assets' folder and place
// placeholder images (profile_pic.jpg, deep_clean.jpg, garden_keeper.jpg,
// anil_thomas.jpg, sarah_smith.jpg) inside it, and declare the assets folder
// in your pubspec.yaml file under the 'assets:' section for this code to run correctly.