import 'package:cached_network_image/cached_network_image.dart';
import 'package:cbn_tv_usa/app/module/auth/components/custom_popup.dart';
import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:cbn_tv_usa/app/module/home/screen/detail_post_screen.dart';
import 'package:cbn_tv_usa/app/module/home/shimmers/home_shimmer.dart';
import 'package:cbn_tv_usa/app/utils/app_colors.dart';
import 'package:cbn_tv_usa/app/utils/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Consumer<HomeController>(builder: (context, controller, child) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(14),
            child: controller.isBottomLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox.shrink()),
        body: controller.isLoading ?
        //     ? Center(
        //   child: Padding(
        //     padding:const EdgeInsets.symmetric(horizontal: 25, vertical: 220),
        //     child: Card(
        //       color: const Color(0XFFf1f2f3),
        //       shape: const RoundedRectangleBorder(
        //           borderRadius: BorderRadius.all(Radius.circular(20.0))),
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           SizedBox(
        //             height: 16,
        //           ),
        //           Center(
        //             child: Text("প্রসেসিং চলছে...",
        //                 style: const TextStyle(
        //                     fontSize: 18,
        //                     color: Colors.black,
        //                     fontWeight: FontWeight.w600),
        //                 textAlign: TextAlign.center,
        //                 overflow: TextOverflow.ellipsis),
        //           ),
        //           SizedBox(
        //             height: (5),
        //           ),
        //           CircularProgressIndicator(),
        //           SizedBox(
        //             height: (5),
        //           ),
        //           SizedBox(
        //             height: (1.0),
        //           ),
        //           Column(
        //             children: [
        //               Align(
        //                 alignment: Alignment.center,
        //                 child: SizedBox(
        //                   height: (70),
        //                   width: (70),
        //                   child: Image.asset("asset/images/logo.png"),
        //                 ),
        //       // child: Lottie.asset(AssetConfig.loadingAnimationAssetLottie),),
        //       // child: Image.asset(AssetConfig.loadingAnimationAssetGif)),
        //               ),
        //
        //       // SizedBox(height: getProportionateScreenHeight(15.0),),
        //       // Text(message, style: const TextStyle(fontSize: 16, color: ColorConfig.textColorPrimary, fontWeight: FontWeight.w600),
        //       //     textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
        //
        //               SizedBox(
        //                 height: (10.0),
        //               ),
        //               Text("অনুগ্রহ করে অপেক্ষা করুন, প্রসেসিং চলছে...",
        //                   style: const TextStyle(
        //                       fontSize: 14,
        //                       color: Colors.black,
        //                       fontWeight: FontWeight.w400),
        //                   textAlign: TextAlign.center,
        //                   overflow: TextOverflow.ellipsis),
        //
        //               SizedBox(
        //                 height: (15.0),
        //               ),
        //       // Padding(
        //       //   padding: const EdgeInsets.all(20.0),
        //       //   child: PrimaryButton(
        //       //     btnText: StringConfig.goToNext,
        //       //     onPressed: () {
        //       //       onOkTapFunction();
        //       //       Navigator.of(context).pop();
        //       //     },
        //       //   ),
        //       // ),
        //       // SizedBox(height: getProportionateScreenHeight(5.0),),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // )

          HomeShimmer()
            : Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    _showAppbar
                        ? Container(
                margin: EdgeInsets.all(5),
          height: height * 0.1,
          decoration: BoxDecoration(
              border: Border.all(color: primaryColor2),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Center(child: Text("Custom Ads Box")),
        )
                        : const SizedBox.shrink(),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (_,position){
                          // return position.isOdd ?Container(
                          //   margin: EdgeInsets.all(5),
                          //   height: height * 0.1,
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color: primaryColor2),
                          //     borderRadius: BorderRadius.circular(8)
                          //   ),
                          //   child: Center(child: Text("Custom Ads Box")),
                          // ):
                          return SizedBox();
                          // Card(
                          //   elevation: 0.7,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(15),
                          //   ),
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(15),
                          //     ),
                          //     margin: const EdgeInsets.all(7),
                          //     child: Column(
                          //       mainAxisAlignment:
                          //       MainAxisAlignment.start,
                          //       crossAxisAlignment:
                          //       CrossAxisAlignment.start,
                          //       children: [
                          //         Container(
                          //           height: 150,
                          //           decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(8),
                          //             color: Colors.teal
                          //           ),
                          //         ),
                          //         const SizedBox(height: 5),
                          //         Text("Ads Text",
                          //             style: const TextStyle(
                          //               fontWeight: FontWeight.w600,
                          //               fontSize: 16,
                          //             )),
                          //         const SizedBox(height: 5),
                          //         Text("Sponsord")
                          //       ],
                          //     ),
                          //   ),
                          // );
                        },
                              shrinkWrap: true,
                              controller: _scrollViewController,
                              physics: const BouncingScrollPhysics(),
                              itemCount: controller.postModelList.length,
                              itemBuilder: (_, index) {
                                if (index ==
                                    controller.postModelList.length - 3) {
                                  controller.getNextPage();
                                }
                                var data = controller.postModelList[index];
                                return InkWell(
                                  onTap: () {
                                    controller.updatePostIndex(index);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                const DetailPostScreen()));
                                  },
                                  child: Card(
                                    elevation: 0.7,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      margin: const EdgeInsets.all(7),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: CachedNetworkImage(
                                              height: height * 0.2,
                                              imageUrl: (data.yoast_head_json
                                                      ?.ogImage[0].url ??
                                                  ""),
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  const LoaddingShimmer(
                                                height: 150,
                                                weight: double.infinity,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(data.title?.rendered ?? "",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              )),
                                          const SizedBox(height: 5),
                                          Text(
                                              "প্রকাশিত : ${data.date?.day ?? 0} ${controller.enMonthtoBdMonth(data.date?.month ?? 1)} ${controller.enMonthtoBdMonth(data.date?.year ?? 1)}"),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<HomeController>(context, listen: false).getAllPosts(true);
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }
}
