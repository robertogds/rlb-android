root.paypal = require("ti.paypal")
u = Ti.Android != undefined ? 'dp' : 0
Ti.API.info 'Carga PAYPAL'

root.addPaypalButtonToWindow = () ->
	Ti.API.info '**** Entra en Paypal'
	if (button)
		root.testWindow.remove(button)
		button = null
	
	button = root.paypal.createPaypalButton
		width: 194 
		height: 37
		buttonStyle: root.paypal.BUTTON_194x37
		bottom: 50
		language: 'es_ES'
		appID: 'ZBKPEMRSSMVBL'
		paypalEnvironment: root.paypal.PAYPAL_ENV_LIVE
		#Sandbox, None or Live
		feePaidByReceiver: false
		enableShipping: false
		payment:
			paymentType: root.paypal.PAYMENT_TYPE_SERVICE 
			subtotal: 8
			tax: 0
			shipping: 0
			currency: 'EUR'
			recipient: 'hola@iipir.com'
			customID: new Date().getTime()
			invoiceItems: [
				{ name: 'Hotel PEPE', totalPrice: 8, itemPrice: 2, itemCount: 1 }
				]
			ipnUrl: 'http://www.appcelerator.com/'
			merchantName: 'IIPIR Software Development SL',
			memo: 'ReallyLateBooking - Same Day Hotel Bookings'
	
	button.addEventListener 'paymentCancelled', (e) ->
		text = 'Payment Cancelled.'
		Ti.API.info text
		root.addPaypalButtonToWindow()
	
	button.addEventListener 'paymentSuccess', (e) ->
		text = 'Payment Success.  TransactionID: ' + e.transactionID + ', Reloading...'
		Ti.API.info text
		root.addPaypalButtonToWindow()
	
	button.addEventListener 'paymentError', (e) ->
		text = 'Payment Error,  errorCode: ' + e.errorCode + ', errorMessage: ' + e.errorMessage
		Ti.API.info text
		root.addPaypalButtonToWindow()
	
	button.addEventListener 'buttonDisplayed', () ->
		text = 'The button was displayed!'
		Ti.API.info text
		
	button.addEventListener 'buttonError', (e) ->
		text = 'The button failed to display!'
		Ti.API.info text + JSON.stringify(e)
		
	root.testWindow.add(button)
	