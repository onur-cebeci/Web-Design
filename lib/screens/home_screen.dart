import 'package:flutter/material.dart';
import 'package:web_desing/constant.dart';
import 'package:web_desing/screens/stuff_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    PageController pageController = PageController();
    return Stack(
      children: [
        PageView(
          physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          pageSnapping: true,
          controller: pageController,
          scrollDirection: Axis.vertical,
          children: [
            ImageContainerWidget(
                size: size,
                color: kPrimaryColor,
                title: ' Title ',
                imagePath: Image.asset(
                  'assets/page_1.jpg',
                  height: size.height,
                  width: size.width / 1.7,
                  fit: BoxFit.cover,
                ),
                subTitle:
                    'Hampden-Sydney College in Virginia, found a definitive source when he examined the classical literary examples of the word \'consectetur \', one of the most obscure words in a Lorem Ipsum passage. Lorm Ipsum by Cicero BC. It comes from chapters 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extreme Limits of Good and Evil) written in 45.'),
            ImageContainerWidget(
                size: size,
                color: Colors.red,
                title: 'There are many variations ',
                imagePath: Image.asset(
                  'assets/page_2.jpg',
                  height: size.height,
                  width: size.width / 1.7,
                  fit: BoxFit.cover,
                ),
                subTitle:
                    'Contrary to popular belief, Lorem Ipsum is not made up of random words. Roots BC It has a history of 2000 years, dating back to classical Latin literature since 45. '),
            ImageContainerWidget(
                size: size,
                color: Colors.green,
                title: 'There are many variations ',
                imagePath: Image.asset(
                  'assets/page_2.jpg',
                  height: size.height,
                  width: size.width / 1.7,
                  fit: BoxFit.cover,
                ),
                subTitle:
                    'Contrary to popular belief, Lorem Ipsum is not made up of random words. Roots BC It has a history of 2000 years, dating back to classical Latin literature since 45. '),
          ],
        ),
        Positioned(
          top: 80,
          left: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22.0),
            child: Container(
              height: size.height / 12,
              width: size.width - 100,
              color: Colors.white.withOpacity(0.4),
              child: Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: size.height / 14,
                    child: Image.asset(""),
                    width: 80,
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                    child: const Text(
                      'Company Name',
                      style: TextStyle(
                          inherit: false,
                          fontFamily: 'LibreBaskerville',
                          fontSize: 20,
                          color: kSecondColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(flex: 2),
                  TextButton(
                      onHover: (value) => Colors.blue,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      },
                      child: const Text(
                        'Home Page',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'LibreBaskerville'),
                      )),
                  const Spacer(),
                  TextButton(
                      onHover: (value) => Colors.blue,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const StuffPage()));
                      },
                      child: const Text(
                        'Stuff',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'LibreBaskerville'),
                      )),
                  const Spacer(),
                  TextButton(
                      onHover: (value) => Colors.blue,
                      onPressed: () {},
                      child: const Text(
                        '#3',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'LibreBaskerville'),
                      )),
                  const Spacer(),
                  TextButton(
                      onHover: (value) => Colors.blue,
                      onPressed: () {},
                      child: const Text(
                        '#4',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'LibreBaskerville'),
                      )),
                  const Spacer(flex: 4),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height / 2,
          left: 10,
          child: CustomButtom(
            onTab: () {
              if (pageController.page!.toInt() > 0) {
                pageController.animateToPage(pageController.page!.toInt() - 1,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.bounceOut);
              }
            },
            iconColor: Colors.white.withOpacity(0.1),
            size: size,
            key: key,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        Positioned(
          top: size.height / 2,
          right: 12,
          child: CustomButtom(
            onTab: () {
              if (pageController.page!.toInt() < 2) {
                pageController.animateToPage(pageController.page!.toInt() + 1,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeOutExpo);
              } else {
                pageController.animateToPage(pageController.page!.toInt() - 2,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeOutQuart);
              }
            },
            iconColor: Colors.white.withOpacity(0.1),
            size: size,
            key: key,
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ],
    );
  }
}

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key? key,
    required this.size,
    required this.icon,
    required this.iconColor,
    required this.onTab,
  }) : super(key: key);

  final Size size;
  final Icon icon;
  final Color iconColor;
  final GestureTapCallback onTab;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all<Size>(const Size.fromRadius(30)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)))),
          foregroundColor: MaterialStateProperty.all<Color>(kSecondColor),
          overlayColor: MaterialStateProperty.all<Color>(iconColor),
        ),
        onPressed: onTab,
        child: icon);
  }
}

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({
    Key? key,
    required this.size,
    required this.title,
    required this.subTitle,
    required this.imagePath,
    required this.color,
  }) : super(key: key);

  final Size size;
  final String title;
  final String subTitle;
  final Widget imagePath;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    bottomLeft: Radius.circular(22)),
              ),
              height: size.height,
              width: size.width / 2.5,
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                            inherit: false,
                            fontFamily: 'LibreBaskerville',
                            fontSize: 40,
                            color: kSecondColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      subTitle,
                      style: const TextStyle(
                          inherit: false,
                          fontFamily: 'LibreBaskerville',
                          fontSize: 28,
                          color: kSecondColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(22),
                    bottomRight: Radius.circular(22)),
                child: imagePath),
          ],
        ),
      ),
    );
  }
}
