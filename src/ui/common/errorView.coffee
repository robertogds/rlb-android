errorCloseButton = new root.GenericButton(290,L('tryAgain')).button

title = L('errorHappened')
text = L('conectionError')

root.errorView =  new root.GenericTextView(0,title,text).view
root.errorView.height = '100%'
root.errorView.add(errorCloseButton)

errorCloseButton.addEventListener 'click', (e) ->
	root.errorWindow.remove(root.errorView)

root.showError = (window) ->
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('conectionError')}).show()

root.hideError = (window) ->
	window.remove(root.errorView)