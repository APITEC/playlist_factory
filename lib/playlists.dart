import 'package:flutter/material.dart';

import 'playlist.dart';

class Playlists extends StatefulWidget {
  @override
  _PlaylistsState createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
  List playlists = [
    {
      'name': 'My Playlist',
      'songs': [
        {'name': 'Staying Alive', 'duration': 3},
        {'name': 'Whats new, Pussycat?', 'duration': 2},
        {'name': 'Wandering Star', 'duration': 6},
      ],
    },
    {
      'name': 'Summer Jams',
      'songs': [
        {'name': 'Stargazing', 'duration': 3},
        {'name': 'Falling on My Face', 'duration': 8},
        {'name': 'Parallel Universe', 'duration': 6},
        {'name': 'N.I.B', 'duration': 5},
      ],
    }
  ];

  List<Widget> buildPlaylists() {
    List<Widget> playlist_list = [];
    playlists.asMap().forEach((index, playlist) {
      playlist_list.add(Playlist(
        Key(index.toString()),
        playlist['name'],
        playlist['songs'],
      ));
    });
    return playlist_list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: buildPlaylists(),
      ),
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
                        'songs': [
                          {'name': 'Stargazing', 'duration': 3},
                          {'name': 'Falling on My Face', 'duration': 8},
                          {'name': 'Parallel Universe', 'duration': 6},
                          {'name': 'N.I.B', 'duration': 5},
                        ],
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
