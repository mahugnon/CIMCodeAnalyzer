Class {
	#name : #CIMFunctionInvocationsPresenter,
	#superclass : #CIMRoassalPresenter,
	#category : #'PWBCodeAnalyser-TreeBase-Presenters'
}

{ #category : #examples }
CIMFunctionInvocationsPresenter class >> run [
	<example>
	self new openWithSpec
]

{ #category : #initialization }
CIMFunctionInvocationsPresenter >> drawOn1: aView [
	| es eb  |
	aView @ RTDraggableView @ RTZoomableView.
	es := (RTEllipse new
		size: 15;
		color: Color blue) elementsOn: pbModel.
	aView addAll: es.
	eb := RTEdgeBuilder new.
	eb shape lineDualWidth
		color: Color blue trans;
		withShorterDistanceAttachPoint;
		widthFrom:
				[ :anEdge | (anEdge from pbModel numberOfInvocationToward: anEdge to pbModel) sqrt * 4 ];
		widthTo:
				[ :anEdge | (anEdge to pbModel numberOfInvocationToward: anEdge from pbModel) sqrt * 4 ].
	eb
		view: aView;
		noRepetition;
		noBidirectional;
		connectToAll: [ :each | self adapterFrom: each outgoingInvocationsCandidatesName asSet ].
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
     color: [:elt |  (elt outgoingInvocationsCandidates isEmpty or: [ elt incomingInvocations isEmpty ]) ifTrue: [ Color black ] ifFalse: [ Color blue ] ]) elementsOn: self pbModel.
  
aView addAll: es.
  es @ RTDraggable.
  es @ (RTPopup text: [:method |  (method parentType ifNotNil: [ method parentType name , '.' ] ifNil: [ '' ]) , method name ]).
  es @ (ElementClick new
           model: self guiModel;
           yourself).
  eb := RTEdgeBuilder new.
  eb shape arrowedLine.
  eb
     view: aView;
     highlightable;
     elements: es;
     moveBehind;
     connectToAll: [:each |  self adapterFrom: each outgoingInvocationsCandidates ].
  RTMetricNormalizer new
     elements: es;
     normalizeSize: #cyclomaticComplexity.
  RTTreeLayout new on: aView elements.
  ^aView build
]

{ #category : #initialization }
CIMFunctionInvocationsPresenter >> initializeModel [
	pbModel := CIMMooseModelPresenterModel new
]
