import 'dart:async';

class Validators
{
  final validateEmail = StreamTransformer<String,String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains('@')) 
        {
          sink.add(email);
        }
        else
        {
          sink.addError('Enter a Valid Email Id. !');
        }
    });
  
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (pwd, sink) {
      if (pwd.length > 3)
      {
        sink.add(pwd);
      }
      else
      {
        sink.addError('Pwd atleast 4 chars.');
      }
    }

  );

  // For Branch code and Yard code validation
  final validateCode = StreamTransformer<String, String>.fromHandlers(
    handleData: (code, sink) {
      if (code.isNotEmpty)
      {
        sink.add(code);
      }
      else
      {
        sink.addError('Select Code.');
      }
    }
  );

  // Validating Pre Gate In Screen
  final validateContNo = StreamTransformer<String,String>.fromHandlers(
  handleData: (contNo, sink) {
    if (contNo.isNotEmpty) 
      {
        sink.add(contNo);
      }
      else
      {
        sink.addError('Invalid Container No. !');
      }
  });

  // Validating Pre Gate In Screen
  final validatedropDown = StreamTransformer<String,String>.fromHandlers(
  handleData: (dpvalue, sink) {
    //sink.add(dpvalue);
    if (dpvalue.isNotEmpty) 
        {
          sink.add(dpvalue);
        }
        else
        {
          sink.addError('Select Data !');
          //sink.addError(Stream.empty());
        }
  });

  // Validate all the common Text fields
  final validateTxtFld = StreamTransformer<String,String>.fromHandlers(
  handleData: (txtFld, sink) {
    if (txtFld.isNotEmpty) 
      {
        sink.add(txtFld);
      }
      else
      {
        //sink.addError('Enter data.');
        //sink.addError(Stream.empty());
      }
  });


}

