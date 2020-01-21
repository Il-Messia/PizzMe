class Values{

  String _keyTheme = "THEME";

  double _androidStatusBarHeigth = 25.0;
  double _navBarHeigth = 60.0;
  double _avatarRadius = 65.0;

  int _splashTime = 4250;

  double _splashMargin = 10.0;
  double _splashWeight = 8.0;
  double _externalSplashRadius = 30.0;
  double _internalSplashRadius = 25.0;

  String getKeyTheme(){
    return this._keyTheme;
  }

  double getSplashMargin(){
    return this._splashMargin;
  }

  double getSplashWeight(){
    return this._splashWeight;
  }

  double getExternalSplashRadius(){
    return this._externalSplashRadius;
  }

  double getInternalSplashRadius(){
    return this._internalSplashRadius;
  }

  double getAndroidStatusBarHeigth(){
    return this._androidStatusBarHeigth;
  }
  double getNavBarHeigth(){
    return this._navBarHeigth;
  }
  double getAvatarRadius(){
    return this._avatarRadius;
  }
  int getSplashTime(){
    return this._splashTime;
  }
}