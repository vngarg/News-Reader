import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_reader/helper/data.dart';
import 'package:new_reader/helper/news.dart';
import 'package:new_reader/models/article_model.dart';
import 'package:new_reader/models/category_models.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List<CategoryModel>();
  List<ArticleModel> articles = List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('S.G. '),
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 70.0,
                      child: ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),
                    // Text('${articles.length}'),
                    Container(
                      padding: EdgeInsets.only(top: 16.0),
                      child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            // imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            desc: articles[index].description,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 16.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 120.0,
                  height: 60.0,
                  fit: BoxFit.cover,
                )),
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.black26),
                height: 60.0,
                width: 120.0,
                child: Text(
                  categoryName,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0),
                )),
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String title, desc;

  BlogTile(
      {@required this.desc, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[Text(title), Text(desc)],
      ),
    );
  }
}
