abstract class AddAvisClientsEvent {}

class AddAvisClientsSignUpEvent extends AddAvisClientsEvent {
  final String id;
  final String firstname;
  final String text;
  final DateTime publishDate;
  final Function navigateToAccount;



  AddAvisClientsSignUpEvent({
    required this.id,
    required this.firstname,
    required this.text,
    required this.publishDate,
    required this.navigateToAccount,
  });

}