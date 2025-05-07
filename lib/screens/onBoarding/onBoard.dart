import 'package:sagarpos360/exports/myExports.dart';

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
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyLoginRegister()));
              },
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
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        content.image ?? '',
                        height: 250.h,
                      ),
                       SizedBox(height: 30.h),
                      Text(
                        content.title ?? '',
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        content.description ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
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
          SizedBox(height: 20.h),
          Container(
            height: 55.h,
            margin:  EdgeInsets.symmetric(horizontal: 30.w),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex == onBoardcontents.length - 1) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyLoginRegister()));
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryDark,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              child: Text(
                currentIndex == onBoardcontents.length - 1
                    ? "Get Started"
                    : "Next",
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 10.h,
      width: currentIndex == index ? 25 : 10,
      margin:  EdgeInsets.symmetric(horizontal: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color:
            currentIndex == index ? AppColors.primaryColor : Colors.grey[300],
      ),
    );
  }
}
