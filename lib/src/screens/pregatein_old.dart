import 'package:flutter/material.dart';
import '../../layout_type.dart';
import '../main_app_bar.dart';

// import 'package:layout_demo_flutter/layout_type.dart';
//import 'package:layout_demo_flutter/pages/main_app_bar.dart';

//void main() => runApp(ExpandedPage(layoutGroup: LayoutGroup.nonScrollable));

class PreGateIn extends StatelessWidget //implements HasLayoutGroup 
{
  //ExpandedPage({Key key, this.layoutGroup, this.onLayoutToggle}) : super(key: key);
  PreGateIn({Key key,this.layoutGroup}):super(key: key);
  
  final LayoutGroup layoutGroup;
  //final VoidCallback onLayoutToggle;
  final _codes = ['EMPTY','FCL','LCL'];
  final String strSpace = '               '; //for alignment in screen.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: 
      // MainAppBar(
      //   layoutGroup: layoutGroup,  //nonscrollable
      //   layoutType: LayoutType.expanded,
      //   //onLayoutToggle: onLayoutToggle,
      // ),
      body: Container(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildBox({int points, Color color, Color textColor = Colors.white}) {
    return Expanded(
      
      flex: points,
      child: Container(
        constraints: BoxConstraints.expand(),
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            points == 1 ? createContDetails() : 
            points == 18 ? showRadioBtn() :
            points == 22 ? //Text('No Widget available') : dispInGrid(),
                          dispInGrid() : Text('No Widget available')
          ],
        )
      )
    );
  }

  Size _goldenRatio(BoxConstraints constraints) {
    double ratio = 13.0 / 25.0;
    if (constraints.maxHeight / constraints.maxWidth > ratio) {
      double height = constraints.maxWidth * ratio;
      return Size(constraints.maxWidth, height);
    } else {
      double width = constraints.maxHeight / ratio;
      return Size(width, constraints.maxHeight);
      //return Size(width, constraints.maxHeight);
    }
  }

  Widget _centeredLayout({Widget child}) {
    return LayoutBuilder(builder: (content, constraints) {
      Size size = _goldenRatio(constraints);
      return Center(
        child: Container(
          
          constraints: BoxConstraints(
            
            // replace_goldenRation calculation with hardcoded values.
            // maxWidth: size.width < 1280.0 ? 1280.0 : size.width,   //1280.0
            // maxHeight: size.height < 665.6 ? 665.6 : size.height,  // 665.6
              maxWidth: size.width, 
              maxHeight: size.height,
            
             // maxWidth: 1634.0,
             // maxHeight: 768.0,
          ),
          
          child: child,
          
        ),
      );
    });
  }

  Widget _buildContent() {
    return _centeredLayout(
      child: Column(
        children: [
          //_buildBox(points: 10, color: Colors.red),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                _buildBox(points: 1, color: Colors.white),
                Expanded(
                  flex: 3,
                  // child: Column(   //  Row( 
                  //   children: [
                  //     Expanded(
                  //       flex: 2,
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //             flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _buildBox(points: 18, color: Colors.white),
                                  _buildBox(points: 22, color: Colors.white),
                                ],
                              ),
                  //           ),
                  //          // _buildBox(points: 5, color: Colors.brown),
                  //         ],
                  //       ),
                  //     ),
                  //    // _buildBox(points: 5, color: Colors.purple),
                  //   ],
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createContDetails()
  {
    return Container( 
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: <Widget>[
              
                showTxtFld('Container number', 'Container No.:',20.0),
                createDrpDowns(' Size                  ' + strSpace, _codes, 20.0),
                createDrpDowns(' Type                 ' + strSpace, _codes, 20.0),
                Text(' Reefer Unit:         ', style: TextStyle(fontSize: 25.0, 
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent)),
                createDrpDowns(' Elcetrical Cabel     ' + strSpace, _codes, 17.0),
                createDrpDowns(' Air Guide                ' + strSpace, ['SOUND', 'NO SOUND','EMPTY'], 17.0),
                createDrpDowns(' H M C                      ' + strSpace, ['SOUND', 'NO SOUND'], 17.0),
                createDrpDowns(' Vent                        ' + strSpace, ['SOUND', 'NO SOUND','EMPTY'], 17.0),
                createDrpDowns(' Running                  ' + strSpace, ['SOUND', 'NO SOUND'], 17.0),
                showTxtFld(' Sticker temp.         ' + strSpace, 'Temp. sticker:',17.0),
                showTxtFld(' Display temp.        ' + strSpace, 'Temp. display:',17.0),
                createDrpDowns(' Condition                          ' + strSpace, ['SOUND', 'NO SOUND','EMPTY'], 20.0),
                createDrpDowns(' Additional Requirement' + strSpace, ['SOUND', 'NO SOUND'], 20.0),
          ],
        )
    );
  }

  Widget showTxtFld(String hinttxt, String lblTxt, double fntSize)
  {
    return TextField(
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: fntSize, fontStyle: FontStyle.normal),
      decoration: InputDecoration(
            labelStyle: TextStyle(fontSize: fntSize,color: Colors.blueAccent),
            hintText: hinttxt,
            labelText: lblTxt,
      ),
    );
  }

  Widget createDrpDowns(String lblString, List<String> codes, double fntSize)
  {
    return DropdownButton<String>(
      items: codes.map((String dropDownStringitem) {
        return DropdownMenuItem<String>(
              value: dropDownStringitem,
              child: Text(dropDownStringitem),
              
              );
      },
      ).toList(),

      onChanged: _changeClockType('Sample'),
      //onChanged: bloc.changeBranch,
      //value: snapshot.data,
      //value: bloc.getBrCode(),
      // style: TextStyle(fontSize: fntSize, fontStyle: FontStyle.normal, 
      //                     fontWeight: FontWeight.bold, color: Colors.blue),
      hint: Text(lblString, style: TextStyle(fontSize: fntSize, 
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent)),
      elevation: 8,
    );
  }

  _changeClockType(String typ) // ClockFaceType type) {
    {
    //{widget.onChangeClockType(typ);
    // _setOpacity(0.25);
    // _setOpacity(1.0, debounce: 1000);
    }

  Widget showRadioBtn()
  {
    return Container( 
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: new Icon(Icons.radio),
              title: new Text('Select Option:', style: TextStyle(fontWeight: FontWeight.bold, 
                                            fontSize: 25.0, color: Colors.blueAccent)),
              dense: true,
              contentPadding: EdgeInsets.all(10.5),
            ),
            RadioListTile(
              value: 'Misaligned',
              groupValue: 'Misaligned Group',
              onChanged: _changeClockType('Misaligned'),
              activeColor: Colors.blue,
              title: new Text('MISALIGNED', style: TextStyle(fontWeight: FontWeight.bold, 
                                            fontSize: 20.0, color: Colors.blueAccent)),
              dense: true,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            RadioListTile(
              value: 'Delamination',
              groupValue: 'Delamination Group',
              onChanged: _changeClockType('Delamination'),
              activeColor: Colors.blue,
              title: new Text('DELAMINATION', style: TextStyle(fontWeight: FontWeight.bold, 
                                            fontSize: 20.0, color: Colors.blueAccent)),
              dense: true,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            RadioListTile(
              value: 'Cracked',
              groupValue: 'Cracked Group',
              onChanged: _changeClockType('Cracked'),
              activeColor: Colors.blue,
              title: new Text('CRACKED', style: TextStyle(fontWeight: FontWeight.bold, 
                                            fontSize: 20.0, color: Colors.blueAccent)),
              dense: true,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            RadioListTile(
              value: 'Bent',
              groupValue: 'Bent Group',
              onChanged: _changeClockType('Bent'),
              activeColor: Colors.blue,
              title: new Text('BENT', style: TextStyle(fontWeight: FontWeight.bold, 
                                            fontSize: 20.0, color: Colors.blueAccent)),
              dense: true,
              controlAffinity: ListTileControlAffinity.trailing,
            )
          ],
      )
    );
  }

  //Widget dispInGrid(List<String> dataVal)
  Widget dispInGrid()
  {
      //return Text('here is the problem', style: TextStyle(fontSize: 20,color: Colors.brown),);
      NumScroller numscrl = new NumScroller(height: 374.0, width:960.0, 
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
      ['A', 'B', 'C'].map((c) => DataCell(c=='A' ? Checkbox(value: false, onChanged: (b) {},) : Text(c))).toList();
  final List<DataRow> _sampleDataRows =
      [1, 2, 3, 4, 5, 6, 7].map((i) => DataRow(cells: _dataCells)).toList();
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
                rows: _sampleDataRows,
                columns: _dataColumns,
                ),
            ),
          ],//),
        // child: ListView.builder(itemBuilder: (context, index) {
        //   return new Container(height: widget.height, 
        //                 child: Column(
        //                   children: <Widget>[
        //                   Text((widget.max - index).toString(),
        //                           textAlign: widget.alignment),
        //                   ])
        //                 );
        //           },
        //  itemCount: widget.max - widget.min+1,
          controller: controller,
          physics: PageScrollPhysics(),
          itemExtent: widget.height,
        )
    );
  }
}

//https://github.com/flutter/flutter/issues/21622
// link for below samle code
class Demo extends StatelessWidget {
  static List<DataCell> _dataCells =
      ['A', 'B', 'C', 'D', 'E'].map((c) => DataCell(Text(c))).toList();
  final List<DataRow> _sampleDataRows =
      [1, 2, 3, 4, 5].map((i) => DataRow(cells: _dataCells)).toList();
  final List<DataColumn> _dataColumns =
      [1, 2, 3, 4, 5].map((i) => DataColumn(label: Text('Col$i'))).toList();

  // @override
   Widget build(BuildContext context) 
    {
    return MaterialApp(
      home: Scaffold(
        body: ListView(padding: EdgeInsets.all(20.0), children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              rows: _sampleDataRows,
              columns: _dataColumns,
            ),
          ),
        ]),
      ),
    );
  }
}