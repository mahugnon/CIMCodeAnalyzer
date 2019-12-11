Class {
	#name : #FunctionMap,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'functionMap',
		'menu',
		'openColorPalette',
		'saveView',
		'resetView',
		'functionMapView',
		'zoomIn',
		'zoomOut'
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
				add: #resetView;
				add: #zoomIn;
				add: #zoomOut;
				yourself)
			withConstraints: [ :constraints | constraints height: self toolbarHeight ];
		yourself;
		add: #functionMap;
		yourself
]

{ #category : #examples }
FunctionMap class >> run [
	<example>
	^ self new openWithSpec
]

{ #category : #specs }
FunctionMap class >> title [ 
^'Function Map'
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
						fillColor: [ :variable | 
							variable tag
								ifNil: [ Color veryVeryLightGray ]
								ifNotNil: [ Color fromHexString: variable tag color ] ];
						elementsOn: (each variables select: [ :var | var name matchesRegex: 'i.*' ])).
			RTMetricNormalizer new elements: group.
			group @ onclick
				@
					(RTShowLabel new
						color: Color blue;
						top;
						yourself).
			RTGridLayout new
				gapSize: 5;
				applyOn: group ].
	RTGridLayout new
		gapSize: 10;
		applyOn: es.
	es @ RTDraggable
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
			functionMapView := aView.
			aView canvas focusOnCenterScaled ]
]

{ #category : #initialization }
FunctionMap >> initializePresenter [
	openColorPalette
		action: [ ColorPalette new
				model: model;
				openWithSpec ].
	saveView action: [ self model saveView ].
	resetView action: [ self model resetView ].
	zoomIn action: [ RTZoomInMove on: functionMapView ].
	zoomOut action: [ RTZoomOutMove on: functionMapView ]
]

{ #category : #initialization }
FunctionMap >> initializeWidgets [
	model := CIMPWBModel new.
	model functionMap: self.
	self initializeFunctionMap.
	openColorPalette := self newButton
		label: 'Open color palette';
		icon: (self iconNamed: #paint).
	saveView := self newButton
		label: 'Save  View';
		icon: (self iconNamed: #glamorousSave).
	resetView := self newButton
		label: 'Reset  View';
		icon: (self iconNamed: #glamorousRestart).
	zoomIn := self newButton
		label: 'Zoom In';
		icon: (self iconNamed: #glamorousZoomIn).
	zoomOut := self newButton
		label: 'Zoom Out';
		icon: (self iconNamed: #glamorousZoomOut)
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

{ #category : #accessing }
FunctionMap >> view [
	^ functionMapView
]
