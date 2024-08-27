import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../middlewares/auth_middleware.dart';
import 'constants.dart';

class Routes {
  Routes._();

  static const String initialRoute = '/';
  static const String otp = '/otp/';
  static const String home = '/home/';
  static const String login = '/login/';
  static const String introduction = '/introduction/';
  static const String register = '/register/';
  static const String sample = '/sample/';
  static const String loginSuccessful = '/login-successful/';
  static const String quizDone = '/quiz-done/';
  static const String teams = '/teams/';
  static const String players = '/players/';
  static const String createTournament = '/create-tournament/';
  static const String editTournament = '/edit-tournament/';
  static const String createTeam = '/create-team/';
  static const String shareTeamDetails = '/share-team-details/';
  static const String selectTeam = '/select-team/';
  static const String quiz = '/quiz/';
  static const String scoreBoard = '/scoreboard/';
  static const String tournamentDetails = '/tournament-details/';
  static const String cropImage = '/crop-image/';
  static const String privacyPolicy = '/privacy-policy/';
  static const String termsAndCondition = '/terms-and-condition/';
  static const String addCategory = '/add-category';
  static const String minAppVersion = '1.0.5';
  static List<GetMiddleware> defaultMiddleware = [AuthMiddleware()];

  static List<GetPage<dynamic>> routes = [
    // TODO: Implement force upgrade
    // GetPage(
    //   name: login,
    //   binding: AuthBinding(),
    //   page: () {
    //     if(!kIsWeb){
    //      return UpgradeAlert(
    //           dialogStyle: UpgradeDialogStyle.cupertino,
    //           canDismissDialog: false,
    //           showLater: false,
    //           showIgnore: false,
    //           upgrader: Upgrader(
    //             minAppVersion: minAppVersion,
    //           ),
    //           child: const LoginView());
    //     }else {
    //      return const LoginView();
    //     }
    //   }
    // ),
    // TODO: Normal page redirection
    // GetPage(
    //   name: privacyPolicy,
    //   page: () => const PrivatePolicyView(),
    // ),

    // TODO: Following is the breakpoints logic
    // GetPage(
    //   name: scoreBoard,
    //   binding: ScoreBoardBinding(),
    //   page: () {
    //     return const ResponsiveBreakpoints(
    //       landscapePlatforms: [],
    //       breakpoints: [
    //         Breakpoint(
    //           start: 0,
    //           end: 360,
    //           name: Constants.smallDevice,
    //         ),
    //         Breakpoint(
    //           start: 361,
    //           end: 420,
    //           name: MOBILE,
    //         ),
    //         Breakpoint(
    //           start: 421,
    //           end: 760,
    //           name: Constants.smallTablet,
    //         ),
    //         Breakpoint(
    //           start: 761,
    //           end: 1023,
    //           name: TABLET,
    //         ),
    //         Breakpoint(
    //           start: 1024,
    //           end: 1439,
    //           name: Constants.smallLaptop,
    //         ),
    //         Breakpoint(
    //           start: 1440,
    //           end: double.infinity,
    //           name: DESKTOP,
    //         ),
    //       ],
    //       child: TournamentScoreBoardPage(),
    //     );
    //     return const TournamentScoreBoardPage();
    //   },
    //   middlewares: defaultMiddleware +
    //       [
    //         ScoreBoardMiddleware(),
    //       ],
    // ),
  ];
}