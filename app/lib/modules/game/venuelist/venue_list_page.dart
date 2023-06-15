import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/game/venuelist/venue_list_page_controller.dart';
import 'package:ob_package/routes/app_pages.dart';
import 'package:ob_package/widget/enter_game_button.dart';

class VenueListPage extends StatefulWidget {
  const VenueListPage({super.key});

  @override
  State<VenueListPage> createState() => _VenueListPageState();
}

class _VenueListPageState extends State<VenueListPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VenueListPageController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text(controller.title.value),
                backgroundColor: Color(0xff1E2024),
                centerTitle: true,
                leading: ObBackButton(),
              ),
              body: _gameList(controller),
            ));
  }

  Widget _gameList(VenueListPageController controller) {
    return Obx(
      () => Container(
        color: Color(0xff24262B),
        child: ListView(
            children: controller.venueTypeCodeAndVenues.isNotEmpty
                ? controller.venueTypeCodeAndVenues[0].venueList
                    .map((element) => _game(element))
                    .toList()
                : []),
      ),
    );
  }

  Widget _game(Venue venue) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          EnterGameButton.joinGame(
            venue.status == 2,
            venue.venueCode,
            venue.venueType,
            null,
            venue.venueName,
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ObImage.network(
              venue.venueIconUrlApp,
              fit: BoxFit.fitWidth,
              height: 150,
              width: double.maxFinite,
            ),
            Container(
              color: Color(0xff1E2024),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      venue.venueName,
                      overflow: TextOverflow.clip,
                      style: TextStyle(color: Color(0xff98A7B5), fontSize: 14),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              Assets.images.btnbg.path,
                              package: BaseX.pkg,
                            ),
                            fit: BoxFit.fill)),
                    alignment: Alignment.center,
                    width: 150,
                    height: 35,
                    child: Text(
                      "Play Now",
                      overflow: TextOverflow.clip,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
