root.inviteView = Titanium.UI.createView
	height: '100%'
	width: '100%'
	background: 'transparent'

inviteTitle = new root.GenericTitleLabel(10,10,L('shareandwin')).label
codeText = new root.GenericTextLabel(50,10, L('use_code')).label

root.codeLabel = new root.GenericBlueTitleLabel(70,10,'').label
explainText = new root.GenericTextLabel(110,10, L('reward_friend')).label

optionsMenu = new root.GenericMenuTable(220,3)
root.inviteFacebookRow = new root.GenericRow( L('invite_fb'))
root.inviteTwitterRow = new root.GenericRow( L('invite_twitter'))
root.inviteEmailRow = new root.GenericRow( L('invite_email'))

optionsMenu.section.add(root.inviteFacebookRow.row)
optionsMenu.section.add(root.inviteTwitterRow.row)
optionsMenu.section.add(root.inviteEmailRow.row)

optionsMenu.setData()

root.inviteView.add(inviteTitle)
root.inviteView.add(codeText)
root.inviteView.add(root.codeLabel)
root.inviteView.add(explainText)
root.inviteView.add(optionsMenu.view)