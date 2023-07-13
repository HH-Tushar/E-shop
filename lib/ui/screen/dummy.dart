import 'package:flutter/material.dart';

class ToggleScreens extends StatefulWidget {
  @override
  _ToggleScreensState createState() => _ToggleScreensState();
}

class _ToggleScreensState extends State<ToggleScreens> {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void toggleToScreen(int index) {
    setState(() {
      currentIndex = index;
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toggle Screens'),
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Screen 1',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
              Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Screen 2',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleButton(
                    text: 'Screen 1',
                    isActive: currentIndex == 0,
                    onTap: () => toggleToScreen(0),
                  ),
                  SizedBox(width: 16),
                  ToggleButton(
                    text: 'Screen 2',
                    isActive: currentIndex == 1,
                    onTap: () => toggleToScreen(1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onTap;

  const ToggleButton({
     Key? key,
    required this.text,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isActive ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
