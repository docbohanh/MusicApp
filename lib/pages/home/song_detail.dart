import 'package:flutter/material.dart';
import 'package:music_app/model/song.dart';

class SongDetail extends StatefulWidget {
  final Song song;
  final Function onTap;

  SongDetail({this.onTap, @required this.song});

  @override
  State createState() => _SongDetailState();
}

class _SongDetailState extends State<SongDetail> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorTheme.background,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: colorTheme.background,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white70,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.blue),
            onPressed: () {

            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 44),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 152,
                  height: 152,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        child: Image.asset(
                          widget.song.albumCover,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.song.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF32237E),
                ),
              ),
              SizedBox(height: 6),
              Text(
                widget.song.artist,
                style: TextStyle(
                  color: Color(0XFF7291C6),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

}