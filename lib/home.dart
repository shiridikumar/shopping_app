import 'package:first/main.dart';
import "package:carousel_slider/carousel_slider.dart";
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String tex = "";
  int currpos = 0;
  List<String> filters = ["Shiridi", "ahsknaka", "achuth", "akshith", "ajay"];
  List<String> deals = [
    "t1.jpg",
    "t2.jpg",
    "t3.jpg",
    "t4.jpg",
    "t5.jpg",
  ];
  List<String> filteredNames = [];
  List<String> cards = ["home.jpeg", "fashion.jpg", "laptops.jpg"];
  Widget searchlist = Container(
    constraints: BoxConstraints(minWidth: 0.0, maxWidth: 0.0),
  );
  void check_filter() {
    List<String> filtered = [];
    for (int i = 0; i < filters.length; i++) {
      if (filters[i].toLowerCase().contains(tex)) {
        filtered.add(filters[i]);
      }
    }
    print(filtered);
    setState(() {
      this.searchlist = ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: filtered == null ? 0 : filtered.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(filtered[index]),
            onTap: () => print("hello"),
          );
        },
      );
    });
  }

  void func() {
    if (this.searchicon.icon == Icons.search) {
      check_filter();
      setState(() {
        this.searchicon = Icon(Icons.close, color: Colors.white);
      });
    } else {
      setState(() {
        print("noooo");
        FocusScope.of(context).unfocus();
        _controller.clear();
        this.searchlist = Container(
          constraints: BoxConstraints(minWidth: 0.0, maxWidth: 0.0),
        );
        _controller.clear();
        this.searchicon = Icon(Icons.search, color: Colors.white);
      });
    }
  }

  // Widget title = Text("Search",
  //     style: TextStyle(
  //         color: Colors.white,
  //         decorationStyle: TextDecorationStyle.dotted,
  //         decorationColor: Colors.blue));
  TextEditingController _controller = TextEditingController();
  Widget input_search() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[600]),
      constraints: BoxConstraints(minWidth: 200.0, maxWidth: 300.0),
      // child: Text("another element")
      child: TextFormField(
        controller: _controller,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white)),
        onChanged: (text) {
          setState(() {
            tex = text;
            check_filter();
          });
        },
        onTap: func,
        onEditingComplete: func,
        style: TextStyle(
            color: Colors.white,
            decorationStyle: TextDecorationStyle.dotted,
            decorationColor: Colors.grey[600]),
      ),
    );
  }

  // Icon orig = Icon(Icons.search, color: Colors.white);

  Icon searchicon = Icon(Icons.search, color: Colors.white);

  // Widget _buildBar(BuildContext context) {
  //   return new AppBar(
  //     centerTitle: true,
  //     title: _appBarTitle,
  //     leading: new IconButton(
  //       icon: Icon(Icons.search),
  //       onPressed: func,
  //     ),
  //   );
  // }
  Widget buildsearch(BuildContext context) {
    return IconButton(
        onPressed: () {
          if (this.searchicon.icon == Icons.close) {
            FocusScope.of(context).unfocus();
            _controller.clear();
            setState(() {
              this.searchicon = Icon(Icons.search, color: Colors.white);
              this.searchlist = Container(
                  constraints: BoxConstraints(minWidth: 0.0, maxWidth: 0.0));
              this.tex = "";
            });
          }
        },
        icon: searchicon);
  }

  // Widget title() {
  //   return TextButton(
  //     onPressed: func,
  //     child: Text("Search", style: TextStyle(color: Colors.white)),
  //   );
  // }

//********* category bar ******************************************************************************************* */
  Widget categorybar(BuildContext context) {
    List<String> categories = [
      "Electronics",
      "Fashion",
      "Laptops",
      "Mobiles",
      "Books",
      "Home",
    ];
    List<String> urls = [
      "electronics.jpg",
      "fashion.jpg",
      "laptops.jpg",
      "mobiles.jpg",
      "books.jpeg",
      "home.jpeg"
    ];
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: 5.0),
      // constraints: BoxConstraints(maxWidth: double.infinity, minWidth: 300.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories == null ? 0 : categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 3.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                      radius: 40.0,
                      child: ClipOval(
                          child: Image.asset("assets/${urls[index]}",
                              width: 140.0, height: 130.0, fit: BoxFit.cover))),
                  Text(
                    categories[index],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "mainfont",
                        fontSize: 12.0),
                  )
                ],
              ));
        },
      ),
    );
  }

// ************ searc bar main ***********************************************************************************
  Widget searchbar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[600]),
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: buildsearch(context),
          ),
          input_search()
        ],
      ),
    );
  }

  Widget getcarousel(String i) {
    return Container(child: Image.asset("assets/" + i));
  }

// New offers*********************************************************************************************************************************

  Widget newoffers(BuildContext context) {
    // List<Widget> card_list=this.cards.map((int,index)=>{return getcarousel(ndex)}).toList();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "New offers",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                      fontFamily: "mainfont"),
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            CarouselSlider.builder(
                itemCount: this.cards.length,
                options: CarouselOptions(
                    // height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 12 / 8,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currpos = index;
                      });
                    }),
                itemBuilder: (context, index, i) {
                  return getcarousel(this.cards[index]);
                }),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: this.cards.map((item) {
                  int index = this.cards.indexOf(item);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currpos == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList())
          ],
        ),
      ),
    );
  }

  Widget getcard(String item) {
    return Container(
      constraints: BoxConstraints(maxWidth: double.infinity),
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.all(0.0),
      child: Card(
        elevation: 0.0,
        borderOnForeground: true,
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/trending/" + item,
              height: 200.0,
            ),
            Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: Colors.red[900]),
                child: Text("Up to 40% off",
                    style: TextStyle(color: Colors.white)))
          ],
        ),
      ),
    );
  }

  Widget trending(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text("Today's deals",
                style: TextStyle(fontSize: 20.0, fontFamily: "mainfont")),
            Container(
              decoration: BoxDecoration(color: Colors.grey[100]),
              // padding: EdgeInsets.all(10.0),
              child: CustomScrollView(
                primary: false,
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(2),
                    sliver: SliverGrid.count(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.5,
                        children: this.deals.map((item) {
                          return getcard(item);
                        }).toList()),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

//************ Main **************************************************************************************************** */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          title: Text('shopNow',
              style: TextStyle(
                  fontFamily: "headfont", fontWeight: FontWeight.bold)),
          // centerTitle: true,
          backgroundColor: Colors.grey[700]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            searchbar(context),
            searchlist,
            categorybar(context),
            newoffers(context),
            trending(context)
          ],
        ),
      ),
    );
  }
}
