import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //This defines the row in which the location name, county and favourites are shown.
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Hanley Forest Park',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Stoke-On-Trent, England',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          ),
          FavouriteWidget(),
        ],
      ),
    );

    //A function for building and returning a column object.
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

    Color color = Theme.of(context).primaryColor;

    //Create a container in which 3 buttons are created, "call", "route" and "share"
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    //Create the text area that describes the content
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Central Forest Park is a beautiful green space in the heart of the city.'
            'It provides facilities for walking, cycling, dog walking, informal sports, and skateboarding.'
            'The grassland provides an important home for insects, birds, and unusual plants, while carboniferous'
            'fossils can be found in the loose shale of the pit mound. Central Forest Park is next to the City Centre,'
            'and has the Stoke Skate Plaza - Europe\'s largest street style skate park. There is also a safari-themed'
            'adventure play area and boulders to climb!',
        softWrap: true,
      ),
    );

    //This is the Material design based application and will return the layout filled with content.
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/hanley_forest_park.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

//A class that handles the favourite widget, overriding the state function
class FavouriteWidget extends StatefulWidget {
  @override
  _FavouriteWidgetState createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  bool _isFavourited = true;
  int _favouriteCount = 30;

   //Override the default build function to create a custom widget that uses this classes functions
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavourited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavourite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favouriteCount'),
          ),
        ),
      ],
    );
  }

  //If is favourited then unfavourite and reduce count, else, favourite and increase count
  void _toggleFavourite() {
    setState(() {
      if (_isFavourited) {
        _favouriteCount -= 1;
        _isFavourited = false;
      } else {
        _favouriteCount += 1;
        _isFavourited = true;
      }
    });
  }
}