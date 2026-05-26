import 'package:platzy_fackstore/core/constants/keys.dart';
import 'package:platzy_fackstore/features/auth/pages/create_account_page.dart';
import 'package:platzy_fackstore/features/auth/pages/forgot_password_page.dart';
import 'package:platzy_fackstore/features/auth/pages/loading_app_page.dart';
import 'package:platzy_fackstore/features/auth/pages/login_page.dart';
import 'package:platzy_fackstore/features/auth/pages/onboarding_page.dart';
import 'package:platzy_fackstore/features/auth/pages/password_page.dart';
import 'package:platzy_fackstore/features/cart/presentation/cart_page.dart';
import 'package:platzy_fackstore/features/cart/presentation/order_placed_page.dart';
import 'package:platzy_fackstore/features/home/models/product.module.dart';
import 'package:platzy_fackstore/features/home/presentation/pages/categories_page.dart';
import 'package:platzy_fackstore/features/home/presentation/pages/category_products_page.dart';
import 'package:platzy_fackstore/features/home/presentation/pages/product_details_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/home/presentation/bloc/home_cubit.bloc.dart';
import '../features/home/presentation/pages/home_page.dart';
import 'constants/routes.dart';
import 'dependency_injection/service_locator.dart';

final router = GoRouter(
  routes: [
    // Authentication
    GoRoute(
      path: Routes.loadingAppPage,
      builder: (context, state) => const LoadingAppPage(),
    ),
    GoRoute(
      path: Routes.logInPage,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.passwordPage,
      builder: (context, state) => const PasswordPage(),
    ),
    GoRoute(
      path: Routes.forgotPasswordPage,
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: Routes.createAccountPage,
      builder: (context, state) => const CreateAccountPage(),
    ),
    GoRoute(
      path: Routes.onboardingPage,
      builder: (context, state) => const OnboardingPage(),
    ),

    //Home Page
    GoRoute(
      path: Routes.homePage,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit(
          categoryDatasource: getItInstance(),
          productDatasource: getItInstance(),
        )..initData(),
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: Routes.ordersPage,
      builder: (context, state) => BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(
          categoryDatasource: getItInstance(),
          productDatasource: getItInstance(),
        )..initData(),
        child: const HomePage(
          selectedPage: MainScreenPages.orders,
        ),
      ),
    ),

    // Products and checkouts
    GoRoute(
      path: Routes.productDetailes,
      builder: (context, state) => ProductDetailsPage(
        productModel: (state.extra! as ProductModel),
      ),
    ),
    GoRoute(
      path: Routes.cartPage,
      builder: (context, state) => CartPage(
        homeCubit: (state.extra as Map)[ConstantKeys.homeCubit],
      ),
    ),
    GoRoute(
      path: Routes.orderPlacedPage,
      builder: (context, state) => const OrderPlacedPage(),
    ),

    // Other
    GoRoute(
      path: Routes.categoriesPage,
      builder: (context, state) => CategoriesPage(
        homeCubit: (state.extra as Map)[ConstantKeys.homeCubit],
      ),
    ),
    GoRoute(
      path: Routes.categoryPage,
      builder: (context, state) => CategoryProductsPage(
        homeCubit: (state.extra as Map)[ConstantKeys.homeCubit],
        category: (state.extra as Map)[ConstantKeys.catigory],
      ),
    )
  ],
);
