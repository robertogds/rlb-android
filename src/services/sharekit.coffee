root.shareToTwitter = (text) ->
	try
		Ti.API.info 'Entra en shareToTwitter'
		intTwitter = Ti.Android.createIntent
			action: Ti.Android.ACTION_SEND
			packageName: "com.twitter.android"
			className: "com.twitter.android.PostActivity"
			flags: Ti.Android.FLAG_ACTIVITY_NEW_TASK
			type: "text/plain"
		intTwitter.putExtra( Ti.Android.EXTRA_TEXT, text)
		Ti.Android.currentActivity.startActivity( intTwitter )
	catch error 
		alert 'Twitter app is not installed: ' + error


root.shareToFB = () ->
	try
		Ti.API.info 'Entra en shareToFB'
		intFB = Ti.Android.createIntent
			action: Ti.Android.ACTION_SEND
			packageName: "com.facebook.katana"
			className: "com.facebook.katana.ShareLinkActivity"
			flags: 0x30000000
			type: "text/plain"
		intFB.putExtra( Ti.Android.EXTRA_TEXT, "http://club.reallylatebooking.com") 
		intFB.addCategory( Ti.Android.CATEGORY_LAUNCHER )
		Ti.Android.currentActivity.startActivity( intFB )
	catch error 
		alert 'Facebook app is not installed: ' + error
	
	
	