import 'package:aerium/infrastructure/failures/email_failure.dart';
import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:http/http.dart' as http;
import 'package:aerium/values/values.dart';

import 'email_model.dart';

abstract class EmailApi {
  ///portfolio-api-chi.vercel.app/api/getintouch
  Future<Email> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}

class EmailApiImpl implements EmailApi {
  final http.Client client;

  EmailApiImpl({required this.client});

  Future<Email> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      String serviceId = "service_wwbtyhd";
      String templateId = "template_o9xra08";

      final templateParams = {
        'from_name': name,
        'to_name': 'Aashish',
        'message':
            "Name: $name \n Email: $email \n Subject: $subject \n Message: $message",
      };

      await emailjs.send(
        serviceId,
        templateId,
        templateParams,
        const emailjs.Options(
          publicKey: '15xmVfRvzX3r1PCbD',
          privateKey: 'Nho-AvFVItbIq6pKS2Y8O',
        ),
      );
      return Email(status: "success");

      // String username = '8a939df994f2c2a485dc7d79c1e5554b';
      // String password = '80ec2c08aca25efce4c8a37c485a4acd';
      // String basicAuth =
      //     'Basic ' + base64.encode(utf8.encode('$username:$password'));
      // print(basicAuth);
      // final response = await http.post(
      //   Uri.parse("https://api.mailjet.com/v3/send"),
      //   headers: <String, String>{
      //     "Access-Control-Allow-Origin": "*",
      //     'Content-Type': 'application/json',
      //     'Accept': '*/*',
      //     'Authorization': basicAuth,
      //   },
      //   body: jsonEncode({
      //     "FromEmail": "aashish@digisigns.in",
      //     "FromName": "Aashish Tech",
      //     "Recipients": [
      //       {"Email": "aashishg2003@gmail.com", "Name": "Aashish Gupta"}
      //     ],
      //     "Subject": "New Contact Request from $name",
      //     "Html-part":
      //         "<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><title>$subject</title><style>body{font-family:sans-serif;} .container{width:80%;margin:0 auto;padding:20px;border:1px solid #ccc;} .header{text-align:center;font-size:24px;margin-bottom:20px;} .info{margin-bottom:10px;} .label{font-weight:bold;margin-right:10px;} .message{font-size:16px;line-height:1.5;margin-bottom:20px;}</style></head><body><div class=\"container\"> <div class=\"header\">Message from $name</div> <div class=\"info\"> <span class=\"label\">From:</span> <span>$name</span> <br> <span class=\"label\">Email:</span> <span>$email</span> </div> <div class=\"message\"> <p>Subject: $subject</p> <p>$message</p> </div> </div></body></html>",
      //     "Text-part":
      //        ,
      //   }),
      // );

      // if (response.statusCode == 200) {
      //   return Email(status: "success");
      // } else {
      //   throw EmailFailure.serverError();
      // }
    } catch (e) {
      print("Error: ${e.toString()}");
      throw EmailFailure.serverError();
    }
  }
}
