import 'package:exam_app/config/appColor.dart';
import 'package:exam_app/features/exam/presentation/view/explore_screen.dart';
import 'package:exam_app/features/exam/presentation/view/widget/bottom_item.dart';
import 'package:flutter/material.dart';

class HomeExamScreen extends StatefulWidget {
  const HomeExamScreen({super.key});

  @override
  State<HomeExamScreen> createState() => _HomeExamScreenState();
}

class _HomeExamScreenState extends State<HomeExamScreen> {
  List<Widget> list = [
    ExploreScreen(),
    Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Hello we are result screen')],
      ),
    ),
    Scaffold(
      appBar: AppBar(
        title: Text('profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Hello we are profile screen')],
      ),
    ),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[index],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColor.blueBase,
              icon: CustomBottomItem(
                  index: 0,
                  currentindex: index,
                  icon: 'asset/images/explore.png'),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: CustomBottomItem(
                  index: 1,
                  currentindex: index,
                  icon: 'asset/images/result.png'),
              label: 'Result',
            ),
            BottomNavigationBarItem(
              icon: CustomBottomItem(
                index: 2,
                currentindex: index,
                icon: 'asset/images/profile.png',
              ),
              label: 'Profile',
            ),
          ]),
    );
  }
}
