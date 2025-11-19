import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:lagostv/upload_report.dart';
import 'package:social_media_flutter/widgets/icons.dart';
import 'package:social_media_flutter/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: const Color(0xff000000),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          title: const Text('Menu', style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0, top: 10.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Lagos State Television',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: const Color(0xffffffff),
                  elevation: 15.0,
                  child: SizedBox(
                    width: screenWidth * 0.95,
                    height: screenHeight / 10,
                    child: Column(
                      children: [
                        InkWell(
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Upload your Community Report',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UploadReport()));
                          },
                        ),
                        const Divider(
                            height: 32,
                            thickness: 1.0,
                            indent: 15.0,
                            endIndent: 15.0,
                            color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, top: 10.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Contact',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: const Color(0xffb61005),
                child: SizedBox(
                  width: screenWidth * 0.95,
                  height: screenHeight / 1.75,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SocialWidget(
                          placeholderText:
                              'ltvsocial', //text visible to viewers
                          iconData: SocialIconsFlutter
                              .instagram, //use the respective social logo
                          iconColor: Colors.black, //(optional, default - grey)
                          link:
                              'https://www.instagram.com/ltvsocial/', //provide the link
                          placeholderStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20), //placeholder text style
                        ),
                        const Divider(
                            height: 15,
                            thickness: 1.0,
                            indent: 15.0,
                            endIndent: 15.0,
                            color: Colors.white),
                        SocialWidget(
                          placeholderText:
                              'LagosTelevision', //text visible to viewers
                          iconData: SocialIconsFlutter
                              .facebook, //use the respective social logo
                          iconColor: Colors.black, //(optional, default - grey)
                          link:
                              'https://web.facebook.com/LagosTelevision/', //provide the link
                          placeholderStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20), //placeholder text style
                        ),
                        const Divider(
                            height: 15,
                            thickness: 1.0,
                            indent: 15.0,
                            endIndent: 15.0,
                            color: Colors.white),
                        SocialWidget(
                          placeholderText:
                              'lagostelevision', //text visible to viewers
                          iconData: SocialIconsFlutter
                              .twitter, //use the respective social logo
                          iconColor: Colors.black, //(optional, default - grey)
                          link:
                              'https://twitter.com/lagostelevision', //provide the link
                          placeholderStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20), //placeholder text style
                        ),
                        const Divider(
                            height: 15,
                            thickness: 1.0,
                            indent: 15.0,
                            endIndent: 15.0,
                            color: Colors.white),
                        SocialWidget(
                          placeholderText:
                              '@LagosTelevision', //text visible to viewers
                          iconData: SocialIconsFlutter
                              .youtube, //use the respective social logo
                          iconColor: Colors.black, //(optional, default - grey)
                          link:
                              'https://www.youtube.com/@LagosTelevision', //provide the link
                          placeholderStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20), //placeholder text style
                        ),
                        const Divider(
                            height: 15,
                            thickness: 1.0,
                            indent: 15.0,
                            endIndent: 15.0,
                            color: Colors.white),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                "OFFICE:\nLagos Television Complex, Agidingbi Road, Ikeja, Lagos, Nigeria.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Align(
                                alignment: Alignment.topLeft,
                                child: Text('PHONE:',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))),
                            ElevatedButton(
                              onPressed: () async {
                                showAlertDialogCall(context);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(Colors.black)),
                              child: const Text('Call',
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Align(
                                alignment: Alignment.topLeft,
                                child: Text('EMAIL:',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))),
                            ElevatedButton(
                                onPressed: () {
                                  sendMail();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all(Colors.black)),
                                child: const Text('Send Mail',
                                    style: TextStyle(color: Colors.white))),
                          ],
                        ),
                        SocialWidget(
                          placeholderText:
                          'Website', //text visible to viewers
                          iconData: SocialIconsFlutter.youtube, //use the respective social logo
                          iconColor: Colors.black, //(optional, default - grey)
                          link:
                          'https://lagostelevision.com/', //provide the link
                          placeholderStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20), //placeholder text style
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("CANCEL", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      onPressed:  () {Navigator.of(context, rootNavigator: true).pop();},
    );
    Widget continueButton = TextButton(
      child: const Text("INVITE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      onPressed:  () {
        Navigator.of(context).pop();
        SocialShare.shareOptions('Use this Code to Register with Roro Reg');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: const Color(0x998558c1),
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 23.0),
      contentTextStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
      title: const Text("Roro Reg"),
      content: const Text("Invite a friend ..."),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }*/
}

_launchWhatSappUrl() async {
  String message = 'Lagos State Television';
  final Uri url = Uri.parse(
      'whatsapp://send?phone=2348033344915&text=${Uri.parse(message)}');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

/*Future<void> _launchWebsite() async {
  const String websiteLtv = 'https://lagostelevision.com/';
  final Uri url = Uri.parse(websiteLtv);  // Create a URI object

  // Check if the URL can be launched
  if (await canLaunchUrl(url)) {
    await launchUrl(url);  // Launch the URL
  } else {
    throw 'Could not launch $url';  // Error handling if URL can't be launched
  }
}*/

Future<void> sendMail() async {
  final Email email = Email(
    body: 'Email body',
    subject: 'Email subject',
    recipients: ['lagostelevisionltv@gmail.com'],
    cc: ['info@lagostelevision.com'],
    //bcc: ['bcc@example.com'],
    //attachmentPaths: ['/path/to/attachment.zip'],
    isHTML: false,
  );

  await FlutterEmailSender.send(email);
}

showAlertDialogCall(BuildContext context) {
  // set up the list options
  Widget optionOne = SimpleDialogOption(
    child:
        const Text('Advert Placement', style: TextStyle(color: Colors.white)),
    onPressed: () async {
      var phoneNumber = '+2348022829898';
      final Uri url = Uri(scheme: 'tel', path: phoneNumber);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {}

      canLaunchUrl(Uri(scheme: 'tel', path: phoneNumber));
      Navigator.of(context).pop();
    },
  );
  Widget optionTwo = SimpleDialogOption(
    child: const Text('News Hot line', style: TextStyle(color: Colors.white)),
    onPressed: () async {
      print('News Hot line');
      var phoneNumber = '+2348036962772';
      final Uri url = Uri(scheme: 'tel', path: phoneNumber);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {}

      canLaunchUrl(Uri(scheme: 'tel', path: phoneNumber));
      Navigator.of(context).pop();
    },
  );
  Widget optionThree = SimpleDialogOption(
    child: const Text('Content and Programming',
        style: TextStyle(color: Colors.white)),
    onPressed: () async {
      print('Content and Programming');
      var phoneNumber = '+2348033344915';
      final Uri url = Uri(scheme: 'tel', path: phoneNumber);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {}

      canLaunchUrl(Uri(scheme: 'tel', path: phoneNumber));
      Navigator.of(context).pop();
    },
  );
  Widget optionFour = SimpleDialogOption(
    child: const Text('Halls and Blue Roof Rentals',
        style: TextStyle(color: Colors.white)),
    onPressed: () async {
      print('Halls and Blue Roof Rentals');
      var phoneNumber = '+2348023285410';
      final Uri url = Uri(scheme: 'tel', path: phoneNumber);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {}

      canLaunchUrl(Uri(scheme: 'tel', path: phoneNumber));
      Navigator.of(context).pop();
    },
  );

  // set up the SimpleDialog
  SimpleDialog dialog = SimpleDialog(
    backgroundColor: const Color(0xffb61005),
    title: const Text('Call Lagos Television',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    children: <Widget>[optionOne, optionTwo, optionThree, optionFour],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}
