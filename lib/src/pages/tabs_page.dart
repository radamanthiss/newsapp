import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigate(),
      ),
    );
  }

}

class _Navigate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);


    return BottomNavigationBar(
      currentIndex: navigationModel.actualPage,
      onTap: (i) => navigationModel.actualPage = i,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Titulares')
      ]
    );
  }
}

class _Pages extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    return PageView(
      controller: navigationModel.pageController,
      
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier{
  int _actualPage = 0;
  PageController _pageController = PageController();

  
  int get actualPage => this._actualPage;
  set actualPage(int value){
    this._actualPage = value;
    _pageController.animateToPage(value, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    // notificar a todos los widgets para que se redibujen
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}