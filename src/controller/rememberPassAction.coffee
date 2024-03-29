root.xhrRemember = Titanium.Network.createHTTPClient(timeout:15000)

root.xhrRemember.onerror = (e) ->
	root.hideLoading()
	root.showError()
	Ti.API.error(e)

root.xhrRemember.onload = (e) ->
	root.hideLoading()
	response = JSON.parse(this.responseText)
	if response.status is 200
		root.rememberPassWindow.close()
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:response.detail}).show()
	else
		alert('Error: ' + response.detail)

root.doRememberPass = (email) ->
	root.xhrRemember.open("POST",root.url+"/users/remember")
	root.xhrRemember.setRequestHeader("Content-Type","application/json; charset=utf-8")
	root.xhrRemember.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
	root.xhrRemember.send(JSON.stringify({"email":email}))