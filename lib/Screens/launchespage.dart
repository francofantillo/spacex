import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spacex/DataProvider/dataprovider.dart';
import 'package:provider/provider.dart';
import 'launchdetailscreen.dart';

class LaunchesPage extends StatelessWidget {
  const LaunchesPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Launch Control'),
      ),
      body: Center(
        child:
          MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => DataProvider()),
              ],
            child: const Refresher()
          )
      ),
    );
  }
}

class Refresher extends StatelessWidget {
  const Refresher({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: () => context.read<DataProvider>().fetchStartUp(), child: const LaunchList());
  }
}

class LaunchList extends StatefulWidget {
  const LaunchList({super.key});

  @override
  State<LaunchList> createState() => LaunchListState();
}

class LaunchListState extends State<LaunchList> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DataProvider>(context, listen: false).fetchStartUp();
    });
  }

  @override
  Widget build(BuildContext context) {

    var launches = context.watch<DataProvider>().launches;
    if (launches.isNotEmpty) {
        return ListView.builder(
          itemCount: launches.length,
          itemBuilder: (itemContext, index) {
            final launch = launches[index];

            DateTime parsedDate = DateTime.parse(launch.date_local!);
            String date = DateFormat("MM-dd-yyyy").format(parsedDate);
            String time = DateFormat("HH:mm").format(parsedDate);

            return
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    surfaceTintColor: Colors.white,
                    elevation: 4,
                    shadowColor: Colors.black,
                    child: ListTile(
                      onTap: () => {
                      Navigator.push(
                        context,
                          MaterialPageRoute(builder: (buildContext) => LaunchDetailScreen(
                              launch: launch,
                              rocket: context.read<DataProvider>().findRocket(launch),
                              launchpad: context.watch<DataProvider>().findLaunchpad(launch)))
                        ),
                      },
                      leading: const Icon(Icons.rocket),
                      title: Text(
                        launch.name!,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent,
                        ),
                      ),
                      subtitle: Text(
                        'Date: $date, Time: $time',
                      ),
                      trailing: const Icon(Icons.arrow_forward),
                    ),
                  ),
              );
          },
        );
    }
    else {
      return const CircularProgressIndicator();
    }
  }
}