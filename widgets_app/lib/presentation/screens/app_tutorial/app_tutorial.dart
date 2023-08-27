import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  const SlideInfo(
    'Busca la comida',
    'Proident sint velit ullamco pariatur.',
    'assets/images/1.png'
  ),

  const SlideInfo(
    'Entrega rapida',
    'Lorem elit Lorem officia deserunt irure consectetur enim excepteur excepteur.',
    'assets/images/2.png'
  ),

  const SlideInfo(
    'Disfruta la comida',
    'Ipsum anim anim aliqua veniam laboris.', 
    'assets/images/3.png'
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() { 

      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5) ){
        setState(() {
          endReached = true;  
        });
      }
     });
    
  }


  @override
  void dispose() {
    pageViewController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) =>
                    _Slide(slideData.title, slideData.caption, slideData.imageUrl))
                .toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed:context.pop,
              child: const Text('Exit'),
            )
          ),

          endReached ? 
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                  onPressed: context.pop,
                  child: const Text('Comenzar')
                ),
              )
            ): const SizedBox(),

        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(this.title, this.caption, this.imageUrl);

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}
