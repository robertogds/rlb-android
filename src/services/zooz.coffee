
root.zoozButton = Ti.UI.createButton
	title: "Purchase..."
	height:50
	width:250
	bottom:20


root.zoozButton.addEventListener 'click',  (e) ->
	Ti.API.info "payBtn clicked"
	zoozmodule = require('com.zooz.ti')
	zoozmodule.doPayment
		data:
			amount: 22.5
			currencyCode: "USD"
			appKey: "0df397d3-8f7c-43d9-bf1e-61f2e255d0b1"
			isSandbox: true
			
		success: (data) ->
			Ti.API.info 'Result success!'
			Ti.UI.createAlertDialog({ title: "Transaction Completed",message: "TransactionId: " + data.transactionId}).show()
		
		error: (data) ->
			Ti.API.info 'Callback error called.'
			Ti.UI.createAlertDialog({title: "Transaction Failed",message: "Error Code: " + data.errorCode + " ; Error Message: " + data.errorMessage}).show()
			
		cancel: (data) ->
			Ti.API.info 'Callback cancel called.'
			Ti.UI.createAlertDialog({title: "Transaction Aborted"}).show()

