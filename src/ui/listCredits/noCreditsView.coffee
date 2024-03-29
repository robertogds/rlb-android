root.noCreditsView = Titanium.UI.createView
	backgroundImage: '/images/Texture.jpg'

logoutText = L('invite_friends_to_get_credits')
titleText = L('you_have_no_credits')

noCreditsView =  new root.GenericTextView(5,titleText,logoutText).view


enterMenu = new root.GenericMenuTable(300,1)
enterRow = new root.GenericRow(L('invite_your_friends'))

enterMenu.section.add(enterRow.row)
enterMenu.setData()

enterRow.label.addEventListener 'click', (e) ->
	root.tabGroup.setActiveTab(2)
	root.listCreditsWindow.close()

root.noCreditsView.add(noCreditsView)
root.noCreditsView.add(enterMenu.view)