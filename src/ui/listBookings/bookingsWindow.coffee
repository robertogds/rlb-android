Ti.include(
  '/js/bookingsTable.js'
  '/js/noBookingsView.js'
)


#root.bookingsWindow.addEventListener 'focus', (e) ->
root.bookingTab.addEventListener 'click', (e) ->
	Ti.API.info 'Hace clik en tab'
	if Titanium.App.Properties.hasProperty("user") or Titanium.Facebook.loggedIn
		root.showBookings()
	else
		root.noBookingsView.show()
	1

