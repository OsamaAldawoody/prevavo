import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  MediaQueryData query;

  @override
  Widget build(BuildContext context) {
    query = MediaQuery.of(context);
    final width = query.size.width;
    final height = query.size.height;
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          FavouritWidget(),
        ],
      ),
    );
    Widget textSextion = Container(
      padding: EdgeInsets.all(32),
      child: Text(
        "A container first surrounds the child with padding (inflated by any borders present in the decoration) and then applies additional constraints to the padded extent (incorporating the width and height as constraints, if either is non-null). The container is then surrounded by additional empty space described from the margin.",
        softWrap: true,
      ),
    );
    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(title: Text('test app')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/mountain.jpg',
                fit: BoxFit.cover,
                width: width,
                height: height / 4,
              ),
              titleSection,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildButtonColumn(
                        Colors.blue, Icons.accessibility, "accessiblity"),
                    _buildButtonColumn(
                        Colors.blue, Icons.phone_locked, "phone"),
                    _buildButtonColumn(Colors.blue, Icons.share, "share"),
                  ],
                ),
              ),
              textSextion,
            ],
          ),
        ));
  }
}
class FavouritWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FavouritWidgetState();
  }
}

class _FavouritWidgetState extends State<FavouritWidget>{
  bool _isFavorited = true;
  int _favoriteCount = 41;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }

  Widget _toggleFavorite(){
    setState(() {
      if(_isFavorited){
        _favoriteCount--;
        _isFavorited = false;
      }else{
        _favoriteCount++;
        _isFavorited = true;
      }
    });
  }
}