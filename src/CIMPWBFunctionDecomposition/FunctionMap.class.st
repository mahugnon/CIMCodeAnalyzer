Class {
	#name : #FunctionMap,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'functionMap',
		'menu',
		'openColorPalette',
		'saveView',
		'resetView'
	],
	#category : #CIMPWBFunctionDecomposition
}

{ #category : #specs }
FunctionMap class >> defaultSpec [
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #openColorPalette;
				add: #saveView;
				add:#restView;
				yourself)
			withConstraints: [ :constraints | constraints height: self toolbarHeight ] yourself;
		add: #functionMap;
		yourself
]

{ #category : #examples }
FunctionMap class >> run [
	<example>
	^ self new openWithSpec
]

{ #category : #drawing }
FunctionMap >> drawFunctionMap: aView [
	| es onclick |
	onclick := VariableClick new model: model.
	aView @ RTDraggableView @ RTZoomableView.
	es := (RTBox new
		fillColor: Color white;
		borderColor: Color gray) elementsOn: model functionModel.
	aView addAll: es.
	RTNest new
		for: es
		add: [ :group :each | 
			group
				addAll:
					(RTBox new
						fillColor:
								[ :variable | model colorMap at: variable name ifAbsent: [ Color veryVeryLightGray ] ];
						elementsOn: (each variables select: [ :var | var name matchesRegex: 'i.*' ])).
			RTMetricNormalizer new elements: group.
			group @ onclick.
			RTGridLayout new
				gapSize: 5;
				applyOn: group ].
	RTGridLayout new
		gapSize: 10;
		applyOn: es.
	es
		@
			(RTShowLabel new
				color: Color red;
				top;
				yourself).
	^ aView
]

{ #category : #initialization }
FunctionMap >> initializeFunctionMap [
	functionMap := self instantiate: RoassalModel.
	functionMap
		script: [ :aView :canvas | 
			self drawFunctionMap: aView.
			aView canvas focusOnCenterScaled ]
]

{ #category : #initialization }
FunctionMap >> initializePresenter [
	openColorPalette
		action: [ ColorPalette new
				model: model;
				openWithSpec ].
	saveView action: [ self model saveView ].
	resetView action: [ self model resetView ]
]

{ #category : #initialization }
FunctionMap >> initializeWidgets [
	model := CIMPWBModel new.
	model functionMap: self.
	self initializeFunctionMap.
	openColorPalette := self newButton label: 'Open color palette'.
	saveView := self newButton  label:'Save  View'.
	resetView := self newButton  label:'Save  View'.
]

{ #category : #accessing }
FunctionMap >> model [
	^ model
]

{ #category : #initialization }
FunctionMap >> subMenu [
	^ self newMenu
		addItem: [ :item | 
			item
				name: 'Open';
				icon: (self iconNamed: #openIcon);
				shortcut: $o meta;
				action: [ self inform: 'Open' ] ];
		addItem: [ :item | 
			item
				name: 'Save';
				icon: (self iconNamed: #smallSaveIcon);
				shortcut: $s meta;
				action: [ self inform: 'Save' ] ];
		addItem: [ :item | 
			item
				name: 'Print';
				shortcut: $p meta;
				icon: (self iconNamed: #smallPrintIcon);
				action: [ self inform: 'Print' ] ];
		addItem: [ :item | 
			item
				name: 'Kill';
				shortcut: $k meta;
				icon: (self iconNamed: #smallCancelIcon);
				action: [ self inform: 'Kill' ] ];
		yourself
]
