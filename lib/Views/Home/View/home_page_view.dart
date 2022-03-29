import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shopism/Core/Extensions/context_extensions.dart';
import 'package:shopism/Views/Cart/View/cart_page_view.dart';
import 'package:shopism/Widgets/Home/PopularProductCard.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildLocationRow(context),
            buildSearchBar(context),
            // Selected indexler gelecek,
            buildCategoriesRow(),
            buildCarouselPageView(),
            buildPopularProductsRow(context),
            buildPopularProducts(context),
            SizedBox(
              height: context.dynamicHeight(0.1),
            ),
          ],
        ),
      ),
    );
  }

  Container buildPopularProducts(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.32),
      margin: context.paddingAllLow,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) =>
            Padding(padding: context.paddingOnlyLeftLow),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return PopularProductCard();
        },
      ),
    );
  }

  Padding buildPopularProductsRow(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: context.paddingOnlyBottomVeryLow,
                child: Text(
                  "Popular Products",
                  style: context.theme.textTheme.headline6,
                ),
              ),
              Text(
                "Fresh product from our garden",
                style: context.theme.textTheme.subtitle1!
                    .copyWith(color: Colors.grey),
              ),
            ],
          ),
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    "See All",
                    style: context.theme.textTheme.subtitle2,
                  ),
                  Container(
                    padding: context.paddingAllVeryLow,
                    margin: context.paddingOnlyLeftLow,
                    decoration: BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    child: Icon(
                      MaterialCommunityIcons.arrow_right,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  SizedBox buildCarouselPageView() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.paddingAllLow,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              width: 200,
            ),
          );
        },
      ),
    );
  }

  Widget buildCategoriesRow() {
    return Container(
      height: context.dynamicHeight(0.16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            child: Padding(
              padding: context.paddingAllLow,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black)],
                        border: Border.all(color: Colors.white, width: 4),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-3foodgroups_fruits_detailfeature.jpg?sfvrsn=64942d53_4"),
                      ),
                    ),
                    Padding(
                      padding: context.paddingOnlyTopLow,
                      child: Text("Fruits"),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding buildSearchBar(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow,
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Feather.search),
            hintText: 'Try "Tomatos"',
            fillColor: Color(0xffF1F4FA),
            filled: true,
            contentPadding: context.paddingVerticalLow,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(48),
                borderSide: BorderSide(width: 0, style: BorderStyle.none))),
      ),
    );
  }

  Widget buildLocationRow(BuildContext context) {
    return Padding(
      padding: context.paddingOnlyTopLow,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: context.paddingAllLow,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Delivery adress . Now",
                      style: context.theme.textTheme.subtitle1!
                          .copyWith(color: Colors.grey.shade700)),
                  Padding(
                    padding: context.paddingOnlyTopVeryLow,
                    child: Text(
                      "Purwokerto, Jawa Tengah",
                      style: context.theme.textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => CartPageView()));
            },
            icon: Icon(
              AntDesign.shoppingcart,
              color: Colors.grey.shade600,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Ionicons.notifications_outline,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
