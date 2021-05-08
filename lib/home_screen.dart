import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_ui_clone/constants/color_cons.dart';
import 'package:youtube_ui_clone/models/category_model.dart';
import 'package:youtube_ui_clone/models/video_model.dart';
import 'package:youtube_ui_clone/widgets/custom_nav_bar.dart';
import 'package:youtube_ui_clone/widgets/mini_video_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;

  // Handle Indicator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              leadingWidth: 100.0,
              leading: Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                ),
                child: SvgPicture.asset(
                  'assets/logo.svg',
                ),
              ),
              actions: [
                IconButton(
                  iconSize: 24,
                  icon: Icon(Icons.cast),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 24,
                  icon: Icon(Icons.notifications_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 24,
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 24.0,
                  icon: CircleAvatar(
                    foregroundImage: AssetImage('assets/avatar.png'),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 12.0),
            ),
            // Slider
            SliverToBoxAdapter(
              child: Container(
                height: 36,
                child: ListView.builder(
                  itemCount: categoryData.length,
                  padding: EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(categoryData[index].name);
                        setState(() {
                          current = index;
                        });
                      },
                      child: CategoryCard(
                          operation: categoryData[index].name,
                          isSelected: current == index,
                          context: this),
                    );
                  },
                ),
              ),
            ),
            // Top Videos
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 12.0),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 0.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final video = topVideos[index];
                    return MiniVideoCard(video: video);
                  },
                  childCount: topVideos.length,
                ),
              ),
            ),
            // Shorts Videos
            SliverToBoxAdapter(
                child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12, bottom: 12),
                  child: Image.asset(
                    "assets/shorts-logo.png",
                    scale: 14,
                  ),
                ),
              ],
            )),
            //
            SliverToBoxAdapter(
              child: Container(
                height: 300,
                width: 180,
                child: ListView.builder(
                  itemCount: shortVideos.length,
                  padding: EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(shortVideos[index].isTop);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 160,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: kBlackColor.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 5,
                              offset: Offset(4.0, 4.0),
                            )
                          ],
                          border: Border.all(
                            width: 0.5,
                            color: kWhiteColor.withOpacity(0.1),
                          ),
                          color: kWhiteColor,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.5),
                                        BlendMode.dstATop),
                                    alignment: Alignment.topRight,
                                    image:
                                        AssetImage(shortVideos[index].videoImg),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              bottom: 25,
                              left: 8,
                              child: Container(
                                  padding: EdgeInsets.only(right: 14),
                                  width: 160,
                                  child: Text(shortVideos[index].title,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1)),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 8,
                              child: Container(
                                width: 160,
                                child: Text(
                                  "${shortVideos[index].views}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 16.0),
            ),
            // All Videos
            SliverPadding(
              padding: EdgeInsets.only(bottom: 60.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final video = allVideos[index];
                    return MiniVideoCard(video: video);
                  },
                  childCount: allVideos.length,
                ),
              ),
            ),
          ],
        ));
  }
}

class CategoryCard extends StatefulWidget {
  final String operation;
  final bool isSelected;
  final _HomeScreenState context;

  CategoryCard({this.operation, this.isSelected, this.context});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(4.0, 4.0),
          )
        ],
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: kWhiteColor.withOpacity(0.2),
        ),
        color: widget.isSelected ? kWhiteColor : kBlackColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 14, left: 14),
            child: Text(
              widget.operation,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: widget.isSelected ? kBlackColor : kWhiteColor),
            ),
          )
        ],
      ),
    );
  }
}
