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
		connectToAll:
				[ :each | (each outgoingInvocations flatCollect: #candidates) asSet ].
	RTMetricNormalizer new
		elements: es;
		normalizeSize: #numberOfLinesOfCode.
	RTForceBasedLayout new on: aView elements.
	^ aView
]

{ #category : #initialization }
CIMFunctionInvocationsPresenter >> initializeModel [
	model := (MooseModel root first allWithType: FamixPWBFunction)
		sorted: [ :a :b | a numberOfLinesOfCode > b numberOfLinesOfCode ]
]
