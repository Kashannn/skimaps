import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:skimaps/configs/api_keys.dart';
import 'package:skimaps/models/resort.dart';
import 'package:skimaps/models/resorts_site.dart';

ResortsList resortSecondList = ResortsList(listOfResorts: [
  Resort(
    slug: "",
    name: "val d'isere",
    country: "FR",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "val thorens ",
    country: "FR",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "Tignes",
    country: "FR",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "Zermatt",
    country: "CH",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "Les Trois Vallées",
    country: "FR",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "Zürs",
    country: "AT",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "Lech and Oberst Lech",
    country: "AT",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "Chamonix",
    country: "FR",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "Cortina D’Ampezzo",
    country: "ITL",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "St. Moritz",
    country: "CH",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "Cerro Catedral",
    country: "AR",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "Valle Nevado",
    country: "CL",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "Hakuba",
    country: "JP",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "Courmayeur ",
    country: "ITL",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "treble cone ",
    country: "NZ",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "Cardrona",
    country: "NZ",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
  Resort(
    slug: "",
    name: "Trysil ",
    country: "NO",
    region: "",
    location: LocationModel(latitude: 0, longitude: 0),
    url: "",
  ),
]);

Future<ResortSiteData> fetchResortData() async {
  ResortSiteData resortSite = ResortSiteData.fromJson({});
  var url = Uri.https('ski-resorts-and-conditions.p.rapidapi.com',
      '/v1/resort/whistler-blackcomb');

  Map<String, String> headers = {
    'X-RapidAPI-Key': ApiKeys.skiMapsAPIKey,
    'X-RapidAPI-Host': ApiKeys.skiMapsHost,
  };

  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    resortSite = ResortSiteData.fromJson(jsonDecode(response.body)['data']);
    return resortSite;
  } else {
    print('Error: ${response.reasonPhrase}');
    print('Error: ${response.statusCode}');
    return resortSite;
  }
}

Future<ResortsList> fetchResortsList() async {
  ResortsList resortsList = ResortsList(listOfResorts: []);

  var url = Uri.https('ski-resorts-and-conditions.p.rapidapi.com', 'v1/resort');

  Map<String, String> headers = {
    'content-type': 'application/octet-stream',
    'X-RapidAPI-Key': ApiKeys.skiMapsAPIKey,
    'X-RapidAPI-Host': ApiKeys.skiMapsHost,
  };

  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    print("reponse: ${response.body}");
    resortsList = ResortsList.fromJson(jsonDecode(response.body));
    resortsList.listOfResorts.addAll(resortSecondList.listOfResorts);
    return resortsList;
  } else {
    return resortsList;
  }
}
