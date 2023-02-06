import 'package:flutter/material.dart';

import '../Widgets/backgoundWidget.dart';
import '../Widgets/popUpMenuWidget.dart';
import '../Widgets/textfieldWidgets.dart';

class TermAndConditionsView extends StatefulWidget {
  const TermAndConditionsView({super.key});

  @override
  State<TermAndConditionsView> createState() => _TermAndConditionsViewState();
}

class _TermAndConditionsViewState extends State<TermAndConditionsView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundWidget().homeBackgroundWidget(context),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: PopUpMenu().popupMenu(context: context),
            toolbarHeight: 38,
            elevation: 0,
            backgroundColor: const Color(0xFFD9D9D9),
            title: const Text(
              "Terms and Services",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "Terms and Services",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                              "Want to create promotional posters, advertisement, offer announcements, cover photos for your shop, restaurant, office or social sites? If yes then this is the app for you. Create amazing posters with a poster maker. 5000+ poster templates. Free, quick & easy to use. No poster design skills are needed. No watermark.Digital Poster Maker - The Festival Graphics Design Services helps you with all types of small and large businesses for making a Digital Poster or photo with their brand logo. Best Editor for making a festival banner with your logo and text. In this app, you have to simply select any Digital Poster frame or photo template which you liked for making festival greetings and promotion for your businesses. Create promotional posters, advertisement, offer announcements, cover photos on the go with amazing backgrounds, texture, effects, fonts, sticker and get the attention you want.Using this business poster maker with name and icon you can simply upload your brand logo design and business card details like business name, business email, business phone, or mobile number then Digital Poster - Business Name & Image Poster Maker app will automatically add on the festival photo or poster and that’s it. Now you can save this Digital Poster into your android phone gallery. Our app is also useful for editing festival photos, banner makers for Holi, Navratri, Ganesh Chaturthi etc.We will add daily festivals, quotes, birthday, celebration, motivational, freedom fighters, god, business ethics, seven wonders images in our app so all businesses or companies can promote their business with the festival images on social media 365 days.Easily Making Festival Photo posters with All Festivals with your company brand logo and text.Our app is useful for making a Digital Poster for every business like Small/Large Industries, Gift/Bookstore, Grocery shop, Sports, Courier Service, Construction, Education, Online store, Caffe, Restaurant, Software Company, Import/Export, Tours & Travels, Jewellery Shop, Hardware, School, Colleges, Hospitals, business festival photo maker online.You don’t need any knowledge for using this app. anyone can use this app for making festivals with business photo poster makers in 2020.There is many festivals of India like Navratri, Holi, Happy Diwali, Republic Day, Makar Sankranti know as kite or Lohri, Uttarayan or kite, Pongal, Maha Shivratri, Eid-ul-Fitr, Easter, Janmashtami, Independence Day, Gandhi Jayanti, Ganesh Chaturthi, Durga Puja, Onam, Dassehra, Guru Nanak Jayanti, New year, Birthday, etc.Digital Poster Maker is also used for making online greeting card design poster for festivals. You can select a nice frame for making a photo with your company name and logo on the festival image.Make an eye catchy banner maker with festival photos and text.No need to find a designer for making a Digital Poster with your brand icon or logo.We are uploading everyday new templates and festival photos so you can choose the best template for your business.Many people use our app for branding their business by making festival banners.Follow the steps for how to use the app:1) Signup with your email, name, mobile number.2) Add your business details like business logo, name, mobile number, website, address.3) Choose Festival Photo4) Choose Frame (Note: you can add text, change text colour, change the font, change background).5) Done. Enjoy your Digital Poster is ready.Use this Digital Poster Maker app to grow your business across social media at a faster pace.Get a creative poster maker app for social media marketing at your fingertips.You can share your post to social media like WhatsApp, Facebook, Instagram, Twitter, etc from the Digital Post.Create amazing posters and get more likes and more customers. Try Now for Free!!!",
                              style: TextStyle(
                                  color: Color(0xFF000000), fontSize: 14)),
                        ),
                      ],
                    ),
                  ),
                  width: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      CustomBoxShadow(
                          color: Colors.black,
                          offset: Offset(5.0, 5.0),
                          blurRadius: 5.0,
                          blurStyle: BlurStyle.outer)
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
    ;
  }
}
