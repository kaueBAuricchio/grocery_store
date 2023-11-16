

String authErrorsString(String? error){

  switch(error) {
  case 'INVALID_CREDENTIALS':
    return 'Email ou Senha invalidos';
    case 'Invalid session token':
      return 'Token invalido';
  default:
    return 'Um erro indefinido ocorreu';
  }
  }
