scrollView = Ti.UI.createScrollView
	contentHeight: 'auto'
	scrollType: 'vertical'
	showVerticalScrollIndicator: true
	height: '100%'
	width: '100%'


root.optionsView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  height: 700
  width: '100%'
  top: 0

versionLabel = Titanium.UI.createLabel
  borderWidth: 1
  borderColor: '#868d92'
  backgroundColor: '#16232b'
  borderRadius: 5
  text: 'Version: ' + Titanium.App.version
  color: '#868d92'
  textAlign: 'center'
  font:
    fontSize: 14
    #fontWeight: 'bold'
  height: 20
  width: 120
  top: 650

versionLabel.addEventListener 'click', (e) ->
	Ti.API.info 'Hace clic en version'
	root.tabGroup.tabs[root.optionsTab.pos].open(root.testWindow,{animated:true})


optionsMenu1 = new root.GenericMenuTable(150,3)
supportRow = new root.GenericRow(L('userSupport'))
faqRow = new root.GenericRow('FAQ')
toHotelsRow = new root.GenericRow(L('toHotels'))

optionsMenu1.section.add(supportRow.row)
optionsMenu1.section.add(faqRow.row)
optionsMenu1.section.add(toHotelsRow.row)
optionsMenu1.setData()

faqRow.label.addEventListener 'click', (e) ->
	root.showFAQ()

supportRow.label.addEventListener 'click', (e) ->
	root.tabGroup.tabs[root.optionsTab.pos].open(root.supportWindow,{animated:true})

toHotelsRow.label.addEventListener 'click', (e) ->
	root.tabGroup.tabs[root.optionsTab.pos].open(root.forHotelsWindow,{animated:true})

optionsMenu2 = new root.GenericMenuTable(310,3)
facebookRow = new root.GenericRow(L('shareFacebook'))
twitterRow = new root.GenericRow(L('shareTwitter'))
emailRow = new root.GenericRow(L('shareEmail'))

optionsMenu2.section.add(facebookRow.row)
optionsMenu2.section.add(twitterRow.row)
optionsMenu2.section.add(emailRow.row)
optionsMenu2.setData()

facebookRow.label.addEventListener 'click', (e) ->
	#root.sharekit.share
	#	title: 'ReallyLateBooking'
	#	text: L('shareRLBFacebook')
	#	sharer: 'Facebook'
	Ti.API.info 'LLAMANDO A SHARE TWITTER'
	root.shareToFB()

twitterRow.label.addEventListener 'click', (e) ->
	Ti.API.info 'LLAMANDO A SHARE TWITTER'
	root.shareToTwitter(L('shareRLBTwitter'))

emailRow.label.addEventListener 'click', (e) ->
	emailDialog = Titanium.UI.createEmailDialog()
	emailDialog.subject = L('shareRLBEmailSubject')
	emailDialog.messageBody = L('shareRLBEmail')
	emailDialog.open()

optionsMenu3 = new root.GenericMenuTable(470,3)
aboutRow = new root.GenericRow(L('aboutRLB'))
termsRow = new root.GenericRow(L('terms'))
privacyRow = new root.GenericRow(L('privacyPolicy'))

optionsMenu3.section.add(aboutRow.row)
optionsMenu3.section.add(termsRow.row)
optionsMenu3.section.add(privacyRow.row)
optionsMenu3.setData()

aboutRow.label.addEventListener 'click', (e) ->
	aboutView =  new root.GenericTextView(0,L('aboutTitle'),L('aboutText')).view
	root.aboutScrollView.add(aboutView)
	root.tabGroup.tabs[root.optionsTab.pos].open(root.aboutWindow,{animated:true})

termsRow.label.addEventListener 'click', (e) ->
	root.showTerms()

privacyRow.label.addEventListener 'click', (e) ->
	root.showPrivacy()


root.optionsView.add(root.accountView)
root.optionsView.add(optionsMenu1.view)
root.optionsView.add(optionsMenu2.view)
root.optionsView.add(optionsMenu3.view)

root.optionsView.add(versionLabel)
#root.optionsView.add(socialView)
scrollView.add(root.optionsView)
root.optionsWindow.add(scrollView)