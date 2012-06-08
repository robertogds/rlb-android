Ti.include(
	'/js/noLoginInviteView.js'
	'/js/inviteView.js'
)

if root.isLogged()
	root.inviteWindow.add(root.inviteView)
else
	root.inviteWindow.add(root.noLoginInviteView)
	
root.inviteWindow.addEventListener 'focus', (e) ->
	Ti.API.info 'Invite pilla el focus'
	if root.isLogged()
		root.loadRefererId()
		root.codeLabel.text = root.user.refererId
		root.inviteWindow.remove(root.noLoginInviteView)
		root.inviteWindow.add(root.inviteView)
		root.inviteFacebookRow.label.addEventListener 'click', (e) ->
			data = 
				link: "http://www.reallylatebooking.com"
				name: 'ReallyLateBooking'
				caption: "reallylatebooking.com"
				description: String.format(L('invite_facebook_body'),root.user.refererId)
			Titanium.Facebook.dialog "feed", data, (e) ->
				if (e.success) 
					#alert("Success!  From FB: " + e.result)
				else 
					if (e.error) 
						alert(e.error)

		root.inviteTwitterRow.label.addEventListener 'click', (e) ->
			root.shareToTwitter(String.format(L('invite_twitter_body'),root.user.refererId))

		root.inviteEmailRow.label.addEventListener 'click', (e) ->
			emailDialog = Titanium.UI.createEmailDialog()
			emailDialog.subject = String.format(L('invite_email_subject'), root.user.firstName)
			emailDialog.messageBody =  String.format(L('invite_email_body'),root.user.refererId)
			emailDialog.open()
	else
		root.inviteWindow.remove(root.inviteView)
		root.inviteWindow.add(root.noLoginInviteView)
	1