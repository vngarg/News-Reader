import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_reader/helper/data.dart';
import 'package:new_reader/models/category_models.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = List<CategoryModel>();
  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('S.G. '),
            Text('News' , style: TextStyle(
              color: Colors.blue
            ),)
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 70.0,
              child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index) {
                  return CategoryTile(
                    imageUrl: categories[index].imageUrl,
                    categoryName: categories[index].categoryName,
                  );
                },),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {

  final imageUrl , categoryName;

  CategoryTile({
    this.imageUrl , this.categoryName
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(imageUrl , width: 120.0 , height: 60.0,)
        ],
      ),
    );
  }
}