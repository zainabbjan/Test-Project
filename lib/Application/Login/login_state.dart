
abstract class EmailState {
  const EmailState();
}

class InitialEmailSigIn extends EmailState {
   InitialEmailSigIn();
}

class LoadingEmailSigIn extends EmailState {
}

class LoadedEmailSigIn extends EmailState {
  final   user;
   LoadedEmailSigIn(this.user);
}

class ErrorEmailSigIn extends EmailState {
  ErrorEmailSigIn({this.error});
  final String? error;
}
