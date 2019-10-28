Class {
	#name : #CIMFunctionInvocationsPresenter,
	#superclass : #CIMRoassalPresenter,
	#category : #'PWBCodeAnalyser-Presenters'
}

{ #category : #examples }
CIMFunctionInvocationsPresenter class >> run [
	<example>
	self new openWithSpec
]

{ #category : #'as yet unclassified' }
CIMFunctionInvocationsPresenter >> adapterFrom: aCollection [
	^ model select: [ :each | aCollection includes: each name ]
]

{ #category : #initialization }
CIMFunctionInvocationsPresenter >> drawOn1: aView [
	| es eb  |
	aView @ RTDraggableView @ RTZoomableView.
	es := (RTEllipse new
		size: 15;
		color: Color blue) elementsOn: model.
	aView addAll: es.
	eb := RTEdgeBuilder new.
	eb shape lineDualWidth
		color: Color blue trans;
		withShorterDistanceAttachPoint;
		widthFrom:
				[ :anEdge | (anEdge from model numberOfInvocationToward: anEdge to model) sqrt * 4 ];
		widthTo:
				[ :anEdge | (anEdge to model numberOfInvocationToward: anEdge from model) sqrt * 4 ].
	eb
		view: aView;
		noRepetition;
		noBidirectional;
		connectToAll: [ :each | self adapterFrom: each outgoingInvocationsCandidates asSet ].
	RTMetricNormalizer new
		elements: es;
		normalizeSize: [ :e | 
			e numberOfLinesOfCode < 0
				ifTrue: [ 1 ]
				ifFalse: [ e numberOfLinesOfCode ] ]
			using: #sqrt.
	RTCircleLayout new on: aView elements.
	^ aView
]

{ #category : #initialization }
CIMFunctionInvocationsPresenter >> drawOn: aView [
	| es eb |
	aView @ RTDraggableView @ RTZoomableView.
	es := (RTEllipse new
		size: 15;
		color: Color blue) elementsOn: model.
	aView addAll: es.
	es @ RTDraggable @ RTPopup.
	eb := RTEdgeBuilder new.
	eb
		view: aView;
		elements: es;
		moveBehind;
		connectToAll: [ :each | self adapterFrom: each outgoingInvocationsCandidates asSet ].
	RTMetricNormalizer new
		elements: es;
		normalizeSize: #numberOfLinesOfCode.
	RTTreeLayout new on: aView elements.
	^ aView
]

{ #category : #initialization }
CIMFunctionInvocationsPresenter >> initializeModel [
	model := (CIMCodeAnalyserBasicAdapter
		adapt:
			((MooseModel root first allWithType: FamixPWBFunction)
				sorted: [ :a :b | a numberOfLinesOfCode > b numberOfLinesOfCode ]))
		content
]
