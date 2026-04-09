import 'package:flutter/material.dart';

enum ImageStatus { loading, error, success }

class CorePageStructure extends StatelessWidget {
  const CorePageStructure({
    super.key,
    this.isShowAppBar = true,
    required this.callBack,
    required this.image,
  });

  final bool isShowAppBar;
  // final Widget? Function(bool isShowAppBar) body;
  final void Function(bool isShowAppBar) callBack;

  // final Widget Function(bool isShowAppBar) body;
  final Widget Function(String imageUrl, ImageStatus imageStatus) image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isShowAppBar ? AppBar(title: const Text('Core Page')) : null,
      // body: body(true),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return image('assets/images/bear.png', ImageStatus.success);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          callBack(true);
        },
      ),
    );
  }
}

class PageTesting extends StatelessWidget {
  const PageTesting({super.key});

  @override
  Widget build(BuildContext context) {
    return CorePageStructure(
      isShowAppBar: true,
      image: (imageUrl, imageStatus) {
        switch (imageStatus) {
          case ImageStatus.loading:
            return const CircularProgressIndicator();
          case ImageStatus.error:
            return const Icon(Icons.error);
          case ImageStatus.success:
            return BigImageCustom(image: imageUrl);
        }
      },
      callBack: (isShowAppBar) {
        print(isShowAppBar);
      },
    );
  }
}

class BigImageCustom extends StatelessWidget {
  const BigImageCustom({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(image);
  }
}
