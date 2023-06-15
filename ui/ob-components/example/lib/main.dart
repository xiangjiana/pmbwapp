import 'package:example/story/agent_table_story.dart';
import 'package:example/story/animation.dart';
import 'package:example/story/appbar_story.dart';
import 'package:example/story/avatar_story.dart';
import 'package:example/story/back_top_story.dart';
import 'package:example/story/badge_story.dart';
import 'package:example/story/bottom_sheet_story.dart';
import 'package:example/story/button_story.dart';
import 'package:example/story/container_story.dart';
import 'package:example/story/date_range_picker_story.dart';
import 'package:example/story/dialog_story.dart';
import 'package:example/story/marquee_story.dart';
import 'package:example/story/ob_update_dialog_story.dart';
import 'package:example/story/picker_story.dart';
import 'package:example/story/radial_gauge_story.dart';
import 'package:example/story/radio_story.dart';
import 'package:example/story/statistic_story.dart';
import 'package:example/story/switch_story.dart';
import 'package:example/story/tab_story.dart';
import 'package:example/story/text_story.dart';
import 'package:example/story/theme_story.dart';
import 'package:example/story/toast_story.dart';
import 'package:example/story/uploader_story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' hide SizeExtension;
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(StoryBoard());
}

///
class SampleApp extends StatelessWidget {
  ///
  const SampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      data: ObThemeData(
        TypographyTheme(
          title: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          subtitle1: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          subtitle2: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          body1: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          body2: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          caption: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          overline: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        ObColorScheme(
          primaryColor: orange,
          secondaryColor: corn,
          windowBackgroundColor: mirage,
          primaryGradientColor: const <Color>[coral, orange],
          secondaryGradientColor: const <Color>[rioGrande, corn],
          primaryTextColor: white,
          secondaryTextColor: white60,
          tertiaryTextColor: white30,
          edgeDividerColor: white10,
          dividerColor: white6,
          cardBackgroundColor: white4,
          gapColor: bunker,
        ),
      ),
      child: Builder(
        builder: (BuildContext ctx) => MaterialApp(
          theme: Theme.of(ctx),
        ),
      ),
    );
  }
}

///
class StoryBoard extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext ctx, Widget? widget) => ObTheme(
        data: ObThemeData(
          TypographyTheme(
            title: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            subtitle1: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            subtitle2: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            body1: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            body2: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            caption: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            overline: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          ObColorScheme(
            primaryColor: orange,
            secondaryColor: corn,
            windowBackgroundColor: mirage,
            primaryGradientColor: const <Color>[coral, orange],
            secondaryGradientColor: const <Color>[rioGrande, corn],
            primaryTextColor: white,
            secondaryTextColor: white60,
            tertiaryTextColor: white30,
            edgeDividerColor: white10,
            dividerColor: white6,
            cardBackgroundColor: white4,
            gapColor: bunker,
          ),
        ),
        child: Builder(builder: (BuildContext ctx) {
          return Storybook(
            navigatorObservers: <NavigatorObserver>[
              ToastObserver(),
              // pieChartRouteObserver,
            ],
            theme: Theme.of(ctx),
            builder: ToastManager.init(),
            children: <Story>[
              animationStory,
              badgeStory,
              backTopStory,
              avatarStory,
              toastStory,
              obUpdateDialogStory,
              appbarStory,
              buttonStory,
              tabStory,
              dialogStory,
              themeStory,
              containerStory,
              radialGaugeStory,
              textStory,
              pickerStory,
              dateRangePickerStory,
              marqueeStory,
              uploaderStory,
              bottomSheetStory,
              radioStory,
              switchStory,
              statisticStory,
              agentTableStory,
            ],
          );
        }),
      ),
    );
  }
}
