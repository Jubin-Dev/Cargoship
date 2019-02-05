import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';


class Bloc extends Object with Validators
// Or class Bloc extends Validators
{
  // final _emailController = StreamController<String>.broadcast();
  // final _passwordController = StreamController<String>.broadcast();
  // Above code can be replaced with below to access the submitbutton --> method "submit"

  // Login screen
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _branchCodeController = BehaviorSubject<String>();
  final _yardCodeController = BehaviorSubject<String>();

  // Pre Gate In screen
  final _contNoController = BehaviorSubject<String>();
  final _sizeController = BehaviorSubject<String>();
  final _typeController = BehaviorSubject<String>();
  final _elecCableController = BehaviorSubject<String>();
  final _airGuideController = BehaviorSubject<String>();
  final _hmcController = BehaviorSubject<String>();
  final _ventController = BehaviorSubject<String>();
  final _runningController = BehaviorSubject<String>();
  final _stickerController = BehaviorSubject<String>();
  final _displayController = BehaviorSubject<String>();
  final _conditionController = BehaviorSubject<String>();
  final _additionalReqController = BehaviorSubject<String>();

  // Stream data to variable
  //Login Screen
  Stream<String> get eMail => _emailController.stream.transform(validateEmail);
  Stream<String> get passWord => _passwordController.stream.transform(validatePassword);
  Stream<String> get branchCode => _branchCodeController.transform(validateCode);
  Stream<String> get yardCode => _yardCodeController.transform(validateCode);
  Stream<bool> get submitValid => Observable.combineLatest4(eMail, passWord, branchCode, yardCode, (e,p,b,y) => true);
  // Pre Gate In screen
  Stream<String> get contNo => _contNoController.stream.transform(validateContNo);
  Stream<String> get cntSize => _sizeController.stream.transform(validatedropDown);
  Stream<String> get cntType => _typeController.transform(validatedropDown);
  Stream<String> get elecCable => _elecCableController.transform(validatedropDown);
  Stream<String> get airGuide => _airGuideController.stream.transform(validatedropDown);
  Stream<String> get hmc => _hmcController.stream.transform(validatedropDown);
  Stream<String> get vent => _ventController.transform(validatedropDown);
  Stream<String> get running => _runningController.transform(validatedropDown);
  Stream<String> get stickerTemp => _stickerController.stream.transform(validateTxtFld);
  Stream<String> get displayTemp => _displayController.stream.transform(validateTxtFld);
  Stream<String> get contCondition => _conditionController.transform(validatedropDown);
  Stream<String> get additionalReq => _additionalReqController.transform(validatedropDown);
  // PreGateIn fields 
  Stream<bool> get submitFirstValid => Observable.combineLatest9(
    contNo, cntSize, cntType, elecCable, airGuide, hmc,
    vent, running, stickerTemp, (c,s,t,e,a,h,v,r,b) => true);

  Stream<bool> get submitSecValid => Observable.combineLatest3(
    displayTemp, contCondition, additionalReq, 
    (x,y,z) => true);

  // Change Data 
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeBranch => _branchCodeController.sink.add;
  Function(String) get changeYard => _yardCodeController.sink.add;
  // Pre Gate In screen
  Function(String) get changeContNo => _contNoController.sink.add;
  Function(String) get changeSize => _sizeController.sink.add;
  Function(String) get changeType => _typeController.sink.add;
  Function(String) get changeElecCable => _elecCableController.sink.add;
  Function(String) get changeairGuide => _airGuideController.sink.add;
  Function(String) get changeHmc => _hmcController.sink.add;
  Function(String) get changeVent => _ventController.sink.add;
  Function(String) get changeRunning => _runningController.sink.add;
  Function(String) get changeSticker => _stickerController.sink.add;
  Function(String) get changeDisplay => _displayController.sink.add;
  Function(String) get changeCondition => _conditionController.sink.add;
  Function(String) get changeAddReq => _additionalReqController.sink.add;  


  String getUser()
  {
  String userCode = _emailController.value;
  return userCode;
  }
  
  // String getYardCode()
  // {
  // String yardCode = _yardCodeController.value;
  // return yardCode;
  // }


  submit()
  {
    final validEmail = _emailController.value;
    final validPwd = _passwordController.value;
    final validBranch = _branchCodeController.value;
    final validYard = _yardCodeController.value;

    print('Email is : $validEmail');
    print('Password is : $validPwd');
    print('Branch is : $validBranch');
    print('Yard is : $validYard');
  }
 submitPreGateIn()
  {
    final validContNo = _contNoController.value;
    final validSize = _sizeController.value;
    final validType = _typeController.value;
    final validElecCable = _elecCableController.value;

    print('Email is : $validContNo');
    print('Password is : $validSize');
    print('Branch is : $validType');
    print('Yard is : $validElecCable');
  }

  dispose()
  {
    // Login controllers
    _emailController.close();
    _passwordController.close();
    _branchCodeController.close();
    _yardCodeController.close();
   
   // PreGateIn
   _contNoController.close(); 
   _sizeController.close();
   _typeController.close();
   _elecCableController.close();
   _airGuideController.close();
   _hmcController.close();
   _ventController.close();
   _runningController.close();
   _stickerController.close();
   _displayController.close();
   _conditionController.close();
   _additionalReqController.close();
  }

}

//final bloc = Bloc();