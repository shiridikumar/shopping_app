import 'package:first/main.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String tex = "";
  List<String> filters = ["Shiridi", "ahsknaka", "achuth", "akshith", "ajay"];
  List<String> filteredNames = [];
  Widget searchlist = Container(
      constraints: BoxConstraints(minWidth: 0.0, maxWidth: 0.0),
      child: Text(""));
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
      decoration: BoxDecoration(color: Colors.blue),
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
            decorationColor: Colors.blue),
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

  Widget searchbar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 0.0),
            child: buildsearch(context),
          ),
          input_search()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('shopNow',
              style: TextStyle(
                  fontFamily: "headfont", fontWeight: FontWeight.bold)),
          // centerTitle: true,
          backgroundColor: Colors.blue[600]),
      body: Center(
        child: Column(
          children: <Widget>[searchbar(context), searchlist],
        ),
      ),
    );
  }
}
