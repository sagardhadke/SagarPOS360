class OnBoardingContent {
  final String? image;
  final String? title;
  final String? description;

  OnBoardingContent({this.image, this.title, this.description});
}

List<OnBoardingContent> onBoardcontents = [
  OnBoardingContent(
    image: 'assets/images/onBoard1.png',
    title: 'Easy to Use POS',
    description: 'Manage your sales, inventory, and billing with ease.',
  ),
  OnBoardingContent(
    image: 'assets/images/onBoard2.png',
    title: 'Real-time Reports',
    description: 'Get detailed insights and analytics on your business.',
  ),
  OnBoardingContent(
    image: 'assets/images/onBoard3.png',
    title: 'Grow Your Business',
    description: 'Empower your decisions and scale efficiently.',
  ),
];
