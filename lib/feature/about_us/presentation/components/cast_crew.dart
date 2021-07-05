import 'package:flutter/material.dart';


class CastAndCrew extends StatelessWidget {


  const CastAndCrew({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Cast & Crew",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 160,
            child: ListView(

            ),
          )
        ],
      ),
    );
  }
}
class CastCard extends StatelessWidget {
  final Map cast;

  const CastCard({Key key, this.cast}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 80,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  cast['image'],
                ),
              ),
            ),
          ),
          SizedBox(height: 20 / 2),
          Text(
            cast['orginalName'],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
          SizedBox(height: 20 / 4),
          Text(
            cast['movieName'],
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
