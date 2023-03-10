import 'package:dposter/Models/categoryFrameModel.dart';
import 'package:dposter/UI/frameSelectionView.dart';
import 'package:dposter/UI/myBusinessView.dart';
import 'package:dposter/UI/myPostView.dart';
import 'package:dposter/UI/posterPreview.dart';
import 'package:dposter/UI/privacyPolicyView.dart';
import 'package:dposter/UI/rateUsView.dart';
import 'package:dposter/UI/shareUsView.dart';
import 'package:dposter/UI/term&conditionView.dart';
import 'package:dposter/services/homepageServices.dart';
import 'package:flutter/material.dart';

import '../Models/categoryModel.dart';
import '../Models/customCategoryModel.dart';
import '../Widgets/backgoundWidget.dart';
import '../Widgets/popUpMenuWidget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  List<CategoryModel>? categories;
  List<CustomCategoryModel>? customCategories;
  List<CategoryFramesModel> categoryFrames = [];
  getCategories() async {
    categories = await HomepageServices().getCategories();
    for (int i = 0; i < categories!.length; i++) {
      // getCategoriesFrames(id: categories![i].id!);
      print("$categoryFrames adaf");
    }
    setState(() {});
  }

  getCustomCategories() async {
    customCategories = await HomepageServices().getCustomCategories();
    setState(() {});
  }

  // getCategoriesFrames({required int id}) async {
  //   CategoryFramesModel res =
  //       await HomepageServices().getCategoryFrames(categoryNumber: id);
  //   categoryFrames.add(res);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomCategories();
    getCategories();
  }

  final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return categories == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Stack(
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
                    "Home",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                body: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        height: 140,
                        width: 100,
                        decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            border: Border.all(
                              color: const Color(0xFFD9D9D9),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // scrollDirection: Axis.horizontal,
                        children: [
                          for (int i = 0; i < 8; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 8),
                              child: Container(
                                height: 32,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFD9D9D9),
                                    border: Border.all(
                                      color: const Color(0xFFD9D9D9),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12))),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: const Text(
                        "Upcoming Festival",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // scrollDirection: Axis.horizontal,
                        children: [
                          for (int i = 0; i < 2; i++)
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PosterPreview(),
                                    ));
                              },
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            FrameSelectionView(),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 8),
                                  child: Container(
                                    height: 110,
                                    width: 110,
                                    child: Image.network(
                                        "https://img.freepik.com/free-vector/creative-diwali-festival-poster-design-background_1017-15917.jpg?w=740&t=st=1676607258~exp=1676607858~hmac=976c8522d984352709b67a017f6818a2bd38729e4b795358977088831e2d4abf"),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFD9D9D9),
                                        border: Border.all(
                                          color: const Color(0xFFD9D9D9),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12))),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    for (int i = 0; i < customCategories!.length; i++)
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                Text(
                                  "${customCategories![i].title}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900),
                                ),
                                Spacer(),
                                const Text(
                                  "More >",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              // scrollDirection: Axis.horizontal,
                              children: [
                                for (int i = 0;
                                    i < customCategories!.length;
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    child: Container(
                                      height: 130,
                                      width: 110,
                                      child: Image.network(
                                          "${customCategories![i].image}"),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFD9D9D9),
                                          border: Border.all(
                                            color: const Color(0xFFD9D9D9),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(12))),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    for (int i = 0; i < categories!.length; i++)
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                Text(
                                  "${categories![i].title}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900),
                                ),
                                Spacer(),
                                const Text(
                                  "More >",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              // scrollDirection: Axis.horizontal,
                              children: [
                                for (int i = 0; i < 8; i++)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    child: Container(
                                      height: 130,
                                      width: 110,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFD9D9D9),
                                          border: Border.all(
                                            color: const Color(0xFFD9D9D9),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(12))),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          );
  }
}
