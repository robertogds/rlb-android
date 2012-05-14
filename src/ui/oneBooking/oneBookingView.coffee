root.closeBookingButton = new root.GenericButton(280,L('close')).button


root.closeBookingButton.addEventListener 'click', (e) ->
  root.confirmBookingWindow.close()
  root.oneDealWindow.close()
  root.oneBookingWindow.close() 
#  root.tabGroup.setActiveTab(1)


root.showOneBookingView = (@booking) ->
	title = L('booking') + ' : ' + booking.code
	text = L('hotel')+': ' + booking.hotelName + '\n'+L('checkin')+': ' + booking.checkinDate + '\n'
	text = text + L('nights') + ': ' + booking.nights + '\n\n'
	text = text + L('salePrice')+': ' + booking.salePriceCents + '€ '+L('regularPrice')+': ' + booking.priceCents + ' € \n\n\n'
	text = text + L('oneBookingText')
	root.oneBookingWindow.remove(root.oneClassBookingView)
	root.oneClassBookingView =  new root.GenericTextView(0,title,text).view
	root.oneBookingWindow.add(root.oneClassBookingView)
	root.oneClassBookingView.add(root.closeBookingButton)
	if (Titanium.Platform.name == 'android')		
		root.tabGroup.activeTab.open(root.oneBookingWindow,{animated:true}) 
		#root.confirmBookingWindow.add(root.oneClassBookingView)
	else
		Ti.API.error 'Paso 3'
		root.oneBookingWindow.backButtonTitle = Ti.Locale.getString('close') 
		root.oneBookingWindow.open
			modal:true
			modalTransitionStyle: Ti.UI.iPhone.MODAL_TRANSITION_STYLE_FLIP_HORIZONTAL
			modalStyle: Ti.UI.iPhone.MODAL_PRESENTATION_FORMSHEET
			navBarHidden:true
		root.oneBookingWindow.add(root.closeBookingButton)




