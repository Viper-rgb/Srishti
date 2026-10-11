import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Profile/edit_profile_screen.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Profile/profile_card.dart';
import 'package:via_vita_mobile_app/Shopkeeper/SKLoginScreen/sk_loginscreen.dart';
import 'package:via_vita_mobile_app/color/colors.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    // Prevents closing by tapping outside
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        // Set the custom rounded shape for the dialog box
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // Removes default padding/margins around the content
        contentPadding: const EdgeInsets.all(30.0),
        
        // Custom content: Title and prompt text
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Logout',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Are you sure you want to Logout?',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            // The row for the buttons
            Row(
              children: <Widget>[
                // 1. "No" Button (Outlined with Red Text)
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.app_color_1)
                      ),
                      child: Center(child: Text('No',style: TextStyle(color: colors.app_color_1),)),
                      height: 50,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                // 2. "Yes" Button (Gradient)
                Expanded(
                  child:  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SkLoginscreen()));
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                         gradient: LinearGradient(colors: [
                          colors.app_color_1,colors.app_color_2
                        ])),  child: Center(child: Text('Yes',style: TextStyle(color: colors.background_color),)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
  
  
  @override
  Widget build(BuildContext context) {
   final displaysize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colors.background_color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: displaysize.height * .25,
                  width: displaysize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                    gradient: LinearGradient(colors: [colors.app_color_1,colors.app_color_2])),
                
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: displaysize.width * .04),
                    child: Column(
                  
                      children: [Center(child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 16,)),
                            Text('Profile',style: TextStyle(color: Colors.white),),
                             InkWell(
                              onTap: () {
                                showLogoutDialog(context);
                              },
                              child: Icon(Icons.logout,color: Colors.white,size: 17,)),

                          ],
                        ),
                      ))]),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -displaysize.height * .08,
                  
                  child: CircleAvatar(
                    radius:displaysize.height * .08,
                    backgroundImage: AssetImage(Images.profile_image),
                  ),
                  // child: Consumer<HomeProvider>(
                  //   //displaysize.height * .07
                  //   builder: (context, value, child) {
                  //     return Center(
                  //       child: HomeWidget.profile_image(
                  //         context,
                  //         radius: displaysize.height * .16,
                  //         datamodel: value.userprofileDataResponce,
                  //         color: theme.colorScheme.primary,
                  //       ),
                  //     );
                  //   },
                  // ),
                ),
                
              ],
            ),
          
                   SizedBox(height: displaysize.height * .09),  Text('Ashmi A B',style: TextStyle(fontWeight: FontWeight.bold),),
                   Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen(customerId: '', currentImage: '',)));
                          },
                          child: Image.asset(Appicons.edit_icon,scale: 5,))
                      ),
                       SizedBox(height: displaysize.height * .06),
                    ],
                   ),
           Padding(
             padding: EdgeInsets.symmetric(horizontal: displaysize.width * .05),
             child: Column(
              children: [
                           ProfileInfoCard(
              icon: Appicons.gender_icon,
              label: 'Gender',
              value: 'Female',
              iconColor: Colors.red[300]!,
                       ),
                       SizedBox(height: 16),
                       ProfileInfoCard(
              icon: Appicons.call_icon,
              label: 'Phone Number',
              value: '+91 1234567890',
              iconColor: Colors.red[300]!,
                       ),
                       SizedBox(height: 16),
                       ProfileInfoCard(
              icon: Appicons.email_icon,
              label: 'Email ID',
              value: 'abisha12@gmail.com',
              iconColor: Colors.red[300]!,
                       ),
                       SizedBox(height: 16),
                       ProfileInfoCard(
              icon: Appicons.loaction_icon,
              label: 'Address',
              value: '123-city, Trivandrum',
              iconColor: Colors.red[300]!,
                       ),
              // 
              ],
             ),
           )                    ],

            //         Padding(
            //           padding: EdgeInsets.symmetric(horizontal: displaysize.width * .08),
            //           child: Consumer<HomeProvider>(
            //             builder: (context, value, child) {
            //               List<Map<String, dynamic>> profile_data = [
            //                 {
            //                   'icon': icons.person,
            //                   'title': 'Name',
            //                   'data': value.userprofileDataResponce?.profileData.name,
            //                 },
            //                 {
            //                   'icon': icons.mail,
            //                   'title': 'Email ID',
            //                   'data': value.userprofileDataResponce?.profileData.email,
            //                 },
            //                 {
            //                   'icon': icons.phone,
            //                   'title': 'Phone Number',
            //                   'data': value.userprofileDataResponce?.profileData.phone,
            //                 },
            //                 {
            //                   'icon': icons.location,
            //                   'title': 'Address',
            //                   'data': value.userprofileDataResponce?.profileData.address,
            //                 },
            //               ];
            //               return Column(
            //                 children: List.generate(profile_data.length, (index) {
            //                   return Column(
            //                     children: [
            //                       Row(
            //                         children: [
            //                           Container(
            //                             height: (displaysize.height * .03) * 2,
            //                             width: (displaysize.height * .03) * 2,
            //                             decoration: BoxDecoration(
            //                               borderRadius: BorderRadius.circular(displaysize.width / 4),
            //                               color: theme.colorScheme.primary,
            //                             ),
            //                             child: Center(
            //                               child: Image.asset(
            //                                 profile_data[index]['icon'],
            //                                 height: displaysize.height * .025,
            //                                 color: theme.colorScheme.surface,
            //                               ),
            //                             ),
            //                           ),
            //                           SizedBox(width: displaysize.height * .02),
            //                           Column(
            //                             crossAxisAlignment: CrossAxisAlignment.start,
            //                             children: [
            //                               Txt(
            //                                 profile_data[index]['title'],
            //                                 color: theme.colorScheme.secondary,
            //                                 size: displaysize.height * .016,
            //                                 font: Font.medium,
            //                               ),
            //                               value.userprofileDataResponce != null
            //                                   ? Txt(
            //                                     profile_data[index]['data'],
            //                                     size: displaysize.height * .018,
            //                                     font: Font.medium,
            //                                   )
            //                                   : ShimmerEffect(
            //                                     height: displaysize.height * .02,
            //                                     width: displaysize.width * .5,
            //                                   ),
            //                             ],
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(height: displaysize.height * .02),
            //                   );
            //                 }),
            //               );
            //             },
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // bottomNavigationBar: SizedBox(
            //   height: displaysize.height * .1,
            //   child: Center(
            //     child: Padding(
            //       padding: EdgeInsets.symmetric(horizontal: displaysize.width * .04),
            //       child: SizedBox(
            //         height: displaysize.height * .06,
            //         width: displaysize.width,
            //         child: ElevatedButton(
            //           onPressed: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(builder: (context) => EditProfileScreen()),
            //             );
            //             context.read<HomeProvider>().update_slected_image(null);
            //           },
            //           style: ButtonstyleWidget().elevated_filled_apptheme(context),
            //           child: Txt(
            //             'Edit',
            //             color: theme.colorScheme.surface,
            //             font: Font.medium,
            //             size: displaysize.height * .02,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
         ))   );
  }
}
