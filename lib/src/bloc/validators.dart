import 'dart:async';



class Validators {


  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( email, sink ) {

    if ( email.length >= 6 ) {
        sink.add( email );
      } else {
        sink.addError('Más de 6 caracteres por favor');
      }

    }
  );


  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: ( password, sink ) {

      if ( password.length >= 6 ) {
        sink.add( password );
      } else {
        sink.addError('Más de 6 caracteres por favor');
      }

    }
  );


}
