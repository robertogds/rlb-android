root.testWindow = new root.GenericWindow('RLB Team').win
root.testView = Titanium.UI.createView
	background: 'transparent'

rlbTeamImage = Titanium.UI.createImageView
	image:'/images/rlb_team.jpg'

root.testView.add(rlbTeamImage)
root.testWindow.add(root.testView)

#Ti.include('/js/cobrarView.js')