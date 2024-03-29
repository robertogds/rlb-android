root.closeBookingButton = new root.GenericButton(405,L('close')).button

root.oneBookingView = Titanium.UI.createView
	top: 0
	
root.oneBookingDataView = Titanium.UI.createView()
root.oneBookingWindow.add(root.oneBookingDataView)

headerLabel = Titanium.UI.createLabel
	width: Ti.UI.FILL
	borderWidth: 0
	borderColor: '#3e565e'
	backgroundColor: 'black'
	color: '#fff'
	height: 40
	top: 0
	
root.oneBookingTitleLabel = Titanium.UI.createLabel
	height: 30
	top: 5
	color: '#fff'
	left: 10
	font:
		fontSize: 20
		fontWeight: 'bold'

bookingDataTitle = new root.GenericBlueTitleLabel(50,10,L('bookingData') + ': ').label
clientTitle  = new root.GenericBlueTitleLabel(245,10,L('clientData')+': ').label
rememberTitle = new root.GenericBlueTitleLabel(335,10,L('remember')+': ').label

root.oneBookingView.add(headerLabel)
root.oneBookingView.add(root.oneBookingTitleLabel)
root.oneBookingView.add(bookingDataTitle)
root.oneBookingView.add(clientTitle)
root.oneBookingView.add(rememberTitle)

hotelSubtitle = new root.GenericSubtitleLabel(80,10,L('hotel')+': ').label
addressSubtitle = new root.GenericSubtitleLabel(100,10,L('address')+': ').label
roomSubtitle = new root.GenericSubtitleLabel(120,10,L('room')+': ').label
regimenSubtitle = new root.GenericSubtitleLabel(140,10,L('regime') + ': ').label
nightsSubtitle = new root.GenericSubtitleLabel(160,180,L('nights') + ': ').label
checkinSubtitle = new root.GenericSubtitleLabel(160,10,L('checkin') + ': ').label
regularPriceSubtitle = new root.GenericSubtitleLabel(180,180,L('regularPrice')+': ').label
salePriceSubtitle = new root.GenericSubtitleLabel(180,10,L('salePrice')+': ').label
creditsSubtitle = new root.GenericSubtitleLabel(200,10,L('credits')+': ').label
paidSubtitle = new root.GenericSubtitleLabel(220,10,L('paid')+': ').label
firstNameSubtitle = new root.GenericSubtitleLabel(270,10,L('firstName')+': ').label
lastNameSubtitle = new root.GenericSubtitleLabel(290,10,L('lastName')+': ').label
emailSubtitle = new root.GenericSubtitleLabel(310,10,L('email')+': ').label

remember1 = new root.GenericTextLabel(360,10,L('bookPaid')).label

root.oneBookingView.add(hotelSubtitle)
root.oneBookingView.add(addressSubtitle)
root.oneBookingView.add(roomSubtitle)
root.oneBookingView.add(nightsSubtitle)
root.oneBookingView.add(checkinSubtitle)
root.oneBookingView.add(regimenSubtitle)
root.oneBookingView.add(regularPriceSubtitle)
root.oneBookingView.add(salePriceSubtitle)
root.oneBookingView.add(creditsSubtitle)
root.oneBookingView.add(paidSubtitle)
root.oneBookingView.add(firstNameSubtitle)
root.oneBookingView.add(lastNameSubtitle)
root.oneBookingView.add(emailSubtitle)
root.oneBookingView.add(remember1)

root.closeBookingButton.addEventListener 'click', (e) ->
	root.confirmBookingWindow.close()
	root.oneDealWindow.close()
	root.oneBookingWindow.close() 
	root.tabGroup.setActiveTab(1)
	
root.oneBookingWindow.add(root.oneBookingView)


root.showOneBookingView = (@booking) ->
	Ti.API.info booking
	if booking.credits is undefined
		booking.credits = 0
	paidEur = booking.salePriceCents - booking.credits
	if paidEur < 1
		paidEur = 0
	if booking.breakfastIncluded is 1
		regimenText = L('breakfastYes')
	else
		regimenText = L('breakfastNo')
	root.oneBookingWindow.remove(root.oneBookingDataView)
	root.oneBookingDataView = Titanium.UI.createView()
	hotelName = new root.GenericTextLabel(80,100,booking.hotelName).label
	hotelAddress = new root.GenericTextLabel(100,100,booking.dealAddress).label
	roomType = new root.GenericTextLabel(120,100,L('doubleRoom')).label
	regimen = new root.GenericTextLabel(140,100,regimenText).label
	checkinDate = new root.GenericTextLabel(160,100,booking.checkinDate).label
	nights = new root.GenericTextLabel(160,240,booking.nights).label
	regularPrice = new root.GenericTextLabel(180,280,booking.priceCents + '€ ').label
	salePrice = new root.GenericTextLabel(180,100,booking.salePriceCents + '€ ').label
	credits = new root.GenericTextLabel(200,100,booking.credits + '€ ').label
	paid = new root.GenericTextLabel(220,100,paidEur + '€ ').label
	firstName = new root.GenericTextLabel(270,100,booking.bookingForFirstName).label
	lastName = new root.GenericTextLabel(290,100,booking.bookingForLastName).label
	email = new root.GenericTextLabel(310,100,booking.bookingForEmail).label
	title = L('booking') + ' : ' + booking.code
	root.oneBookingTitleLabel.text = title
	text = L('hotel')+': ' + booking.hotelName + '\n'+L('checkin')+': ' + booking.checkinDate + '\n'
	text = text + L('nights') + ': ' + booking.nights + '\n\n'
	text = text + L('salePrice')+': ' + booking.salePriceCents + '€ '+L('regularPrice')+': ' + booking.priceCents + ' € \n\n\n'
	text = text + L('oneBookingText')
	root.oneBookingDataView.add(hotelName)
	root.oneBookingDataView.add(hotelAddress)
	root.oneBookingDataView.add(roomType)
	root.oneBookingDataView.add(nights)
	root.oneBookingDataView.add(checkinDate)
	root.oneBookingDataView.add(regimen)
	root.oneBookingDataView.add(regularPrice)
	root.oneBookingDataView.add(salePrice)
	root.oneBookingDataView.add(credits)
	root.oneBookingDataView.add(paid)
	root.oneBookingDataView.add(firstName)
	root.oneBookingDataView.add(lastName)
	root.oneBookingDataView.add(email)
	
	root.oneBookingDataView.add(root.closeBookingButton)
	root.oneBookingWindow.add(root.oneBookingDataView)

	root.tabGroup.activeTab.open(root.oneBookingWindow,{animated:true})
