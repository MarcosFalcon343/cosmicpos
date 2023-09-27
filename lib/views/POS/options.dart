import 'package:cosmicpos/helpers/image_helpers.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF0EFF4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: TextButton(
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageHelpers().svgImage(
                    url: 'assets/search.svg',
                    width: 20,
                    height: 20,
                    color: Colors.black),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  'Buscar en el carrito',
                  style: TextStyle(color: Colors.black.withOpacity(0.2)),
                )
              ],
            ),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          )),
          IconButton(
            icon: ImageHelpers().svgImage(
                url: 'assets/barcode.svg',
                width: 20,
                height: 20,
                color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: ImageHelpers().svgImage(
                url: 'assets/cash-register.svg',
                width: 20,
                height: 20,
                color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: ImageHelpers().svgImage(
                url: 'assets/bag-add-outline.svg',
                width: 20,
                height: 20,
                color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [];

  @override
  String get searchFieldLabel => 'Buscar en el carritoo';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var product in searchTerms) {
      if (product.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var product in searchTerms) {
      if (product.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
