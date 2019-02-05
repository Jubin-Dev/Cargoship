import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';
import 'Init_screen.dart';

class LoginScreenNew extends StatelessWidget
{
  final _branchCodes = ['BANGKOK','MAL ASIA','SG HUB','IND','AUST'];
  final _yardCodes = ['EMPTY','ICDS','MNR','WAREHOUSE','TERMINAL'];

  Widget build(context)
  {
    final bloc= Provider.of(context);

    return new Stack(
      children: <Widget>[
        Row(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children:<Widget> [
            new Container(  // first row first column display pic
                width: 800.0,
                decoration: new BoxDecoration(
                image: new DecorationImage(
                   image: new AssetImage('lib/img/bg.jpg'),
                     fit: BoxFit.cover,
                  ),
                  //color: Colors.lightBlue,
                ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: //Expanded( flex: 10, child:   //<expanded not working>         
                new Container(
                    alignment: Alignment.topLeft,
                    width: 480.0,
                    //color: Colors.lightBlue[50], cannot use here. giving error
                    // decoration: new BoxDecoration(
                    // // image: new DecorationImage(
                    //   //  image: new AssetImage('lib/img/bg2.jpg'),
                    //   //    fit: BoxFit.cover,
                    //   // ),
                    //   color: Colors.lightBlue[50],
                    //   ),
                      child: Column( 
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(padding: EdgeInsets.only(top:50.00,left:10.00), 
                                          alignment: Alignment.topLeft,
                                          child: Image.asset('lib/img/virgoleoSolutions.png'),),
                                Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.all(10.00),
                                child: Column( children: [
                                  uidField(bloc),
                                  passwordField(bloc), 
                                  Container(height:20.00),
                                  Row(
                                    children: <Widget>[
                                      Expanded(child: branchCodeList(bloc),),
                                      Container(width:20.00),
                                      Expanded(child: yardCodeList(bloc))
                                    ],
                                  ),
                                    //branchCodeList(bloc),
                                    //yardCodeList(bloc),
                                  Row(
                                    children: <Widget>[
                                      Checkbox(value:true, onChanged: (bool b){ },),
                                      Expanded(child: Text('Remember me?',style: TextStyle(fontSize: 20.0, color: Colors.brown),)),
                                      Container(width:110.00),
                                      Expanded(child: Text('Forgot pasword?',style: TextStyle(fontSize: 20.0, color: Colors.brown),))
                                    ],
                                  ),
                                  
                                  //Container(margin: EdgeInsets.only(top: 20.0)),
                                  submitButton(bloc),
                                    
                                  ])
                                )
                              ],
                            )
                )
            )
          ],
      ),
    ]
    );
  }

  Widget uidField(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.eMail,
      builder: (context, snapshot) 
        { 
          return TextField(
            style: TextStyle(fontSize: 22.0, fontStyle: FontStyle.normal, 
                              fontWeight: FontWeight.bold, color: Colors.black ),
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
            labelStyle: TextStyle(fontSize: 22,color: Colors.black),
            hintText: 'you@youremail.com',
            labelText: 'User:',
            errorText: snapshot.error,
            ),
          );
        }
      
      );
    
  }

  Widget passwordField(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.passWord,
      builder: (context, snapshot)
        {
          return TextField(
            style: TextStyle(fontSize: 22.0, fontStyle: FontStyle.normal, 
                              fontWeight: FontWeight.bold, color: Colors.black ),
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              labelStyle: TextStyle(fontSize: 22,color: Colors.black),
              hintText: 'password',
              labelText: 'Password:',
              errorText: snapshot.error,
            ),
          );     
        },
    );
  }

  Widget branchCodeList(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.branchCode,
      builder: (context, snapshot) 
        { 
          return DropdownButton<String>(
            items: _branchCodes.map((String dropDownStringitem) {
              return DropdownMenuItem<String>(
                    value: dropDownStringitem,
                    child: Text(dropDownStringitem),
                    
                    );
            },
            ).toList(),

            onChanged: bloc.changeBranch,
            value: snapshot.data,
            //value: bloc.getBrCode(),
            style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal, fontFamily: 'Raleway', 
                               fontWeight: FontWeight.bold, color: Colors.black ),
            hint: Text('Branch Code'),
            elevation: 8,
          );
        }
      );
  }

  //Widget yardCodeList(Bloc bloc)
  Widget yardCodeList(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.yardCode,  
      builder: (context, snapshot) 
        { 
          return DropdownButton<String>(
            items: _yardCodes.map((String dropDownStringitem) {
              return DropdownMenuItem<String>(
                    value: dropDownStringitem,
                    child: Text(dropDownStringitem),
                    );
            },
            ).toList(),
            
            onChanged: bloc.changeYard,
            value: snapshot.data,
            //value: bloc.getYardCode(),
            hint: Text('YARD Code'),
            style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal, 
                    fontWeight: FontWeight.bold, color: Colors.black ),
          );
        }
      );
  }

  Widget submitButton(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) 
      {
        return RaisedButton(
          child: Text('Login'),
          color: Colors.indigo,
          disabledColor: Colors.red,
          textColor: Colors.grey,

          //shape: ,         
          onPressed: !snapshot.hasData ? null : () 
                                { bloc.submit();
                                  //Navigator.of(context).pushNamed('/InitScreen');
                                  Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) =>
                                    new Init_screen())
                                  );
                                },
        );
      },  
    );
  }

}