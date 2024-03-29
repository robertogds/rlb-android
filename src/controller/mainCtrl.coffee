root.url = 'http://rlb-back.appspot.com'
root.surl = 'https://rlb-back.appspot.com'
root.faqUrl = root.url+'/info/faq'
root.termsUrl = root.url+'/info/use_terms'
#root.url = 'http://192.168.1.33:9000'
#root.surl = 'http://192.168.1.33:9000'
root.creditsLastUpdate = new Date(90000)
root.citiesLastUpdate = new Date(900000)
root.bookingsLastUpdate = new Date(900000)
root.cell = {}
root.listCities = []
root.fetchCitiesCaller = 'GPS'
root.ancho = Ti.Platform.displayCaps.platformWidth
root.anchoCities = Math.round(Ti.Platform.displayCaps.platformWidth / 3)

Ti.Gesture.addEventListener 'orientationchange', (e) ->
	Ti.Android.currentActivity.setRequestedOrientation(Ti.Android.SCREEN_ORIENTATION_PORTRAIT)

Ti.include(
	'/js/fetchGPSCities.js'
#	'/js/resume.js'
	'/js/fetchCreditsAsync.js'
	'/js/mocks.js'
	'/js/staticCities.js'
	'/js/staticOtherCities.js'
	'/js/sharekit.js'
	'/js/zooz.js'
	'/js/gpsData.js'
	'/js/fetchDeals.js'
	'/js/fetchCities.js'
	'/js/dateUtil.js'
	'/js/GenericWindow.js'
	'/js/GenericSeparatorView.js'
	'/js/Generic2RowsView.js'
	'/js/GenericNightView.js'
	'/js/GenericTextRow.js'
	'/js/GenericRow.js'
	'/js/GenericMenuTable.js'
	'/js/GenericButton.js'
	'/js/GenericPayButton.js'
	'/js/GenericMapAnnotation.js'
	'/js/GenericTextView.js'
	'/js/GenericTitleLabel.js'
	'/js/GenericBlueTitleLabel.js'
	'/js/GenericTextLabel.js'
	'/js/GenericSubtitleLabel.js'
	'/js/GenericMapRightButtonView.js'
	'/js/GenericAndroidTab.js'
	'/js/PullRefreshHeader.js'
	'/js/errorView.js'
	'/js/loadingView.js'
	'/js/application.js'
	'/js/listDealsWindow.js'
	'/js/fetchServerUser.js'
	'/js/loadUser.js'
	'/js/accountView.js'
	'/js/bookingsWindow.js'
	'/js/listCreditsWindow.js'
	'/js/citiesWindow.js'
	'/js/showDeal.js'
	'/js/oneBookingView.js'
	'/js/optionsWindow.js'
	'/js/bookingView.js'
	'/js/aboutView.js'
	'/js/forHotelsView.js'
	'/js/termsView.js'
	'/js/privacyView.js'
	'/js/creditsWindow.js'
	'/js/inviteWindow.js'
)

# Main Program
root.tabGroup.open()
#root.initializeGPS()

if root.isLogged()
	root.loadRefererId()


