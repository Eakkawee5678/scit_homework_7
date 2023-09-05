import 'package:flutter/material.dart';
import 'package:themedemo66/color.dart';
import 'package:themedemo66/pages/popnews.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController search = TextEditingController();
  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  List<PopNews> popNews = [
    PopNews(
        title: "Social Media",
        detail:
            "Adipisicing veniam et commodo eiusmod sunt reprehenderit officia in officia ut enim.",
        cover:
            'assets/images/unsplash_xTq26wLo5do.png'),
    PopNews(
        title: "Social Media",
        detail:
            "Adipisicing veniam et commodo eiusmod sunt reprehenderit officia in officia ut enim.",
        cover:
            'assets/images/newsTopic.png'),
    PopNews(
        title: "Master Dart",
        detail:
            "Adipisicing veniam et commodo eiusmod sunt reprehenderit officia in officia ut enim.",
        cover:
            'assets/images/news.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.purple,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.account_circle,
                color: Colors.purple,
                size: 30,
              ),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.purple[50],
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                 mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: search,
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      fillColor: Colors.white,
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  titleTopic(context,"Lasted News"),
                  SizedBox(
                    height: 20,
                  ),
                  Container
                  (
                    height: 150,
                    child: ListView.builder( 
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.network(images[index]),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  titleTopic(context,"Popular News"),
                  SizedBox(
                    height: 20,
                  ),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: popNews.length,
                      // popNews[index].cover
                      itemBuilder: (context, index) {
                        return ListTile(
                            onTap: () {},
                            leading:   Image.asset(popNews[index].cover, width: _width*0.2, fit: BoxFit.cover),
                            title: Text(
                              popNews[index].title,
                            ),
                            subtitle: Text(
                              popNews[index].detail,
                            ));
                      },
                    ),
                  ),
                ],
              ),
            )),
            bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple[50],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.feed, color: Colors.purple),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school, color: Colors.purple),
            label: 'Cirriculum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone, color: Colors.purple),
            label: 'Contact',
          ),
        ],
      ),
            );
  }

  Row titleTopic(BuildContext context, String title) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text('See More >',
                            style: Theme.of(context).textTheme.titleMedium))
                  ],
                );
  }
}
