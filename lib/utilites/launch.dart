import 'package:url_launcher/url_launcher.dart';

class Launching {
  Future<void> call(String number) async => await launch("tel:$number");

  Future<void> sendSms(String number) async => await launch("sms:$number");

  Future<void> sendEmail(String email) async => await launch("mailto:$email");

  Future<void> openurl(String sourcelink) async => await launch("$sourcelink");
}
