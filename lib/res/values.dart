/*-------------------------------------------------------------------------------
  Created by Alex De Leo
  GitHub: https://github.com/Il-Messia
  Description: Simple app created through the Flutter framework. It allows the 
               ordering of pizzas for takeaway by message or call.
 ------------------------------------------------------------------------------*/
 /*-------------------------------------------------------------------------------
  ------------------------------------------------------------------------------*/

class Values {

  String _keyTheme = "THEME";
  String _keyName = "NAME";
  String _keyOrder = "ORDER";
  String _keyPhone = "PHONE";
  String _keyMethod = "METHOD";

  String developerUrl = "https://www.instagram.com/__theexecutioner__";
  String codeUrl = "https://github.com/Il-Messia/PizzMe";
  String jsonUrl =
      "https://raw.githubusercontent.com/Il-Messia/dataListPizzerie/master/list.json";

  int _splashTime = 4250;

  double _androidStatusBarHeigth = 25.0;
  double _navBarHeigth = 60.0;
  double _avatarRadius = 65.0;

  double _defaultMargin = 15.0;
  double _bottomFromNavBarMargin = 20.0;
  double _splashMargin = 10.0;
  double _splashWeight = 8.0;

  double _externalSplashRadius = 30.0;
  double _internalSplashRadius = 25.0;
  double _defaultRadius = 15.0;

  double _infoCardHeight = 150.0;

  String getKeyTheme() {
    return this._keyTheme;
  }

  String getKeyName() {
    return this._keyName;
  }

  String getKeyOrder() {
    return this._keyOrder;
  }

  String getKeyPhone() {
    return this._keyPhone;
  }

  String getKeyMethod() {
    return this._keyMethod;
  }

  double getSplashMargin() {
    return this._splashMargin;
  }

  double getSplashWeight() {
    return this._splashWeight;
  }

  double getExternalSplashRadius() {
    return this._externalSplashRadius;
  }

  double getInternalSplashRadius() {
    return this._internalSplashRadius;
  }

  double getAndroidStatusBarHeigth() {
    return this._androidStatusBarHeigth;
  }

  double getNavBarHeigth() {
    return this._navBarHeigth;
  }

  double getAvatarRadius() {
    return this._avatarRadius;
  }

  double getDefaultRadius() {
    return this._defaultRadius;
  }

  double getInfoCardHeight() {
    return this._infoCardHeight;
  }

  double getDefaultMargin(){
    return this._defaultMargin;
  }

  double getBottomFromNavBarMargin(){
    return this._bottomFromNavBarMargin;
  }

  int getSplashTime() {
    return this._splashTime;
  }
}
