import 'package:get/get.dart';

import '/backend/backend.dart';
import '/index.dart';
import '/pages/main_bottom_nav/main_bottom_nav_widget.dart';

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
      page: () => MainBottomNavWidget(),
    ),
    GetPage<void>(
      name: HomePageWidget.routePath,
      page: () => const HomePageWidget(),
    ),
    GetPage<void>(
      name: EventsEntertainmentScreenWidget.routePath,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return EventsEntertainmentScreenWidget(
          catagories: args?['catagories'] as CatagoriesRecord?,
        );
      },
    ),
    GetPage<void>(
      name: LoginScreenWidget.routePath,
      page: () => const LoginScreenWidget(),
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
    ),
    GetPage<void>(
      name: SubCatagoryScreenCopyWidget.routePath,
      page: () => const SubCatagoryScreenCopyWidget(),
    ),
    GetPage<void>(
      name: ListingDetailPageWidget.routePath,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return ListingDetailPageWidget(
          product: args?['product'] as ProductsRecord?,
        );
      },
    ),
    GetPage<void>(
      name: ListingDetailPageCopyWidget.routePath,
      page: () => const ListingDetailPageCopyWidget(),
    ),
    GetPage<void>(
      name: VotingScreenWidget.routePath,
      page: () => const VotingScreenWidget(),
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
    ),
    GetPage<void>(
      name: HomePageDynamicWidget.routePath,
      page: () => const HomePageDynamicWidget(),
    ),
    GetPage<void>(
      name: EventsEntertainmentScreenCopyWidget.routePath,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return EventsEntertainmentScreenCopyWidget(
          catagories: args?['catagories'] as CatagoriesRecord?,
        );
      },
    ),
    GetPage<void>(
      name: UserSideLoginScreenWidget.routePath,
      page: () => const UserSideLoginScreenWidget(),
    ),
    GetPage<void>(
      name: UserSideSignUpScreenWidget.routePath,
      page: () => const UserSideSignUpScreenWidget(),
    ),
    GetPage<void>(
      name: HomePageWithDataWidget.routePath,
      page: () => const HomePageWithDataWidget(),
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
    ),
    GetPage<void>(
      name: ChallengeScreenWidget.routePath,
      page: () => const ChallengeScreenWidget(),
    ),
    GetPage<void>(
      name: OwensboroGamesWidget.routePath,
      page: () => const OwensboroGamesWidget(),
    ),
    GetPage<void>(
      name: ListingDetailPageCopy2Widget.routePath,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return ListingDetailPageCopy2Widget(
          product: args?['product'] as ProductsRecord?,
        );
      },
    ),
    GetPage<void>(
      name: HomePageDynamicCopyWidget.routePath,
      page: () => const HomePageDynamicCopyWidget(),
    ),
    GetPage<void>(
      name: EventsEntertainmentScreenCopyCopyWidget.routePath,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return EventsEntertainmentScreenCopyCopyWidget(
          catagories: args?['catagories'] as CatagoriesRecord?,
        );
      },
    ),
    GetPage<void>(
      name: AdminDashboardScreenCopyWidget.routePath,
      page: () => const AdminDashboardScreenCopyWidget(),
    ),
  ];
}
