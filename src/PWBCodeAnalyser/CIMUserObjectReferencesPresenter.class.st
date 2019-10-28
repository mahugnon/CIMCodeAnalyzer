Class {
	#name : #CIMUserObjectReferencesPresenter,
	#superclass : #CIMRoassalPresenter,
	#category : #'PWBCodeAnalyser-Presenters'
}

{ #category : #examples }
CIMUserObjectReferencesPresenter class >> run [
	<example>
	self new openWithSpec
]

{ #category : #initialization }
CIMUserObjectReferencesPresenter >> drawOn: aView [
	| es eb |
	aView @ RTDraggableView @ RTZoomableView.
	es := (RTEllipse new
		color: [ :elt | 
			elt incomingReferences isEmpty
				ifTrue: [ Color green ]
				ifFalse: [ Color blue ] ]) elementsOn: model.
	aView addAll: es.
	es @ RTDraggable @ RTPopup.
	eb := RTEdgeBuilder new.
	eb
		view: aView;
		elements: es;
		moveBehind;
		connectToAll: [ :each | each outgoingReferences collectAsSet: #to ].
	RTMetricNormalizer new
		elements: es;
		normalizeSize: #numberOfMethods;
		normalizeColor: #numberOfLinesOfCode.
	RTForceBasedLayout new on: aView elements.
	aView
]

{ #category : #initialization }
CIMUserObjectReferencesPresenter >> initializeModel [
	model := (MooseModel root first allWithType: FamixPWBUserObject)
		sorted: [ :a :b | a numberOfLinesOfCode > b numberOfLinesOfCode ]
]
