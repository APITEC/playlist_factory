import 'package:flutter/material.dart';

class Song extends StatelessWidget {
  final song;

  Song(this.song);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        song['name'],
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      subtitle: Text(
        'by ${song['artist']}',
        style: TextStyle(color: Colors.white),
      ),
      trailing: Column(
        children: <Widget>[
          IconButton(
            onPressed: () {
              showBottomSheet(
                  context: context,
                  builder: (context) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          LinearProgressIndicator(
                            value: 0.5,
                            backgroundColor: Colors.pink[200],
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(icon: Icon(Icons.fast_rewind), onPressed: () {}),
                              IconButton(
                                icon: Icon(Icons.play_arrow),
                                onPressed: () {},
                                iconSize: 60,
                              ),
                              IconButton(icon: Icon(Icons.fast_forward), onPressed: () {}),
                            ],
                          ),
                        ],
                      ));
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.pinkAccent,
            ),
          ),
        ],
      ),
    );
  }
}
