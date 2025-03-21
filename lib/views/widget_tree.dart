import 'package:flutter/material.dart';
import 'package:flutter_application_test/data/notifiers.dart';
import 'package:flutter_application_test/providers/user_providers.dart';
import 'package:flutter_application_test/views/pages/activity_page.dart';
import 'package:flutter_application_test/views/pages/assessment_page.dart';
import 'package:flutter_application_test/views/pages/home_page.dart';
import 'package:flutter_application_test/views/pages/auth/login_page.dart';
import 'package:flutter_application_test/views/pages/promo_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> pages = [
  HomePage(),
  MyPromoPage(),
  ActivityPage(),
  AssessmentPage(),
  LoginPage()
];

List<Widget> authPages = [
  LoginPage()
];

class WidgetTree extends ConsumerWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the auth state changes
    final authState = ref.watch(authUserProvider);
    
    return authState.when(
      data: (user) {
        // If user is authenticated, load their data
        if (user != null) {
          // Load user data when authenticated
          _loadUserData(ref, user.uid);
          
          return Scaffold(
            body: ValueListenableBuilder(
              valueListenable: selectedPageNotifier, 
              builder: (context, selectedPage, child) {
                // return pages.elementAt(selectedPage);
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xffFFF5DC),
                        Color(0xffFCFCFC)
                      ]
                    )
                  ),
                  child: pages.elementAt(selectedPage),
                );
              },
            ),
            // bottomNavigationBar: NavigationBar(
            //   destinations: destinations),
          );
        } else {
          // Not authenticated, show login page
          return const LoginPage();
        }
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Text('Error: ${error.toString()}'),
      ),
    );
  }
  
  // Function to load user data into the Riverpod state
  void _loadUserData(WidgetRef ref, String userId) {
    // Only load the data if the user model is empty (to avoid unnecessary calls)
    final userModel = ref.read(userDataProvider);
    if (userModel.id.isEmpty) {
      // Using the notifier to load the data
      ref.read(userNotifierProvider.notifier).loadUserData(userId);
    }
  }
}