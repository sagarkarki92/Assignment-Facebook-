import 'dart:math';

import 'package:assignmentApp/model/post.dart';

class DummyPost {
  final String id;
  final String status;
  final List<String> images;

  DummyPost({this.id, this.status, this.images});
}

// final List<String> dummyImages = [
//   'https://cdn.mos.cms.futurecdn.net/VSy6kJDNq2pSXsCzb6cvYF.jpg',
//   'https://www.telegraph.co.uk/content/dam/football/2020/01/16/TELEMMGLPICT000185431531_trans%2B%2BnjcgOEmjComRJj7yhDPboTG8XMH-8JMVI20-FMdq02s.jpeg',
//   'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2013/02/06/6d/top-10-vacation-spots-cancun.rend.hgtvcom.616.462.suffix/1491591583276.jpeg'
//       'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
//   'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg',
//   'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
//   'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
//   'https://travel.home.sndimg.com/content/dam/images/travel/stock/2018/4/10/iStock-672425798.-beach_chairs.jpg.rend.hgtvcom.1280.853.suffix/1523383408931.jpeg',
//   'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSLnEhmTir3tuRa8bpaYaOtf5RG31n-ChQIkw&usqp=CAU',
//   'https://s3.india.com/wp-content/uploads/2020/07/Image-4-86.jpg',
// ];

final firstTenPosts = [
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://www.telegraph.co.uk/content/dam/football/2020/01/16/TELEMMGLPICT000185431531_trans%2B%2BnjcgOEmjComRJj7yhDPboTG8XMH-8JMVI20-FMdq02s.jpeg',
      'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg'
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "",
    imageUrls: [
      'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSLnEhmTir3tuRa8bpaYaOtf5RG31n-ChQIkw&usqp=CAU',
      'https://travel.home.sndimg.com/content/dam/images/travel/stock/2018/4/10/iStock-672425798.-beach_chairs.jpg.rend.hgtvcom.1280.853.suffix/1523383408931.jpeg',
      'https://s3.india.com/wp-content/uploads/2020/07/Image-4-86.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2013/02/06/6d/top-10-vacation-spots-cancun.rend.hgtvcom.616.462.suffix/1491591583276.jpeg'
          'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg',
      'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSLnEhmTir3tuRa8bpaYaOtf5RG31n-ChQIkw&usqp=CAU',
      'https://travel.home.sndimg.com/content/dam/images/travel/stock/2018/4/10/iStock-672425798.-beach_chairs.jpg.rend.hgtvcom.1280.853.suffix/1523383408931.jpeg',
      'https://s3.india.com/wp-content/uploads/2020/07/Image-4-86.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://cdn.mos.cms.futurecdn.net/VSy6kJDNq2pSXsCzb6cvYF.jpg',
      'https://www.telegraph.co.uk/content/dam/football/2020/01/16/TELEMMGLPICT000185431531_trans%2B%2BnjcgOEmjComRJj7yhDPboTG8XMH-8JMVI20-FMdq02s.jpeg',
      'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg',
      'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2013/02/06/6d/top-10-vacation-spots-cancun.rend.hgtvcom.616.462.suffix/1491591583276.jpeg'
          'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSLnEhmTir3tuRa8bpaYaOtf5RG31n-ChQIkw&usqp=CAU',
      'https://travel.home.sndimg.com/content/dam/images/travel/stock/2018/4/10/iStock-672425798.-beach_chairs.jpg.rend.hgtvcom.1280.853.suffix/1523383408931.jpeg',
      'https://s3.india.com/wp-content/uploads/2020/07/Image-4-86.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg',
      'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2013/02/06/6d/top-10-vacation-spots-cancun.rend.hgtvcom.616.462.suffix/1491591583276.jpeg'
          'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
];
final dummyPosts = [
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2013/02/06/6d/top-10-vacation-spots-cancun.rend.hgtvcom.616.462.suffix/1491591583276.jpeg'
          'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2013/02/06/6d/top-10-vacation-spots-cancun.rend.hgtvcom.616.462.suffix/1491591583276.jpeg'
          'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg',
      'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSLnEhmTir3tuRa8bpaYaOtf5RG31n-ChQIkw&usqp=CAU',
      'https://travel.home.sndimg.com/content/dam/images/travel/stock/2018/4/10/iStock-672425798.-beach_chairs.jpg.rend.hgtvcom.1280.853.suffix/1523383408931.jpeg',
      'https://s3.india.com/wp-content/uploads/2020/07/Image-4-86.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSLnEhmTir3tuRa8bpaYaOtf5RG31n-ChQIkw&usqp=CAU',
      'https://travel.home.sndimg.com/content/dam/images/travel/stock/2018/4/10/iStock-672425798.-beach_chairs.jpg.rend.hgtvcom.1280.853.suffix/1523383408931.jpeg',
      'https://s3.india.com/wp-content/uploads/2020/07/Image-4-86.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSLnEhmTir3tuRa8bpaYaOtf5RG31n-ChQIkw&usqp=CAU',
      'https://travel.home.sndimg.com/content/dam/images/travel/stock/2018/4/10/iStock-672425798.-beach_chairs.jpg.rend.hgtvcom.1280.853.suffix/1523383408931.jpeg',
      'https://s3.india.com/wp-content/uploads/2020/07/Image-4-86.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2013/02/06/6d/top-10-vacation-spots-cancun.rend.hgtvcom.616.462.suffix/1491591583276.jpeg'
          'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg',
      'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2013/02/06/6d/top-10-vacation-spots-cancun.rend.hgtvcom.616.462.suffix/1491591583276.jpeg'
          'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg',
      'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2013/02/06/6d/top-10-vacation-spots-cancun.rend.hgtvcom.616.462.suffix/1491591583276.jpeg'
          'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg',
      'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg'
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg'
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2013/02/06/6d/top-10-vacation-spots-cancun.rend.hgtvcom.616.462.suffix/1491591583276.jpeg'
          'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg',
      'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg'
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: ['https://cdn.mos.cms.futurecdn.net/VSy6kJDNq2pSXsCzb6cvYF.jpg'],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2013/02/06/6d/top-10-vacation-spots-cancun.rend.hgtvcom.616.462.suffix/1491591583276.jpeg'
          'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: ['https://cdn.mos.cms.futurecdn.net/VSy6kJDNq2pSXsCzb6cvYF.jpg'],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2013/02/06/6d/top-10-vacation-spots-cancun.rend.hgtvcom.616.462.suffix/1491591583276.jpeg'
          'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg',
      'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg'
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg'
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: ['https://cdn.mos.cms.futurecdn.net/VSy6kJDNq2pSXsCzb6cvYF.jpg'],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg',
      'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg',
      'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
    ],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [],
  ),
  Post(
    id: Random().nextInt(1000).toString(),
    status: "Sunny day very nice",
    imageUrls: [
      'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2013/02/06/6d/top-10-vacation-spots-cancun.rend.hgtvcom.616.462.suffix/1491591583276.jpeg'
          'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg',
      'https://miro.medium.com/max/1000/1*qyAOepULOa_kVehhEIySKA.jpeg',
      'https://s3.india.com/wp-content/uploads/2019/08/Capture-22.jpg',
    ],
  ),
];
