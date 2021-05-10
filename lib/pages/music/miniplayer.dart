import 'package:flutter/material.dart';

class MiniPlayer extends StatefulWidget {
  MiniPlayer({Key key, @required this.onTap, this.onPlayOrPause, this.onLike})
      : super(key: key);
  final Function onTap;
  final Function onPlayOrPause;
  final Function onLike;

  @override
  _MiniPlayerState createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        color: colorTheme.onBackground,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: kToolbarHeight,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: kToolbarHeight,
                      height: kToolbarHeight,
                      padding: EdgeInsets.all(8),
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(1.0)),
                          child: Image.asset(r"assets/thumb/XVztg3oXmX4.jpg",
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(r'Wurkit (Original Mix)',
                              style: TextStyle(color: colorTheme.onPrimary),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          Text('Kyle Watson',
                              style: TextStyle(
                                  color: colorTheme.onPrimary.withOpacity(0.5),
                                  fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: widget.onLike,
                      child: Icon(
                        Icons.favorite_border,
                        color: colorTheme.onPrimary,
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: widget.onPlayOrPause,
                      child: Icon(
                        Icons.play_arrow,
                        color: colorTheme.onPrimary,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
              Divider(color: colorTheme.background, height: 1),
            ],
          ),
        ),
      ),
    );
  }
}
