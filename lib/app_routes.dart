import 'package:get/get.dart';

import '/backend/backend.dart';
import '/index.dart';
import '/pages/events_entertainment_screen/controller/events_entertainment_screen_binding.dart';
import '/pages/events_entertainment_screen_copy/controller/events_entertainment_screen_copy_binding.dart';
import '/pages/events_entertainment_screen_copy_copy/controller/events_entertainment_screen_copy_copy_binding.dart';
import '/pages/home_page/controller/home_page_binding.dart';
import '/pages/home_page_dynamic/controller/home_page_dynamic_binding.dart';
import '/pages/home_page_dynamic_copy/controller/home_page_dynamic_copy_binding.dart';
import '/pages/home_page_with_data/controller/home_page_with_data_binding.dart';
import '/pages/main_bottom_nav/controller/main_bottom_nav_binding.dart';
import '/pages/wheel_adventure_screen/controller/wheel_adventure_screen_binding.dart';
import '/pages/main_bottom_nav/main_bottom_nav_widget.dart';
import '/challenge_screen/controller/challenge_screen_binding.dart';
import '/listing_detail_page/controller/listing_detail_page_binding.dart';
import '/listing_detail_page_copy/controller/listing_detail_page_copy_binding.dart';
import '/listing_detail_page_copy2/controller/listing_detail_page_copy2_binding.dart';
import '/listing_page/controller/listing_page_binding.dart';
import '/login_screen/controller/login_screen_binding.dart';
import '/owensboro_games/controller/owensboro_games_binding.dart';
import '/sub_catagory_screen/controller/sub_catagory_screen_binding.dart';
import '/sub_catagory_screen_copy/controller/sub_catagory_screen_copy_binding.dart';
import '/term_condition_page/controller/term_condition_page_binding.dart';
import '/user_side_login_screen/controller/user_side_login_screen_binding.dart';
import '/user_side_sign_up_screen/controller/user_side_sign_up_screen_binding.dart';
import '/view_all_reviews_screen/controller/view_all_reviews_screen_binding.dart';
import '/voting_screen/controller/voting_screen_binding.dart';

/// Central GetX route names (paths). Use these for [Get.toNamed], [Get.offNamed], etc.
class AppRoutes {
  AppRoutes._();

  static String get initial => MainBottomNavWidget.routePath;
  static String get homePage => HomePageWidget.routePath;
  static String get eventsEntertainmentScreen =>
      EventsEntertainmentScreenWidget.routePath;
  static String get loginScreen => LoginScreenWidget.routePath;
  static String get signUpScreen => SignUpScreenWidget.routePath;
  static String get subCatagoryScreen => SubCatagoryScreenWidget.routePath;
  static String get subCatagoryScreenCopy =>
      SubCatagoryScreenCopyWidget.routePath;
  static String get listingDetailPage => ListingDetailPageWidget.routePath;
  static String get listingDetailPageCopy =>
      ListingDetailPageCopyWidget.routePath;
  static String get votingScreen => VotingScreenWidget.routePath;
  static String get adminDashboardScreen =>
      AdminDashboardScreenWidget.routePath;
  static String get adminCatagoryScreen => AdminCatagoryScreenWidget.routePath;
  static String get adminListingScreen => AdminListingScreenWidget.routePath;
  static String get adminSubCatagoryScreen =>
      AdminSubCatagoryScreenWidget.routePath;
  static String get contactUs => ContactUsWidget.routePath;
  static String get wheelAdventureScreen =>
      WheelAdventureScreenWidget.routePath;
  static String get homePageDynamic => HomePageDynamicWidget.routePath;
  static String get eventsEntertainmentScreenCopy =>
      EventsEntertainmentScreenCopyWidget.routePath;
  static String get userSideLoginScreen => UserSideLoginScreenWidget.routePath;
  static String get userSideSignUpScreen =>
      UserSideSignUpScreenWidget.routePath;
  static String get homePageWithData => HomePageWithDataWidget.routePath;
  static String get newscreen => NewscreenWidget.routePath;
  static String get viewAllReviewsScreen =>
      ViewAllReviewsScreenWidget.routePath;
  static String get editScreen => EditScreenWidget.routePath;
  static String get editCatagoryScreen => EditCatagoryScreenWidget.routePath;
  static String get privacyPage => PrivacyPageWidget.routePath;
  static String get termConditionPage => TermConditionPageWidget.routePath;
  static String get privacyPageCopy => PrivacyPageCopyWidget.routePath;
  static String get listingPage => ListingPageWidget.routePath;
  static String get challengeScreen => ChallengeScreenWidget.routePath;
  static String get owensboroGames => OwensboroGamesWidget.routePath;
  static String get listingDetailPageCopy2 =>
      ListingDetailPageCopy2Widget.routePath;
  static String get homePageDynamicCopy => HomePageDynamicCopyWidget.routePath;
  static String get eventsEntertainmentScreenCopyCopy =>
      EventsEntertainmentScreenCopyCopyWidget.routePath;
  static String get adminDashboardScreenCopy =>
      AdminDashboardScreenCopyWidget.routePath;
  static String get mainBottomNav => MainBottomNavWidget.routePath;
}

/// GetX pages for [GetMaterialApp.getPages].
class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<void>(
      name: MainBottomNavWidget.routePath,
      page: () => const MainBottomNavWidget(),
      binding: MainBottomNavBinding(),
    ),
    GetPage<void>(
      name: HomePageWidget.routePath,
      page: () => const HomePageWidget(),
      binding: HomePageBinding(),
    ),
    GetPage<void>(
      name: EventsEntertainmentScreenWidget.routePath,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return EventsEntertainmentScreenWidget(
          catagories: args?['catagories'] as CatagoriesRecord?,
        );
      },
      binding: EventsEntertainmentScreenBinding(),
    ),
    GetPage<void>(
      name: LoginScreenWidget.routePath,
      page: () => const LoginScreenWidget(),
      binding: LoginScreenBinding(),
    ),
    GetPage<void>(
      name: SignUpScreenWidget.routePath,
      page: () => const SignUpScreenWidget(),
    ),
    GetPage<void>(
      name: SubCatagoryScreenWidget.routePath,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return SubCatagoryScreenWidget(
          subCatagoriesRef: args?['subCatagoriesRef'] as SubCatagoriesRecord?,
        );
      },
      binding: SubCatagoryScreenBinding(),
    ),
    GetPage<void>(
      name: SubCatagoryScreenCopyWidget.routePath,
      page: () => const SubCatagoryScreenCopyWidget(),
      binding: SubCatagoryScreenCopyBinding(),
    ),
    GetPage<void>(
      name: ListingDetailPageWidget.routePath,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return ListingDetailPageWidget(
          product: args?['product'] as ProductsRecord?,
        );
      },
      binding: ListingDetailPageBinding(),
    ),
    GetPage<void>(
      name: ListingDetailPageCopyWidget.routePath,
      page: () => const ListingDetailPageCopyWidget(),
      binding: ListingDetailPageCopyBinding(),
    ),
    GetPage<void>(
      name: VotingScreenWidget.routePath,
      page: () => const VotingScreenWidget(),
      binding: VotingScreenBinding(),
    ),
    GetPage<void>(
      name: AdminDashboardScreenWidget.routePath,
      page: () => const AdminDashboardScreenWidget(),
    ),
    GetPage<void>(
      name: AdminCatagoryScreenWidget.routePath,
      page: () => const AdminCatagoryScreenWidget(),
    ),
    GetPage<void>(
      name: AdminListingScreenWidget.routePath,
      page: () => const AdminListingScreenWidget(),
    ),
    GetPage<void>(
      name: AdminSubCatagoryScreenWidget.routePath,
      page: () => const AdminSubCatagoryScreenWidget(),
    ),
    GetPage<void>(
      name: ContactUsWidget.routePath,
      page: () => const ContactUsWidget(),
    ),
    GetPage<void>(
      name: WheelAdventureScreenWidget.routePath,
      page: () => const WheelAdventureScreenWidget(),
      binding: WheelAdventureScreenBinding(),
    ),
    GetPage<void>(
      name: HomePageDynamicWidget.routePath,
      page: () => const HomePageDynamicWidget(),
      binding: HomePageDynamicBinding(),
    ),
    GetPage<void>(
      name: EventsEntertainmentScreenCopyWidget.routePath,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return EventsEntertainmentScreenCopyWidget(
          catagories: args?['catagories'] as CatagoriesRecord?,
        );
      },
      binding: EventsEntertainmentScreenCopyBinding(),
    ),
    GetPage<void>(
      name: UserSideLoginScreenWidget.routePath,
      page: () => const UserSideLoginScreenWidget(),
      binding: UserSideLoginScreenBinding(),
    ),
    GetPage<void>(
      name: UserSideSignUpScreenWidget.routePath,
      page: () => const UserSideSignUpScreenWidget(),
      binding: UserSideSignUpScreenBinding(),
    ),
    GetPage<void>(
      name: HomePageWithDataWidget.routePath,
      page: () => const HomePageWithDataWidget(),
      binding: HomePageWithDataBinding(),
    ),
    GetPage<void>(
      name: NewscreenWidget.routePath,
      page: () => const NewscreenWidget(),
    ),
    GetPage<void>(
      name: ViewAllReviewsScreenWidget.routePath,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return ViewAllReviewsScreenWidget(
          product: args?['product'] as ProductsRecord?,
        );
      },
      binding: ViewAllReviewsScreenBinding(),
    ),
    GetPage<void>(
      name: EditScreenWidget.routePath,
      page: () => const EditScreenWidget(),
    ),
    GetPage<void>(
      name: EditCatagoryScreenWidget.routePath,
      page: () => const EditCatagoryScreenWidget(),
    ),
    GetPage<void>(
      name: PrivacyPageWidget.routePath,
      page: () => const PrivacyPageWidget(),
    ),
    GetPage<void>(
      name: TermConditionPageWidget.routePath,
      page: () => const TermConditionPageWidget(),
      binding: TermConditionPageBinding(),
    ),
    GetPage<void>(
      name: PrivacyPageCopyWidget.routePath,
      page: () => const PrivacyPageCopyWidget(),
    ),
    GetPage<void>(
      name: ListingPageWidget.routePath,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return ListingPageWidget(
          subCatagoriesRef: args?['subCatagoriesRef'] as SubCatagoriesRecord?,
        );
      },
      binding: ListingPageBinding(),
    ),
    GetPage<void>(
      name: ChallengeScreenWidget.routePath,
      page: () => const ChallengeScreenWidget(),
      binding: ChallengeScreenBinding(),
    ),
    GetPage<void>(
      name: OwensboroGamesWidget.routePath,
      page: () => const OwensboroGamesWidget(),
      binding: OwensboroGamesBinding(),
    ),
    GetPage<void>(
      name: ListingDetailPageCopy2Widget.routePath,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return ListingDetailPageCopy2Widget(
          product: args?['product'] as ProductsRecord?,
        );
      },
      binding: ListingDetailPageCopy2Binding(),
    ),
    GetPage<void>(
      name: HomePageDynamicCopyWidget.routePath,
      page: () => const HomePageDynamicCopyWidget(),
      binding: HomePageDynamicCopyBinding(),
    ),
    GetPage<void>(
      name: EventsEntertainmentScreenCopyCopyWidget.routePath,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return EventsEntertainmentScreenCopyCopyWidget(
          catagories: args?['catagories'] as CatagoriesRecord?,
        );
      },
      binding: EventsEntertainmentScreenCopyCopyBinding(),
    ),
    GetPage<void>(
      name: AdminDashboardScreenCopyWidget.routePath,
      page: () => const AdminDashboardScreenCopyWidget(),
    ),
  ];
}
