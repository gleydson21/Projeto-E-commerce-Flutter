import 'package:app_02/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_02/Shoes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: const Text(
          "Shoes",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                        1,
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              "All",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                        1.1,
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Center(
                            child: Text(
                              "Sneakers",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                        1.2,
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Center(
                            child: Text(
                              "Football",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                        1.3,
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Center(
                            child: Text(
                              "Soccer",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                        1.4,
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Center(
                            child: Text(
                              "Golf",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              FadeAnimation(
                1.5,
                makeItem(
                  image: 'assets/images/one.jpg',
                  tag: 'red',
                  context: context,
                ),
              ),
              FadeAnimation(
                1.6,
                makeItem(
                  image: 'assets/images/two.jpg',
                  tag: 'blue',
                  context: context,
                ),
              ),
              FadeAnimation(
                1.7,
                makeItem(
                  image: 'assets/images/three.jpg',
                  tag: 'white',
                  context: context,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, tag, context}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Shoes(
                image: image,
              ),
            ),
          );
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(
                          1,
                          const Text(
                            "Sneakers",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeAnimation(
                          1.1,
                          const Text(
                            "Nike",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FadeAnimation(
                    1.2,
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.favorite_border,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              FadeAnimation(
                1.2,
                const Text(
                  "100\$",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
