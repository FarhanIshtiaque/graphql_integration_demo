import 'package:flutter/material.dart';
import 'package:flutter_with_graphql/view_model/get_data_vm.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

bool isFetched = false;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'GraphQL Query',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Consumer<GetDataProvider>(builder: (context, data, child) {
        if (isFetched == false) {
          ///Fetch the data
          data.getData(true);

          Future.delayed(const Duration(seconds: 3), () => isFetched = true);
        }
        return RefreshIndicator(
          onRefresh: () {
            data.getData(false);
            return Future.delayed(const Duration(seconds: 3));
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(

                        child: const Text("Available Data"),
                      ),
                      if (data.getResponseData().isEmpty)
                        const Text('No Todo found'),
                      Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                              itemCount: data.getResponseData().length,
                              itemBuilder: (context, index) {
                                final response = data.getResponseData()[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                           
                                            color: Colors.grey, width: 1)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10,
                                        vertical: 10
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Mission Name : ${response['mission_name']}"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              "Launch Date : ${response['launch_date_local']}"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              "Rocket Name :${response['rocket']['rocket_name']}"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text("Launch Site : ${response['launch_site']['site_name_long']}"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }))
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    ));
  }
}

//
// Expanded(
// child: ListView(
// children: List.generate(data.getResponseData().length,
// (index) {
// final appollo = data.getResponseData()[index];
// return ListTile(
// contentPadding: const EdgeInsets.all(0),
// title: Text(appollo['mission_name'].toString()),
// subtitle: Text(appollo['launch_date_local'].toString()),
// leading: CircleAvatar(
// backgroundColor: Colors.grey,
// child: Text(appollo['rocket']['rocket_name'].toString()),
// ),
//
// );
// }),
// )),
