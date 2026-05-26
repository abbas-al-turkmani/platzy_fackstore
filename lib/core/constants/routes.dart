class Routes {
  static const String
      // Authentication
      loadingAppPage = '/',
      logInPage = '/login',
      passwordPage = '/password',
      forgotPasswordPage = '/forgot-password',
      createAccountPage = '/create-account',
      onboardingPage = '/onboarding',

      // Home
      homePage = '/home',
      ordersPage = '$homePage/order-page',
      categoriesPage = '/categories-page',
      categoryPage = '/category-page',

      // Products and checkouts
      productDetailes = '/product-detailes-page',
      cartPage = '/cart-Page',
      orderPlacedPage = '$cartPage/order-placed-page';
}
