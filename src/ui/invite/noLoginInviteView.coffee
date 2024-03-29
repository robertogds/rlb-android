root.noLoginInviteView = Titanium.UI.createView
	backgroundImage: '/images/Texture.jpg'

logoutText = L('invite_sounds_good')
titleText = L('invite_and_win')

noInviteTextView =  new root.GenericTextView(5,titleText,logoutText).view


enterMenu = new root.GenericMenuTable(300,1)
enterRow = new root.GenericRow(L('register_and_invite'))

enterMenu.section.add(enterRow.row)
enterMenu.setData()

enterRow.label.addEventListener 'click', (e) ->
	root.showSignInView('booking')

root.noLoginInviteView.add(noInviteTextView)
root.noLoginInviteView.add(enterMenu.view)