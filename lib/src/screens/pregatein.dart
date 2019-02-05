import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';
//import 'Init_screen.dart';

class PregateIn extends StatelessWidget
{
  final _contSizes = ['10','20','40','45'];
  final _contTypes = ['GP','HP','RH','OT'];
  final _elecCable = ['SOUND','NO SOUND'];
  final _airGuide = ['SOUND','NO SOUND'];
  final _hmc = ['OPEN','CLOSED'];
  final _vent = ['OPEN','CLOSED'];
  final _running =  ['YES','NO'];
  final _condition = ['DAMAGE','BENT','NO COOLING'];
  final _additionalReqmnts = ['WASHING','DENTING','WELDING'];
  
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

    return new Stack(
      overflow: Overflow.clip,
      children: <Widget>[
        Row(children:<Widget> [
          SingleChildScrollView(
            //scrollDirection: Axis.vertical,
            child:
            new Container(
                width: 400.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                ),
                child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Container(height: 10.0),
                      contNoFld(preGInbloc),
                      //contNoFld(bloc),
                      Row(children: <Widget>[
                          Expanded(child:contSize(preGInbloc)),
                          Container(width: 20),
                          Expanded(child: contType(preGInbloc)),
                          ],
                      ),
                      Container(height: 10.0),
                      Text('Reefer Unit',textAlign: TextAlign.left,style:textStyle(25.00)),
                      Row( children: <Widget>[
                          Expanded(child:Text('Electrical Cable',textAlign: TextAlign.left,style:textStyle(15.00))),
                          Container(width: 20),
                          Expanded(child:elecCable(preGInbloc)),
                      ]),
                      Row( children: <Widget>[
                          Expanded(child:Text('Air Guide',textAlign: TextAlign.left,style:textStyle(15.00))),
                          Container(width: 20),
                          Expanded(child:airGuide(preGInbloc)),
                      ]),                      
                      Row( children: <Widget>[
                          Expanded(child:Text('H M C',textAlign: TextAlign.left,style:textStyle(15.00))),
                          Container(width: 20),
                          Expanded(child:hmc(preGInbloc)),
                      ]),
                      Row( children: <Widget>[
                          Expanded(child:Text('Vent',textAlign: TextAlign.left,style:textStyle(15.00))),
                          Container(width: 20),
                          Expanded(child:vent(preGInbloc)),
                      ]),
                      Row( children: <Widget>[
                          Expanded(child:Text('Running',textAlign: TextAlign.left,style:textStyle(15.00))),
                          Container(width: 20),
                          Expanded(child:running(preGInbloc)),
                      ]), 
                      Row( children: <Widget>[
                          Expanded(child:Text('Sticker Temp.',textAlign: TextAlign.left,style:textStyle(15.00))),
                          Container(width: 20),
                          Expanded(child:stickerTempFld(preGInbloc)),
                      ]),
                                            Row( children: <Widget>[
                          Expanded(child:Text('Display Temp.',textAlign: TextAlign.left,style:textStyle(15.00))),
                          Container(width: 20),
                          Expanded(child:displayTempFld(preGInbloc)),
                      ]),
                      Row( children: <Widget>[
                          Expanded(child:Text('Condition',textAlign: TextAlign.left,style:textStyle(15.00))),
                          Container(width: 20),
                          Expanded(child:cntCondition(preGInbloc)),
                      ]),
                      Row( children: <Widget>[
                          Expanded(child:Text('Additional Requirement',textAlign: TextAlign.left,style:textStyle(15.00))),
                          Container(width: 20),
                          Expanded(child:additionalReq(preGInbloc)),
                      ]),                                                                                                             
                    ],
                  )
               
              ),
            ),
            // second column of the screen
            new Container(
              width: 880.0,
              child: 
              Column( children: <Widget>[
                Expanded(flex: 3, child: 
                //Display image in the right top
                new Container(
                  //height: 200.00,
                  decoration: new BoxDecoration(
                        image: new DecorationImage(
                        image: new AssetImage('lib/img/bg.jpg'),
                        fit: BoxFit.cover,
                        ),
                  ),                 
                )
              ),
              Expanded(flex:1,child: 
                Container(alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(color: Colors.lightBlueAccent[200]), 
                          child: Text('     Damage Repair Summary',
                                  style: TextStyle(fontSize: 25,color: Colors.white),),
                         ),),
                Expanded( flex: 6, child: 
                // display scrollable datatable                    
                  new Container(
                        child: dispInGrid(),
                  ) 
                )
              ])
          ),
        ])  
      ]);
  }



  Widget contNoFld(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.contNo,
      builder: (context, snapshot) 
        { 
          return TextField(
            style: textStyle(20),
            onChanged: bloc.changeContNo,
            //keyboardType: TextInputType.emailAddress
            decoration: InputDecoration(
            labelStyle: textStyle(20),
            hintText: 'PICK4658946',
            labelText: 'Container No.:',
            errorText: snapshot.error,
            ),
          );
        }
      
      );
    
  }

  Widget contSize(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.cntSize,
      builder: (context, snapshot) 
        { 
          return DropdownButton<String>(
            items: _contSizes.map((String dropDownStringitem) {
              return DropdownMenuItem<String>(
                    value: dropDownStringitem,
                    child: Text(dropDownStringitem),
                    
                    );
            },
            ).toList(),

            onChanged: bloc.changeSize,
            value: snapshot.data,
            //value: bloc.getBrCode(),
            style: textStyle(20),
            hint: Text('Size'),
            elevation: 8,
          );
        }
      );
  }

  Widget contType(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.cntType,
      builder: (context, snapshot) 
        { 
          return DropdownButton<String>(
            items: _contTypes.map((String dropDownStringitem) {
              return DropdownMenuItem<String>(
                    value: dropDownStringitem,
                    child: Text(dropDownStringitem),
                    
                    );
            },
            ).toList(),

            onChanged: bloc.changeType,
            value: snapshot.data,
            //value: bloc.getBrCode(),
            style: textStyle(20),
            hint: Text('Type'),
            elevation: 8,
          );
        }
      );
  }

  Widget elecCable(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.elecCable,
      builder: (context, snapshot) 
        { 
          return DropdownButton<String>(
            items: _elecCable.map((String dropDownStringitem) {
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

  Widget airGuide(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.airGuide,
      builder: (context, snapshot) 
        { 
          return DropdownButton<String>(
            items: _airGuide.map((String dropDownStringitem) {
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

  Widget hmc(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.hmc,
      builder: (context, snapshot) 
        { 
          return DropdownButton<String>(
            items: _hmc.map((String dropDownStringitem) {
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

  Widget vent(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.vent,
      builder: (context, snapshot) 
        { 
          return DropdownButton<String>(
            items: _vent.map((String dropDownStringitem) {
              return DropdownMenuItem<String>(
                    value: dropDownStringitem,
                    child: Text(dropDownStringitem),
                    
                    );
            },
            ).toList(),

            onChanged: bloc.changeVent,
            value: snapshot.data,
            //value: bloc.getBrCode(),
            style: textStyle(15),
            hint: Text('CLOSED'),
            elevation: 8,
          );
        }
      );
  }

  Widget running(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.running,
      builder: (context, snapshot) 
        { 
          return DropdownButton<String>(
            items: _running.map((String dropDownStringitem) {
              return DropdownMenuItem<String>(
                    value: dropDownStringitem,
                    child: Text(dropDownStringitem),
                    
                    );
            },
            ).toList(),

            onChanged: bloc.changeRunning,
            value: snapshot.data,
            //value: bloc.getBrCode(),
            style: textStyle(15),
            hint: Text('NO'),
            elevation: 8,
          );
        }
      );
  }

  Widget stickerTempFld(Bloc bloc)
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
            hintText: '5 degrees',
            //labelText: 'Sticker',
            errorText: snapshot.error,
            ),
          );
        }
      );
  }

  Widget displayTempFld(Bloc bloc)
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

  Widget cntCondition(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.contCondition,  
      builder: (context, snapshot) 
        { 
          return DropdownButton<String>(
            items: _condition.map((String dropDownStringitem) {
              return DropdownMenuItem<String>(
                    value: dropDownStringitem,
                    child: Text(dropDownStringitem),
                    );
            },
            ).toList(),
            
            onChanged: bloc.changeCondition,
            value: snapshot.data,
            //value: bloc.getYardCode(),
            hint: Text('Condition'),
            style: textStyle(15)
          );
        }
      );
  }

  Widget additionalReq(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.additionalReq,
      builder: (context, snapshot) 
        { 
          return DropdownButton<String>(
            items: _additionalReqmnts.map((String dropDownStringitem) {
              return DropdownMenuItem<String>(
                    value: dropDownStringitem,
                    child: Text(dropDownStringitem),
                    
                    );
            },
            ).toList(),

            onChanged: bloc.changeAddReq,
            value: snapshot.data,
            //value: bloc.getBrCode(),
            style: textStyle(15),
            hint: Text('Additional Requirement'),
            elevation: 8,
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
      NumScroller numscrl = new NumScroller(height:500.0, width:880.0, 
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
      [1, 2, 3].map((i) => DataColumn(label: Text(i==1 ? 'Select' : i == 2 ? 'Damage Location' : 'Repair Code'))).toList();
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
              scrollDirection: Axis.vertical,
              child: 
                DataTable(
                  //sortColumnIndex: 1,
                  sortAscending: true,
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text('Damage Location', 
                            style: TextStyle(fontSize: 20.00, 
                                            fontFamily: 'Raleway', 
                                            color: Colors.brown)), 
                      numeric: false,
                      onSort: (i,b){},

                    ),
                    DataColumn(
                      label: Text('Repair Code', 
                            style: TextStyle(fontSize: 20.00, 
                                            fontFamily: 'Raleway', 
                                            color: Colors.brown)), 
                      numeric: false,
                      onSort: (i,b){},

                    ),
                  ],
                  rows: damageCodes.map((damagecode) => DataRow(
                        onSelectChanged: (b){},
                        selected: true,
                        cells: <DataCell>[
                          DataCell(Text(damagecode.damageLocation)),
                          DataCell(Text(damagecode.repairCode)),
                        ]
                  )).toList()
                  //Rows manually display no of 1 row, 2 columns
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
  String damageLocation;
  String repairCode;

  DamageRepairSummary({this.damageLocation,this.repairCode});
}

var damageCodes = <DamageRepairSummary>[
  DamageRepairSummary(damageLocation: 'LTS1', repairCode: 'MISALIGNED'),
  DamageRepairSummary(damageLocation: 'LTS1', repairCode: 'DELAMINATION'),
  DamageRepairSummary(damageLocation: 'LTS1', repairCode: 'CRACKED'),
  DamageRepairSummary(damageLocation: 'LTS1', repairCode: 'BENT'),
  DamageRepairSummary(damageLocation: 'LTS2', repairCode: 'MISALIGNED'),
  DamageRepairSummary(damageLocation: 'LTS2', repairCode: 'DELAMINATION'),
  DamageRepairSummary(damageLocation: 'LTS2', repairCode: 'CRACKED'),
  DamageRepairSummary(damageLocation: 'LTS2', repairCode: 'BENT'),
  ];