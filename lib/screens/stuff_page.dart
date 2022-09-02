import 'package:flutter/material.dart';
import 'package:web_desing/constant.dart';
import 'package:web_desing/screens/home_screen.dart';

class StuffPage extends StatefulWidget {
  const StuffPage({Key? key}) : super(key: key);

  @override
  State<StuffPage> createState() => _StuffPageState();
}

class _StuffPageState extends State<StuffPage> {
  late ScrollController _controller;
  double pixels = 0.0;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        pixels = _controller.position.pixels;
        print(pixels);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          controller: _controller,
          child: Container(
            color: kSecondColor,
            child: Column(
              children: [
                CustomAppBarWidget(size: size),
                const SizedBox(height: 100),
                ExpalainWidget(size: size),
                const SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width / 5),
                  child: Column(
                    children: [
                      CustomAnimatedCard(
                        pixels: pixels,
                        size: size,
                        opacityPixels: 100,
                      ),
                      const SizedBox(height: 100),
                      CustomAnimatedCard(
                        pixels: pixels,
                        size: size,
                        opacityPixels: 120,
                      ),
                      const SizedBox(height: 100),
                      CustomAnimatedCard(
                        pixels: pixels,
                        size: size,
                        opacityPixels: 380,
                      ),
                      const SizedBox(height: 100),
                      CustomAnimatedCard(
                        pixels: pixels,
                        size: size,
                        opacityPixels: 520,
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class CustomAnimatedCard extends StatelessWidget {
  const CustomAnimatedCard({
    Key? key,
    required this.pixels,
    required this.size,
    required this.opacityPixels,
  }) : super(key: key);

  final double pixels;
  final Size size;
  final int opacityPixels;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1200),
      opacity: pixels <= opacityPixels ? 0.2 : 1.0,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.only(
          top: pixels <= opacityPixels ? 100 : 0,
        ),
        child: AnimatedCardBody(size: size),
      ),
    );
  }
}

class AnimatedCardBody extends StatelessWidget {
  const AnimatedCardBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 5,
      width: size.width,
      color: Colors.transparent,
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Image.asset("assets/person.png"),
                title: const Text('Name Surname'),
                subtitle: const Text(
                    'There are many variations of Lorem Ipsum passages. However, most of them have been modified by adding humor or adding random words. If you are going to use a Lorem Ipsum snippet,'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpalainWidget extends StatelessWidget {
  const ExpalainWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size.width,
          color: Colors.transparent,
          child: const Text(
            "Why Do We Use?" + "\n",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35, fontFamily: 'LibreBaskerville'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Container(
            width: size.width,
            color: Colors.transparent,
            child: const Text(
              "It is a known fact that a duplicate page content distracts the reader. The purpose of using Lorem Ipsum is to increase legibility by providing a more balanced distribution of letters compared to constantly typing \'text here, text here\'. Currently, many desktop publishing packages and web page editors use Lorem Ipsum as their default mig text. In addition, when search engines are searched with the keywords \'lorem ipsum\', many sites that are still in the design phase are listed. Various versions have been developed over the years, sometimes accidentally, sometimes on purpose (for example, with humor).",
              style: TextStyle(fontSize: 25, fontFamily: 'LibreBaskerville'),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(50),
      ),
      child: Container(
        height: size.height / 5,
        width: size.width - 20,
        color: kPrimaryColor,
        child: Row(
          children: [
            const Spacer(),
            SizedBox(
              height: size.height / 14,
              child: Image.asset(""),
              width: 80,
            ),
            SizedBox(width: 15),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              child: const Text(
                'İngilizce Merkezi',
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                },
                child: const Text(
                  'Home Page',
                  style: TextStyle(
                      color: kSecondColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'LibreBaskerville'),
                )),
            const Spacer(),
            TextButton(
                onHover: (value) => Colors.blue,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const StuffPage()));
                },
                child: const Text(
                  'Stuff',
                  style: TextStyle(
                      color: kSecondColor,
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
                      color: kSecondColor,
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
                      color: kSecondColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'LibreBaskerville'),
                )),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
