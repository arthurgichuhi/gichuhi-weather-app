# weather
you need your own personal API keys from http://api.openweathermap.org to build and use the app. Fill the api key in the forecastutil.dart file at the 

_static String appId _


class Util {

static String appId = '';

static String getFormatteddate(DateTime dateTime) {

return new DateFormat("EEE, MMM d, yy").format(dateTime);

} }
