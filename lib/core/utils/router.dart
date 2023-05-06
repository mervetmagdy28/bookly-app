import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presenation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presenation/views/book_detials_view.dart';
import 'package:bookly/features/search/data/repo/search_repo_impl.dart';
import 'package:bookly/features/search/presentatiom/view/search.dart';
import 'package:bookly/features/search/presentatiom/view_models/search_cubit/search_cubit.dart';
import 'package:bookly/features/sign/presentation/views/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presenation/views/home.dart';
import '../../features/reading_list/presentation/views/reading_list_view.dart';
import '../../features/sign/presentation/views/sign_in.dart';
import '../../features/splash/presenation/views/splash_view.dart';

abstract class AppRouter{
  static String homeView='/home';
  static String bookDetailsView='/book';
  static String searchView='/search';
  static String signIn='/signIn';
  static String signUp='/signUp';
  static String readingList='/readingList';
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: homeView,
        builder: (BuildContext context, GoRouterState state) {
          return const Home();
        },
      ),
      GoRoute(
        path: bookDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          BookModel bookModel=state.extra as BookModel;
          return BlocProvider(
              create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>())..fetchSimilarBooks(category: bookModel.volumeInfo.categories![0]),
              child:  BookDetailsView(bookModel: bookModel,));
        },
      ),
      GoRoute(
        path: searchView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context)=>SearchCubit(SearchRepoImpl(apiService: getIt.get<ApiService>()))..fetchSearchBooks(bookType: state.extra as String),
              child: SearchView(bookName: state.extra as String,));
        },
      ),
      GoRoute(
        path: signIn,
        builder: (BuildContext context, GoRouterState state) {
          return const SignIn();
        },
      ),
      GoRoute(
        path: signUp,
        builder: (BuildContext context, GoRouterState state) {
          return SignUp();
        },
      ),
      GoRoute(
        path: readingList,
        builder: (BuildContext context, GoRouterState state) {
          return const ReadingListView();
        },
      ),
    ],
  );

}