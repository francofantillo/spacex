import 'package:flutter/material.dart';
import 'package:spacex/Models/launchpads.dart';
import 'package:spacex/Models/rocketlaunch.dart';
import 'package:spacex/Models/rockets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class LaunchDetailScreen extends StatelessWidget {

  const LaunchDetailScreen({super.key, required this.launch, required this.rocket, required this.launchpad});
  final RocketLaunch launch;
  final Rocket rocket;
  final LaunchPad launchpad;

  @override
  Widget build(BuildContext context) {

    DateTime parsedDate = DateTime.parse(launch.date_local!);
    String date = DateFormat("MM-dd-yyyy").format(parsedDate);
    String time = DateFormat("HH:mm").format(parsedDate);
    String description = launchpad.details;
    String? wiki = launch.links?.wikipedia;
    String? patch = launch.links?.patch?.large;

    return DetailScreen(launchName: launch.name!,
      date: date,
      rocketName: rocket.name!,
      launchpadName: launchpad.name,
      time: time,
      patchImageUrl: patch,
      detailDescription: description,
      wikipediaLink: wiki);
  }
}

class DetailScreen extends StatelessWidget {
  final String launchName;
  final String date;
  final String time;
  final String? patchImageUrl;
  final String detailDescription;
  final String rocketName;
  final String launchpadName;
  final String? wikipediaLink;

  const DetailScreen({
    super.key,
    required this.launchName,
    required this.date,
    required this.time,
    required this.patchImageUrl,
    required this.detailDescription,
    required this.rocketName,
    required this.launchpadName,
    required this.wikipediaLink,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          launchName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:

      Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        child:
            // Left align text
            Card(
              elevation: 4,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child:

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            WikiButton(wikiLink: wikipediaLink),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            if (patchImageUrl != null) ...[
                              NetworkImage(patchImageUrl: patchImageUrl!),
                            ] else ...[
                              const PlaceHolderImage(),
                            ]
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      LaunchDetails(rocketName: rocketName,
                          date: date,
                          time: time,
                          launchpadName: launchpadName,
                          detailDescription: detailDescription)
                    ],
                  ),
                ),
              ),
            ),
        );
    }
}

class WikiButton extends StatelessWidget {

  final String? wikiLink;

  const WikiButton({super.key, required this.wikiLink});

  Future<void> _launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 1, minHeight: 1, maxHeight: 50),
      child: IconButton(
          icon: Container(

            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                  spreadRadius: 4,
                )
              ],
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/wikipedia.jpg'),

              ),
            ),
          ),
          iconSize: 50,
          onPressed: () {
            if (wikiLink != null) {

              final uri = Uri.parse(wikiLink!);
              _launchInBrowserView(uri);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("There is no wikipedia article for this launch."),
                ),
              );
            }
          }
      ),
    );
  }
}

class NetworkImage extends StatelessWidget {

  const NetworkImage({super.key, required this.patchImageUrl});

  final String patchImageUrl;

  @override
  Widget build(BuildContext context) {
    return  FittedBox(
      fit: BoxFit.fitWidth,
      alignment: Alignment.center,
      child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 1, minHeight: 1, maxHeight: 200),
          child: ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(120), // Image radius
              child: Image.network(patchImageUrl,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress
                            .expectedTotalBytes != null
                            ? loadingProgress
                            .cumulativeBytesLoaded /
                            loadingProgress
                                .expectedTotalBytes!
                            : null,
                      ),
                    );
                  }
              ),
            ),
          )
      ),
    );
  }
}

class PlaceHolderImage extends StatelessWidget {

  const PlaceHolderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  FittedBox(
      fit: BoxFit.fitWidth,
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 1, minHeight: 1, maxHeight: 250),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle, // Set the background color here
          ),
          child: const CircleAvatar(
            radius: 100, // Adjust the radius as needed
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/rocket.png'), // Set the image here
          ),
        )
      ),
    );
  }
}

class LaunchDetails extends StatelessWidget {
  const LaunchDetails({super.key,
    required this.rocketName,
    required this.date,
    required this.time,
    required this.launchpadName,
    required this.detailDescription});

  final String rocketName;
  final String date;
  final String time;
  final String launchpadName;
  final String detailDescription;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8),
          Text(
            'Rocket Name: $rocketName',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            'Date: $date',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Local Time: $time',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Launchpad Name: $launchpadName',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
            Expanded(child:
              SingleChildScrollView(
                child: Text(
                  detailDescription,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }
}