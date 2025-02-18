import "package:flutter/material.dart";
import "package:flutter_application_test/data/notifiers.dart";

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier, 
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.headphones_outlined), label: "Audio"),
            NavigationDestination(
                icon: Icon(Icons.home_work_outlined), label: "Activity"),
            NavigationDestination(
                icon: Icon(Icons.assessment_outlined), label: "Assessment"),
          ],
          onDestinationSelected: (int value) { 
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}