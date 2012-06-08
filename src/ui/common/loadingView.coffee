root.loadingView = Titanium.UI.createView
  backgroundColor: '#000'
  borderWidth: 0
  borderRadius: 10
  opacity: 0.8
  width:140
  height:150
  top: '30%'


root.androidActInd = Titanium.UI.createActivityIndicator
	height:50
	width:10
	message: Ti.Locale.getString('loading')


root.showLoading = (window,text) ->
	if text isnt undefined
		root.androidActInd.message = text
	else
		root.androidActInd.message = Ti.Locale.getString('loading')
	root.androidActInd.show()

root.hideLoading = () ->
    root.androidActInd.hide()  
    

