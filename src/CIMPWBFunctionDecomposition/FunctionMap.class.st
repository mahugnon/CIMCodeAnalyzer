Class {
	#name : #FunctionMap,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'functionMap',
		'colorPalette',
		'pickColor'
	],
	#category : #CIMPWBFunctionDecomposition
}

{ #category : #specs }
FunctionMap class >> defaultSpec [
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newVertical
				add: #pickColor
					withConstraints: [ :c | c height: self labelHeight ];
				add: #colorPalette;
				yourself)
			withConstraints: [ :c | c height: 300 ];
		add: #functionMap;
		yourself
]

{ #category : #examples }
FunctionMap class >> run [
	<example>
	^ self new openWithSpec
]

{ #category : #accessing }
FunctionMap >> colorPalette [
	| v |
	v := RTView new.
	v @ RTDraggableView.
	RTCPQualitative new viewOn: v.
	^ v
]

{ #category : #initialization }
FunctionMap >> drawColorPalette: aView [
	| colorClick |
	colorClick := ColorClick new model: self model.
	RTCPQualitative new viewOn: aView.
	aView elements @ colorClick.
	^ aView
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
FunctionMap >> initializeColorPalette [
	colorPalette := self instantiate: RoassalModel.
	colorPalette
		script: [ :aView :canvas | 
			self drawColorPalette: aView.
			aView canvas focusOnCenterScaled ]
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
FunctionMap >> initializeWidgets [
	model := CIMPWBModel new.
	model functionMap: self.
	self initializeFunctionMap.
	self initializeColorPalette.
	pickColor := self newLabel label: 'Pick a color'
]

{ #category : #accessing }
FunctionMap >> model [
	^ model
]
