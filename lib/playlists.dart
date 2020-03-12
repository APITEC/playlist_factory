import 'package:flutter/material.dart';

import 'playlist.dart';

class Playlists extends StatefulWidget {
  @override
  _PlaylistsState createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
  final library = [
    {'name': 'Staying Alive', 'artist': 'BeeGees', 'duration': 3, 'favorite': false},
    {'name': 'Whats new, Pussycat?', 'artist': 'Tom Jones', 'duration': 2, 'favorite': false},
    {'name': 'Wandering Star', 'artist': 'Portishead', 'duration': 6, 'favorite': false},
    {'name': 'Stargazing', 'artist': 'Kygo', 'duration': 3, 'favorite': false},
    {'name': 'Falling on My Face', 'artist': 'Arutani', 'duration': 8, 'favorite': false},
    {'name': 'Parallel Universe', 'artist': 'Red Hot Chili Peppers', 'duration': 6, 'favorite': false},
    {'name': 'N.I.B', 'artist': 'Black Sabbath', 'duration': 5, 'favorite': false},
    {'name': 'Thinking of a Place', 'artist': 'The War on Drugs', 'duration': 11, 'favorite': false},
    {'name': 'Fuck You Bitch', 'artist': 'Wheeler Walker Jr', 'duration': 4, 'favorite': false},
    {'name': 'Bohemian Like You', 'artist': 'The Dandy Warhols', 'duration': 3, 'favorite': false},
    {'name': 'Planet Caravan', 'artist': 'Black Sabbath', 'duration': 7, 'favorite': false},
  ];

  List playlists = [
    {
      'name': 'My Playlist',
      'songs': [
        {'name': 'Staying Alive', 'artist': 'BeeGees', 'duration': 3},
        {'name': 'Whats new, Pussycat?', 'artist': 'Tom Jones', 'duration': 2},
        {'name': 'Wandering Star', 'artist': 'Portishead', 'duration': 6},
      ],
    },
    {
      'name': 'Summer Jams',
      'songs': [
        {'name': 'Stargazing', 'artist': 'Kygo', 'duration': 3},
        {'name': 'Falling on My Face', 'artist': 'Arutani', 'duration': 8},
        {'name': 'Parallel Universe', 'artist': 'Red Hot Chili Peppers', 'duration': 6},
        {'name': 'N.I.B', 'artist': 'Black Sabbath', 'duration': 5},
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'PlaylistFactory',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.yellowAccent,
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(2.0),
        ),
      ),
      body: ListView.builder(
          itemCount: playlists.length,
          itemBuilder: (context, index) {
            return Playlist(
              index,
              playlists[index],
              library,
              (playlist, song) {
                setState(() {
                  playlists[playlist]['songs'].add(song);
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String playlistName;
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('New Playlist'),
              content: TextField(
                onChanged: (value) {
                  playlistName = value;
                },
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    setState(() {
                      playlists.add({
                        'name': playlistName,
                        'songs': [],
                      });
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Create',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        },
        backgroundColor: Colors.yellowAccent,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
