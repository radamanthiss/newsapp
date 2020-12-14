import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/theme.dart';


class ListNews extends StatelessWidget {

  final List<Article> news;

  const ListNews(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {


        return _New( noti: this.news[index], index: index,);
     },
    );
  }
}

class _New extends StatelessWidget {

  final Article noti;
  final int index;

  const _New({
    @required this.noti, 
    @required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _CardTopBar(noti, index),
        _CardTitle(noti),
        _CardImage(noti),
        _CardBody(noti),
         _CardBottom(),
        SizedBox(height: 10,),
        Divider(),
       
      ],
    );
  }
}

class _CardBottom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          RawMaterialButton(
            onPressed: (){},
            fillColor: myTheme.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          
          ),
          SizedBox(width: 10,),
          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more),
          
          )
        ],
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  final Article noti;

  const _CardBody(this.noti);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((noti.description != null)? noti.description : ''),
    );
  }
}

class _CardImage extends StatelessWidget {
  final Article noti;

  const _CardImage(this.noti) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (noti.urlToImage != null) 
            ? FadeInImage(
                placeholder: AssetImage('assets/img/giphy.gif'), 
                image: NetworkImage(noti.urlToImage)
              )
            : Image(image: AssetImage('assets/img/no-image.png'),) 
        ),
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
   final Article noti;

  const _CardTitle(this.noti);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(noti.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final Article noti;
  final int index;

  const _CardTopBar(this.noti, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${ index + 1 }. ', style: TextStyle(color: myTheme.accentColor),),
          Text('${ noti.source.name}. ')

        ],
      ),
    );
  }
}