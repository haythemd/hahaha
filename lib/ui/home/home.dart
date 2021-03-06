import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/constants/font_family.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/ui/Accueil/HomePage.dart';
import 'package:boilerplate/ui/Chateau.dart';
import 'package:boilerplate/ui/home/map.dart';
import 'package:boilerplate/ui/info/info.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/stores/language/language_store.dart';
import 'package:boilerplate/stores/post/post_store.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_dialog/material_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Jardin.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  //stores:---------------------------------------------------------------------
  late PostStore _postStore;
  late ThemeStore _themeStore;
  late LanguageStore _languageStore;
  late TabController tabController ;
  String title = 'Accueil';
  List<String> titles = ['Accueil','Historique du château','Historique des jardins','Map','Info'];
  @override
  void initState() {
    tabController = new TabController(length: 5, vsync: this);
    tabController.addListener(() {
      setState(() {
        title=titles[tabController.index];
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _languageStore = Provider.of<LanguageStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);
    _postStore = Provider.of<PostStore>(context);

    // check to see if already called api
    if (!_postStore.loading) {
      _postStore.getPosts();
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor:Color(0xFF111111),title: Text(title,style: DefaultFont.light),centerTitle: true,leading: IconButton(onPressed: (){
          Navigator.of(context).pushReplacementNamed(Routes.splash);
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),),
        body: TabBarView(
          controller: tabController,
          children: [HomePage(),Chateau(),Jardin(),MapWidget(),InfoWidget()],),
        bottomNavigationBar: Container( color: Colors.black,height: 80,
          child: TabBar(
            labelStyle: DefaultFont.light.copyWith(fontSize: 1,color: Colors.transparent),
            controller: tabController,

              tabs: [
            Tab(icon: SvgPicture.asset('assets/icons/Acceuil.svg',color: Colors.white,), text: 'Accueil'),
            Tab(icon: SvgPicture.asset('assets/icons/Histoire_chateau.svg',color: Colors.white,), text:'Historique du château'),
                Tab(icon: SvgPicture.asset('assets/icons/Histoire_jardin.svg',color: Colors.white,), text: 'Historique des jardins'),
                Tab(icon: SvgPicture.asset('assets/icons/Map.svg',color: Colors.white,), text:'Map'),
                Tab(icon: SvgPicture.asset('assets/icons/Info.svg',color: Colors.white,), text: 'Info'),
          ], ),
        ),
      ),
    );
  }



  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      _buildLanguageButton(),
      _buildThemeButton(),
      _buildLogoutButton(),
    ];
  }

  Widget _buildThemeButton() {
    return Observer(
      builder: (context) {
        return IconButton(
          onPressed: () {
            _themeStore.changeBrightnessToDark(!_themeStore.darkMode);
          },
          icon: Icon(
            _themeStore.darkMode ? Icons.brightness_5 : Icons.brightness_3,
          ),
        );
      },
    );
  }

  Widget _buildLogoutButton() {
    return IconButton(
      onPressed: () {
        SharedPreferences.getInstance().then((preference) {
          preference.setBool(Preferences.is_logged_in, false);
          Navigator.of(context).pushReplacementNamed(Routes.login);
        });
      },
      icon: Icon(
        Icons.power_settings_new,
      ),
    );
  }

  Widget _buildLanguageButton() {
    return IconButton(
      onPressed: () {
        _buildLanguageDialog();
      },
      icon: Icon(
        Icons.language,
      ),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _handleErrorMessage(),
        _buildMainContent(),
      ],
    );
  }

  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return _postStore.loading
            ? CustomProgressIndicatorWidget()
            : Material(child: _buildListView());
      },
    );
  }

  Widget _buildListView() {
    return _postStore.postList != null
        ? ListView.separated(
            itemCount: _postStore.postList!.posts!.length,
            separatorBuilder: (context, position) {
              return Divider();
            },
            itemBuilder: (context, position) {
              return _buildListItem(position);
            },
          )
        : Center(
            child: Text(
              AppLocalizations.of(context).translate('home_tv_no_post_found'),
            ),
          );
  }

  Widget _buildListItem(int position) {
    return ListTile(
      dense: true,
      leading: Icon(Icons.cloud_circle),
      title: Text(
        '${_postStore.postList?.posts?[position].title}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      subtitle: Text(
        '${_postStore.postList?.posts?[position].body}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        if (_postStore.errorStore.errorMessage.isNotEmpty) {
          return _showErrorMessage(_postStore.errorStore.errorMessage);
        }

        return SizedBox.shrink();
      },
    );
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: AppLocalizations.of(context).translate('home_tv_error'),
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return SizedBox.shrink();
  }

_buildLanguageDialog() {
  _showDialog<String>(
    context: context,
    child: MaterialDialog(
      borderRadius: 5.0,
      enableFullWidth: true,
      title: Text(
        AppLocalizations.of(context).translate('home_tv_choose_language'),
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      headerColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      closeButtonColor: Colors.white,
      enableCloseButton: true,
      enableBackButton: false,
      onCloseButtonClicked: () {
        Navigator.of(context).pop();
      },
      children: _languageStore.supportedLanguages
          .map(
            (object) => ListTile(
              dense: true,
              contentPadding: EdgeInsets.all(0.0),
              title: Text(
                object.language!,
                style: TextStyle(
                  color: _languageStore.locale == object.locale
                      ? Theme.of(context).primaryColor
                      : _themeStore.darkMode ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                // change user language based on selected locale
                _languageStore.changeLanguage(object.locale!);
              },
            ),
          )
          .toList(),
    ),
  );
}

  _showDialog<T>({required BuildContext context, required Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T? value) {
      // The value passed to Navigator.pop() or null.
    });
  }
}
