Class {
	#name : #CIMMainPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'modelPresenter',
		'diagramPresenter',
		'model',
		'statisticPresenter',
		'searchField',
		'menu'
	],
	#category : #'PWBCodeAnalyser-TreeBase-Presenters'
}

{ #category : #utility }
CIMMainPresenter class >> createIcon [
	ThemeIcons
		compile:
			'callTreeContents
	^ '''
				,
					(Base64MimeConverter
						mimeEncode:
							'/Users/honore/Downloads/function.png' asFileReference
								binaryReadStream) contents , ''''
		classified: '*PWBCodeAnalyser'.
	ThemeIcons
		compile:
			'callGraphIcon
	^ icons
			at: #''callGraphIcon''
			ifAbsentPut:[ Form fromBinaryStream: self callTreeContents base64Decoded asByteArray readStream ]'
		classified: '*PWBCodeAnalyser'.
	Smalltalk ui icons callGraphIcon
]

{ #category : #specs }
CIMMainPresenter class >> defaultSpec [
  ^SpPanedLayout newHorizontal
     add: (SpBoxLayout newVertical
           add: #searchField withConstraints: [:constraints |  constraints height: self toolbarHeight ];
           add: #modelPresenter;
           yourself);
     add: (SpBoxLayout newVertical
           add: #menu withConstraints: [:constraints |  constraints height: self toolbarHeight ];
           add: #diagramPresenter;
           yourself);
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
		iconName: #callGraphIcon;
		action: [ self run ]
]

{ #category : #running }
CIMMainPresenter class >> run [
  < example>
  ^self new openWithSpec
]

{ #category : #'as yet unclassified' }
CIMMainPresenter class >> title [
^'Izy view'
]

{ #category : #initialization }
CIMMainPresenter >> initializePresenters [
  searchField whenTextIsAcceptedDo: [:text |  modelPresenter searchFor: text ]
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
  searchField := self newTextInput
     placeholder: 'rechercher dans le model ...';
     yourself.
  searchField acceptOnCR: true.
  self initializeRoassal.
  menu := self instantiate: CIMMainMenu
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
