import 'package:flutter/material.dart';
import 'package:hacker/provider/product.dart';
import 'package:hacker/provider/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    alignment: Alignment.topLeft,
                    child: Card(
                      child: IconButton(
                        color: const Color.fromARGB(255, 135, 128, 128),
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 232,
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    alignment: Alignment.topLeft,
                    child: Card(
                      child: IconButton(
                        color: const Color.fromARGB(255, 135, 128, 128),
                        icon: const Icon(Icons.search_outlined),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Hi-Fi Shop & Service",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Audio shop on Rustaveli Ave 57",
                        style: TextStyle(
                          color: Color.fromARGB(255, 190, 190, 190),
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "This shop offers both product and services",
                        style: TextStyle(
                          color: Color.fromARGB(255, 190, 190, 190),
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<ProviderName>(builder: (context, provider, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Products",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          provider.products.length.toString(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 190, 190, 190),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 185,
                        ),
                        const Text(
                          "Show all",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.products.length,
                          itemBuilder: (context, index) {
                            final pro = provider.products[index];
                            return Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 229, 229, 229),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                        "assets/images/headphone.png",
                                        width: 140,
                                        height: 110,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        pro.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 28,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            provider.deleteProduct(index);
                                          },
                                          icon: const Icon(
                                            Icons.delete_outline_rounded,
                                            color: Color.fromARGB(
                                                192, 244, 67, 54),
                                          ))
                                    ],
                                  ),
                                  Text(
                                    '\$ ${pro.price.toString()}',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 189, 189, 189),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Accessories",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          provider.accessories.length.toString(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 190, 190, 190),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 160,
                        ),
                        const Text(
                          "Show all",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 235,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.accessories.length,
                          itemBuilder: (context, index) {
                            final acc = provider.accessories[index];
                            return Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 229, 229, 229),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                        "assets/images/earphone.png",
                                        width: 140,
                                        height: 110,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        acc.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 28,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            provider.deleteAccessory(index);
                                          },
                                          icon: const Icon(
                                            Icons.delete_outline_rounded,
                                            color: Color.fromARGB(
                                                192, 244, 67, 54),
                                          ))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: acc.isAvailable
                                        ? const Text(
                                            "Available",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 14, 239, 126)),
                                          )
                                        : const Text(
                                            "Unavailable",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 255, 17, 0)),
                                          ),
                                  ),
                                  Text(
                                    '\$ ${acc.price.toString()}',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 189, 189, 189),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPopUpForm(context);
          // providerInstance.addProduct(Product("", 120, "image"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showPopUpForm(BuildContext context) {
    TextEditingController pName = TextEditingController();
    TextEditingController price = TextEditingController();

    final providerInstance = Provider.of<ProviderName>(context, listen: false);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Products'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: pName,
                  decoration:
                      const InputDecoration(labelText: 'Enter Product Name'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: price,
                  decoration: const InputDecoration(labelText: 'Enter Price'),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (pName.text.toString() == '' ||
                    price.text.toString() == '') {
                  print("Fill All Field");
                } else {
                  providerInstance.addProduct(Product(pName.text.toString(),
                      double.parse(price.text), "assets/images/headphone.png"));
                  pName.clear();
                  price.clear();
                }
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                pName.clear();
                price.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
