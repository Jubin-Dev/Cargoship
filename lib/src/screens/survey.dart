import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';
//import 'Init_screen.dart';

class Survey extends StatelessWidget
{

  final _eorType = ['STRUCTURL','OTHERS'];
  final _cntModel = ['STL','OTHERS'];
  final _yardLoc = ['YARD A','YARD B'];

  
  textStyle(double txtSize) {

      return new TextStyle(color: Colors.blue, 
                          fontSize: txtSize,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Raleway', 
                          fontWeight: FontWeight.normal);
  }

  Widget build(context)
  {
    final preGInbloc= Provider.of(context);

    return Stack(
      children: <Widget>[
        Column( children: <Widget>[
          new Container( // First row
            height: 300.00,
            //color: Colors.indigoAccent,
            child: Row(children:<Widget>[
              Expanded( // First Block
                flex:7,
                child:Container(
                      decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage('lib/img/bg1.jpg'),
                              fit: BoxFit.cover,
                            ),
                      ),
                    ),
              ),
              Expanded( //Second block
                flex:3,
                child: 
                new Container( child:    
                  new SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child:
                    ClipRect( 
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child:            
                    new Container(
                      //constraints: BoxConstraints(0.0),
                      constraints: BoxConstraints(maxWidth:1280.0, maxHeight:300.0),
                      color: Colors.lightBlueAccent[50],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,                      
                        children: <Widget>[
                          Row( children: <Widget>[
                              Expanded(child:Text(' Container No.',textAlign: TextAlign.left,style:textStyle(15.00))),
                              IconButton(icon: new Icon(Icons.search),onPressed: (){},),
                              Expanded(child:contNoFld(preGInbloc)),                              
                          ]),
                          Row( children: <Widget>[
                              Expanded(child:Text(' E O R Type',textAlign: TextAlign.left,style:textStyle(15.00))),
                              Expanded(child:eorType(preGInbloc)),
                          ]),
                          Row( children: <Widget>[
                              Expanded(child:Text(' Container Model',textAlign: TextAlign.left,style:textStyle(15.00))),
                              Expanded(child:contModel(preGInbloc)),
                          ]),
                          Row( children: <Widget>[
                              Expanded(child:Text(' Agent Code',textAlign: TextAlign.left,style:textStyle(15.00))),
                              IconButton(icon: new Icon(Icons.search),onPressed: (){},),
                              Expanded(child:agentCode(preGInbloc)),
                          ]),
                          Row( children: <Widget>[
                              Expanded(child:Text(' Yard Location',textAlign: TextAlign.left,style:textStyle(15.00))),
                              Expanded(child:yardLoc(preGInbloc)),
                          ]),
                          Row( children: <Widget>[
                              Expanded(child:Text(' Remarks',textAlign: TextAlign.left,style:textStyle(15.00))),
                              Expanded(child:remarks(preGInbloc)),
                          ]),   
                        ])
                      ),
                    )
                  )
                )
              )   
            ],)
          ),  
          Expanded(flex:1,child: 
            Container(alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(color: Colors.lightBlueAccent[200]), 
                      child: Text('     Damage Repair Summary',
                              style: TextStyle(fontSize: 25,color: Colors.white),),
          ),),
          Expanded( // Second Row, full container
            flex: 9,
            child: Container( 
              height: 324.00,
              child: dispInGrid(),
            )
          )  
        ],),
      ]
    );
  }



  Widget contNoFld(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.contNo,
      builder: (context, snapshot) 
        { 
          return TextField(
            style: textStyle(15),
            onChanged: bloc.changeContNo,
            //keyboardType: TextInputType.emailAddress
            decoration: InputDecoration(
            labelStyle: textStyle(15),
            hintText: 'PICK4658946',
            //labelText: 'Container No.:',
            errorText: snapshot.error,
            ),
          );
        }
      
      );
    
  }


  Widget eorType(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.elecCable,
      builder: (context, snapshot) 
        { 
          return DropdownButton<String>(
            items: _eorType.map((String dropDownStringitem) {
              return DropdownMenuItem<String>(
                    value: dropDownStringitem,
                    child: Text(dropDownStringitem),
                    
                    );
            },
            ).toList(),

            onChanged: bloc.changeElecCable,
            value: snapshot.data,
            //value: bloc.getBrCode(),
            style: textStyle(15),
            hint: Text('SOUND'),
            elevation: 8,
          );
        }
      );
  }

  Widget contModel(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.airGuide,
      builder: (context, snapshot) 
        { 
          return DropdownButton<String>(
            items: _cntModel.map((String dropDownStringitem) {
              return DropdownMenuItem<String>(
                    value: dropDownStringitem,
                    child: Text(dropDownStringitem),
                    
                    );
            },
            ).toList(),

            onChanged: bloc.changeairGuide,
            value: snapshot.data,
            //value: bloc.getBrCode(),
            style: textStyle(15),
            hint: Text('SOUND'),
            elevation: 8,
          );
        }
      );
  }

  Widget yardLoc(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.hmc,
      builder: (context, snapshot) 
        { 
          return DropdownButton<String>(
            items: _yardLoc.map((String dropDownStringitem) {
              return DropdownMenuItem<String>(
                    value: dropDownStringitem,
                    child: Text(dropDownStringitem),
                    
                    );
            },
            ).toList(),

            onChanged: bloc.changeHmc,
            value: snapshot.data,
            //value: bloc.getBrCode(),
            style: textStyle(15),
            hint: Text('OPEN'),
            elevation: 8,
          );
        }
      );
  }


  Widget agentCode(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.stickerTemp,
      builder: (context, snapshot) 
        { 
          return TextField(
            style: textStyle(20),
            onChanged: bloc.changeSticker,
            //keyboardType: TextInputType.emailAddress
            decoration: InputDecoration(
            labelStyle: textStyle(20),
            hintText: 'MEARSK',
            //labelText: 'Sticker',
            errorText: snapshot.error,
            ),
          );
        }
      );
  }

  Widget remarks(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.displayTemp,
      builder: (context, snapshot) 
        { 
          return TextField(
            style: textStyle(20),
            onChanged: bloc.changeDisplay,
            //keyboardType: TextInputType.emailAddress
            decoration: InputDecoration(
            labelStyle: textStyle(20),
            hintText: '8 degrees',
            //labelText: 'Display',
            errorText: snapshot.error,
            ),
          );
        }
      
      );
    
  }


  Widget submitButton(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.submitFirstValid,
      builder: (context, snapshot) 
      {
        return RaisedButton(
          child: Text('Login'),
          color: Colors.indigo,
          disabledColor: Colors.red,
          textColor: Colors.grey,
                    
          onPressed: !snapshot.hasData ? null : () 
                                { bloc.submit();
                                  // Navigator.push(context, new MaterialPageRoute(
                                  // builder: (context) => new Init_screen()));
                                },
        );
      },  
    );
  }

  //Widget dispInGrid(List<String> dataVal)
  Widget dispInGrid()
  {
      //return Text('here is the problem', style: TextStyle(fontSize: 20,color: Colors.brown),);
      NumScroller numscrl = new NumScroller(height:500.0, width:1280.0, 
                                            alignment: TextAlign.left,
                                            min:1, max:1000,);
      return numscrl;
  } 
  
}



class NumScroller extends StatefulWidget{
  final int max,min;
  final double height,width;
  final TextAlign alignment;

  NumScroller({this.height,this.width,this.alignment,this.min,this.max, initialOffset});

  @override
  NumScrollerState createState() {
    return new NumScrollerState();
  }
}

class NumScrollerState extends State<NumScroller> {
  final ScrollController controller = ScrollController();

  //https://stackoverflow.com/questions/53190644/flutter-datatable-tap-on-row
  // try for displaing check box
  static List<DataCell> _dataCells =
      ['A', 'B', 'C'].map((c) => DataCell(c=='A' ? Checkbox(value: true, onChanged: (b) {},) : Text(c))).toList();
      //['A', 'B', 'C'].map((c) => DataCell(Text(c))).toList();
  final List<DataRow> _sampleDataRows =
      [1, 2, 3, 4, 5, 6, 7, 8, 9,10,11].map((i) => DataRow(cells: _dataCells)).toList();
  final List<DataColumn> _dataColumns =
      [1, 2, 3].map((i) => DataColumn(label: Text(i==1 ? 'Select' : i == 2 ? 'Damage Code' : 'Repair Code'))).toList();

  getValue() => (controller.offset~/widget.height) + widget.min;

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: widget.width,
        height: widget.height,
        child: ListView(padding: EdgeInsets.all(20.0), 
          addRepaintBoundaries: true,
          children: <Widget>[
            SingleChildScrollView(
              //scrollDirection: Axis.vertical,
              child: 
                DataTable(
                  //sortColumnIndex: 1,
                  sortAscending: true,
                  columns: <DataColumn>[
                    DataColumn(
                      label: Expanded(flex:3, child: Text('Damage Code', 
                            style: TextStyle(fontSize: 20.00, 
                                            fontFamily: 'Raleway', 
                                            color: Colors.brown)), 
                              ),
                      numeric: false,
                      onSort: (i,b){},
                    ),
                    DataColumn(
                      label: Expanded(flex:3, child: Text('Repair Location', 
                            style: TextStyle(fontSize: 20.00, 
                                            fontFamily: 'Raleway', 
                                            color: Colors.brown)), 
                              ),                      numeric: false,
                      onSort: (i,b){},

                    ),
                      DataColumn(
                      label: Expanded(flex:4, child: Text('Repair Code', 
                            style: TextStyle(fontSize: 20.00, 
                                            fontFamily: 'Raleway', 
                                            color: Colors.brown)), 
                              ),                      numeric: false,
                      onSort: (i,b){},

                    ),
                  ],
                  rows: damageRepairSums.map((damageRepairSum) => DataRow(
                        onSelectChanged: (b){},
                        selected: true,
                        cells: <DataCell>[
                          DataCell(Text(damageRepairSum.damageCode)),
                          DataCell(Text(damageRepairSum.repairLocation)),
                          DataCell(Text(damageRepairSum.repairCode)),
                        ]
                  )).toList()
                  //Rows manually display no of columns
                  // rows: <DataRow>[
                  //   DataRow(
                  //     cells: <DataCell>[
                  //       DataCell(Text('LTS1')),
                  //       DataCell(Text('DAMAGED'))
                  //     ]
                  //   )
                  // ],
                // rows: _sampleDataRows,
                // columns: _dataColumns,
                ),
            ),
          ],//),
          //itemCount: widget.max - widget.min+1,
          controller: controller,
          physics: PageScrollPhysics(),
          itemExtent: widget.height,
      )
    );
  }
}

class DamageRepairSummary
{
  String damageCode;
  String repairLocation;
  String repairCode;

  DamageRepairSummary({this.damageCode,this.repairLocation,this.repairCode});

}

var damageRepairSums = <DamageRepairSummary>[
  DamageRepairSummary(damageCode: 'WARE AND TARE DMG', repairLocation: 'LEFT SIDE SELECTION 2', repairCode: 'STRAIGHTEN'),
  DamageRepairSummary(damageCode: 'WARE AND TARE DMG',repairLocation: 'FLOOR LEFT SELECTION', repairCode: 'REPAIR OF FLOOR PANEL'),
  DamageRepairSummary(damageCode: 'WARE AND TARE DMG',repairLocation: 'DOOR HANDLE', repairCode: 'REPAIR HANDLE'),
  DamageRepairSummary(damageCode: 'WARE AND TARE DMG', repairLocation: 'LEFT SIDE SELECTION 2', repairCode: 'STRAIGHTEN'),
  DamageRepairSummary(damageCode: 'WARE AND TARE DMG',repairLocation: 'FLOOR LEFT SELECTION', repairCode: 'REPAIR OF FLOOR PANEL'),
  DamageRepairSummary(damageCode: 'WARE AND TARE DMG',repairLocation: 'DOOR HANDLE', repairCode: 'REPAIR HANDLE'),
  DamageRepairSummary(damageCode: 'WARE AND TARE DMG', repairLocation: 'LEFT SIDE SELECTION 2', repairCode: 'STRAIGHTEN'),
  DamageRepairSummary(damageCode: 'WARE AND TARE DMG',repairLocation: 'FLOOR LEFT SELECTION', repairCode: 'REPAIR OF FLOOR PANEL'),
  DamageRepairSummary(damageCode: 'WARE AND TARE DMG',repairLocation: 'DOOR HANDLE', repairCode: 'REPAIR HANDLE'),  ];