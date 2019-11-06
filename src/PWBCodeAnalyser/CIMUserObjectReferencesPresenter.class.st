Class {
	#name : #CIMUserObjectReferencesPresenter,
	#superclass : #CIMRoassalPresenter,
	#category : #'PWBCodeAnalyser-TreeBase-Presenters'
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
				ifFalse: [ Color blue ] ]) elementsOn: (pbModel collect: #pbModel).
	aView addAll: es.
	es @ RTDraggable @ (RTPopup text: #name).
	eb := RTEdgeBuilder new.
	eb shape arrowedLine.
	eb
		view: aView;
		highlightable;
		elements: es;
		moveBehind;
		connectToAll: [ :each | each incomingReferences collect: #from ].
	RTMetricNormalizer new
		elements: es;
		normalizeSize: #numberOfMethods;
		normalizeColor: #numberOfLinesOfCode.
	RTTreeLayout new on: aView elements.
	^ aView build
]
