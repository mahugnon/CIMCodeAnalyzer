Class {
	#name : #CIMMainPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'modelPresenter',
		'diagramPresenter',
		'model',
		'statisticPresenter'
	],
	#category : #'PWBCodeAnalyser-TreeBase-Presenters'
}

{ #category : #utility }
CIMMainPresenter class >> createIcon [
	ThemeIcons
		compile:
			'callTreeContent
	^ '''
				,
					(Base64MimeConverter
						mimeEncode: '/Users/honore/Dropbox/icon1.png' asFileReference binaryReadStream)
						contents , ''''
		classified: '*PWBCodeAnalyser'.
	ThemeIcons
		compile:
			'callTreeIcon
	^ icons
			at: #''callTreeIcon''
			ifAbsentPut:[ Form fromBinaryStream: self callTreeContent base64Decoded asByteArray readStream ]'
		classified: '*PWBCodeAnalyser'.
	Smalltalk ui icons callTreeIcon
]

{ #category : #specs }
CIMMainPresenter class >> defaultSpec [
	^ SpPanedLayout newHorizontal
		add: #modelPresenter;
		add: #diagramPresenter;
		yourself
]

{ #category : #'as yet unclassified' }
CIMMainPresenter class >> lunchCallTree: aBuilder [
	<worldMenu>
	(aBuilder item: #LaunchPWBCallTree)
		order: 10;
		help:
			'Lauch call Powerbuider methods call tree. You should install a PowerbuilderMooseModel in the image';
		label: 'PWB callTree';
		iconName: #callTreeIcon;
		action: [ self run ]
]

{ #category : #running }
CIMMainPresenter class >> run [
	<example>
	^ self new openWithSpec
]

{ #category : #'as yet unclassified' }
CIMMainPresenter class >> title [
^'Izy view'
]

{ #category : #initialization }
CIMMainPresenter >> initializeRoassal [
	diagramPresenter := self newLabel.
	diagramPresenter label: 'Visualization here'
]

{ #category : #initialization }
CIMMainPresenter >> initializeWidgets [
	modelPresenter := self instantiate: CIMMooseModelPresenter.
	model := modelPresenter pbModel.
	model subscribeToSelectionChannel: self.
	self initializeRoassal
]

{ #category : #'as yet unclassified' }
CIMMainPresenter >> lunchCallTree: aBuilder [
	<worldMenu>
	(aBuilder item: #LaunchPWBCallTree) action: [ self run ]
]

{ #category : #'as yet unclassified' }
CIMMainPresenter >> updateRoassal [
  diagramPresenter := self instantiate: model roassal.
  diagramPresenter guiModel: model.
  self needRebuild: false.
  self buildWithSpec
  "self
		instantiatePresenters:
			{#diagramPresenter.
			model roassal name asSymbol}.
	diagramPresenter pbModel: model selected content."
]

{ #category : #api }
CIMMainPresenter >> updateWithSelection [
	self updateRoassal
]
