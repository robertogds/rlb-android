root.creditsView = Titanium.UI.createView
	height: '100%'
	width: '100%'
	background: 'transparent'

root.explainCreditsView = Titanium.UI.createView
	height:300
	borderWidth:0
	boderColor: 'grey'
	top: 160
	

explainText = new root.GenericTextLabel(10,10, L('credits_invite_hurryup')).label
root.explainCreditsView.add(explainText)

optionsMenu = new root.GenericMenuTable(110,2)
historyRow = new root.GenericRow(L('see_credits_history'))
inviteRow = new root.GenericRow(L('invite_more_friends'))

optionsMenu.section.add(historyRow.row)
optionsMenu.section.add(inviteRow.row)
optionsMenu.setData() 

historyRow.label.addEventListener 'click', (e) ->
	root.tabGroup.tabs[root.creditsTab.pos].open(root.listCreditsWindow,{animated:true})

inviteRow.label.addEventListener 'click', (e) ->
	root.tabGroup.setActiveTab(2)
	root.creditsWindow.close()

root.explainCreditsView.add(optionsMenu.view)

root.creditsView.add(root.newCouponView)
root.creditsView.add(root.balanceView)
root.creditsView.add(root.explainCreditsView)