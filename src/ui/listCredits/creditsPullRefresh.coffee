tableHeader = new root.PullRefreshHeader()
root.creditsTable.headerPullView = tableHeader.view

pulling = false
reloading = false

beginReloading = () ->
	root.reloadcredits = true
	root.showCreditsConnect()
	setTimeout(endReloading,3000)

endReloading = () ->
	reloading = false
	tableHeader.lastUpdatedLabel.text = L('lastUpdated')+': '+root.formatDate()
	tableHeader.statusLabel.text = L('pullRefresh')+'...'
	tableHeader.actInd.hide()
	tableHeader.arrow.show()

root.creditsTable.addEventListener 'scroll', (e) ->
	if e.y isnt null 
		offset = e.y
	if (offset <= -65.0 && !pulling)
		t = Ti.UI.create2DMatrix()
		t = t.rotate(-180)
		pulling = true
		tableHeader.arrow.animate({transform:t,duration:180})
		tableHeader.statusLabel.text = L('releaseRefresh')+'...' 
	else if (pulling && offset > -65.0 && offset < 0)
		pulling = false
		t = Ti.UI.create2DMatrix()
		tableHeader.arrow.animate({transform:t,duration:180})
		tableHeader.statusLabel.text = L('pullRefresh')+'...'

#root.creditsTable.addEventListener 'scrollEnd', (e) ->
#	if (pulling && !reloading && e.contentOffset.y <= -65.0)
#		reloading = true
#		pulling = false
#		tableHeader.arrow.hide()
#		tableHeader.actInd.show()
#		tableHeader.statusLabel.text = L('reloading')+'...'
#		tableHeader.arrow.transform=Ti.UI.create2DMatrix()
#		beginReloading()