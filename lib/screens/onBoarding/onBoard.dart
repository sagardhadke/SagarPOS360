import 'package:flutter/material.dart';
import 'package:sagarpos360/core/constants/app_colors.dart';
import '../../core/constants/onBoarding_content.dart';

class UserOnBoard extends StatefulWidget {
  const UserOnBoard({super.key});

  @override
  State<UserOnBoard> createState() => _UserOnBoardState();
}

class _UserOnBoardState extends State<UserOnBoard> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (currentIndex != onBoardcontents.length - 1)
            TextButton(
              onPressed: () {},
              child: const Text("Skip", style: TextStyle(color: Colors.grey)),
            )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onBoardcontents.length,
              onPageChanged: (int index) {
                setState(() => currentIndex = index);
              },
              itemBuilder: (_, i) {
                final content = onBoardcontents[i];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        content.image ?? '',
                        height: 250,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        content.title ?? '',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        content.description ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onBoardcontents.length,
              (index) => buildDot(index),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 55,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex == onBoardcontents.length - 1) {
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFF0075E7),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                currentIndex == onBoardcontents.length - 1
                    ? "Get Started"
                    : "Next",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:
            currentIndex == index ? AppColors.primaryColor : Colors.grey[300],
      ),
    );
  }
}
