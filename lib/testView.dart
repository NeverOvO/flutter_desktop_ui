
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'Base/EventBus.dart';
class StrategicEditPageHedgeViewController extends StatefulWidget {
  final arguments;
  const StrategicEditPageHedgeViewController({Key? key, this.arguments}) : super(key: key);

  @override
  _StrategicEditPageHedgeViewControllerState createState() =>
      _StrategicEditPageHedgeViewControllerState();
}

class _StrategicEditPageHedgeViewControllerState extends State<StrategicEditPageHedgeViewController> {

  TextEditingController _priceController = TextEditingController();

  int selet = 0;

  bool _isDark = false;

  double _value = 0.0;

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      right: true,
      bottom: false,
      left: true,
      top: false,
      child: Scaffold(
        appBar: NeumorphicAppBar(
          actions: [
            GestureDetector(
              child: Container(
                child: Text('测试'),
              ),
              onTap: (){

              },
            )
          ],
          title: Text(widget.arguments['title'], style: TextStyle(fontSize: 17)),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Neumorphic(
                child: Container(
                  child:Icon(Icons.repeat_rounded),
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(height: 10,),
              NeumorphicButton(
                child: Container(
                  child: Text('测试'),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/StrategicEditPageHedgeViewController',arguments: {
                    'title' : 'a'
                  });
                },
              ),
              SizedBox(height: 10,),
              NeumorphicText(
                'Flutter',
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  depth: 4,
                  intensity: 0.9,
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 100,

                ),
              ),
              SizedBox(height: 10,),
              NeumorphicIcon(
                Icons.sanitizer,
                size: 100,
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  depth: 4,
                  intensity: 0.9,
                ),
              ),
              SizedBox(height: 10,),
              Neumorphic(
                child: Container(
                  child:TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(15, 159, 131, 0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(15, 159, 131, 0)),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      ),

                      suffixText: '11',
                      suffixStyle: TextStyle(fontSize: 20),
                      hintText: '请输入单价',
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                    controller: _priceController,
                    autocorrect:false,

                    keyboardType: TextInputType.numberWithOptions(
                      decimal : true,
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              NeumorphicSwitch(
                onChanged: (value){
                  setState(() {
                    bus.emit('balck');
                    _isDark = !_isDark;
                  });
                },
                value: _isDark,
                height: 30,
              ),
              SizedBox(height: 10,),
              NeumorphicSlider(
                value: _value,
                onChanged: (value){
                  setState(() {
                    _value = value;
                  });
                },
                max: 10,
                min: 0,
              ),
              SizedBox(height: 10,),

              NeumorphicProgressIndeterminate(
              ),

            ],
          )
        )

      ),
    );
  }
}