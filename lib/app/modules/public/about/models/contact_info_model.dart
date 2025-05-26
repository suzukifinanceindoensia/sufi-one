class ContactInfo {
  final String title;
  final String value;
  final void Function() onTap;

  ContactInfo({required this.title, required this.value, required this.onTap});
}
