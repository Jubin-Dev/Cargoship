import 'package:flutter/material.dart';
import 'Camera.dart';
import 'pregatein.dart';
import 'survey.dart';
//import '../../layout_type.dart';
//import '../blocs/bloc.dart';
import '../blocs/provider.dart';
//import 'login_screen_new.dart';
import '../app.dart';

class Init_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    textStyle() {
      return new TextStyle(color: Colors.white, fontSize: 30.0, fontFamily: 'Raleway');
    }

    final bloc= Provider.of(context);
    // final bloc = new Bloc();
    // Init_screen({Key key, @required this.bloc;}) : super (key: key);

    return new Container(
      child:
      new DefaultTabController(
        length: 3,
        
        child: new Scaffold(
            appBar: new AppBar(
            automaticallyImplyLeading: true,
            title: new Row( 
                        mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                            new IconButton(icon: new Icon(Icons.save), onPressed: (){},),
                            new IconButton(icon: new Icon(Icons.edit), onPressed: (){},),
                            new IconButton(icon: new Icon(Icons.delete), onPressed: (){},),
                            new Text('      ___________________'),
                            new IconButton(icon: new Icon(Icons.search),onPressed: (){},),
                            new Text('            '),
                            new Text("Maintenance & Repair",style: textStyle(),),
                            new Text('                         '),
                            new Text(bloc.getUser().toString()),
                            new IconButton(icon: new Icon(Icons.person_pin), onPressed: (){},),
                            // new IconButton(icon: new Icon(Icons.exit_to_app),
                            //                 tooltip: 'Logout', 
                            //                 onPressed: ()
                            //                 {  
                            //                    Navigator.push(context, new MaterialPageRoute(
                            //                     builder: (context) => new App()));
                            //                 },),
                        ]),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            textTheme: TextTheme(
                title: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      )
            ),

            //title: Text("Maintenance & Repair",style: textStyle(),),
            centerTitle: true,
            //actions: <Widget>[
              //appBarTitle,
              // new IconButton(icon: new Icon(Icons.search),
              //               onPressed: (){},),
            //  ],
            bottom: new TabBar(
              tabs: <Widget>[Tab(text: "Pre Gate In",), Tab(text: "Survey",),
               Tab(text: "Camera",)
               ]
            ),
          ),
          body: new TabBarView(
            children: <Widget>[
              new Container(
                  //color: Colors.deepOrangeAccent,
                  child: 
                  //new Center( child: new Text("Pregate",style: textStyle(),),),
                  //PreGateIn(layoutGroup: LayoutGroup.scrollable),
                  PregateIn(),
                  ),
              new Container( 
                child:
                   Survey(),
                  ),
                   new Container( 
                child:
                   Camera(),
                  ),
            ],
          ),
        ),
      )
    );
  }

}
