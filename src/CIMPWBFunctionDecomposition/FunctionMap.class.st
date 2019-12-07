Class {
	#name : #FunctionMap,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'functionMap',
		'pickColor'
	],
	#category : #CIMPWBFunctionDecomposition
}

{ #category : #specs }
FunctionMap class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #pickColor
			withConstraints: [ :c | c height: self labelHeight ];
		yourself;
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
	pickColor
		action: [ ColorPalette new
				model: model;
				openWithSpec ]
]

{ #category : #initialization }
FunctionMap >> initializeWidgets [
	model := CIMPWBModel new.
	model functionMap: self.
	self initializeFunctionMap.
	pickColor := self newButton label: 'Pick a color'
]

{ #category : #accessing }
FunctionMap >> model [
	^ model
]
