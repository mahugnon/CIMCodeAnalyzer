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
CIMUserObjectReferencesPresenter >> drawOn1: aView [
  | userObjects userObjectElement userObjectElements shapeBuilder methods methodElements |
  aView @ RTDraggableView.
  shapeBuilder := RTShapeBuilder new.
  shapeBuilder rectangle size: [:m |  m numberOfLinesOfCode min: 60 max: 5 ].
  userObjectElements := RTGroup new.
  userObjects := self pbModel collect: #pbModel.
  userObjects do: [:userObject |  userObjectElement := (RTBox new color: (Color blue alpha: 0.4)) elementOn: userObject.
        userObjectElement @ RTPopup.
        aView add: userObjectElement.
        methods := userObject methods.
        methodElements := shapeBuilder elementsOn: methods.
        aView addAll: methodElements.
        RTEdgeBuilder new
           view: aView;
           objects: methods;
           connectFrom: #yourself toAll: [:m |  m outgoingInvocations flatCollectAsSet: #candidates ].
        RTTreeLayout on: methodElements.
        methodElements @ RTDraggable @ RTPopup.
        RTNest new on: userObjectElement nest: methodElements.
        userObjectElement @ RTDraggable.
        userObjectElements add: userObjectElement ].
  RTEdgeBuilder new
     view: aView;
     shape: (RTLine new attachPoint: RTVerticalAttachPoint instance);
     objects: userObjects;
     connectToAll: [:each |  each incomingReferences collect: #from ].
  RTTreeLayout on: userObjectElements.
  ^aView
]

{ #category : #initialization }
CIMUserObjectReferencesPresenter >> drawOn: aView [
	| es eb |
	aView @ RTDraggableView @ RTZoomableView.
	es := (RTEllipse new
		color: [ :elt | 
			elt incomingReferences isEmpty
				ifTrue: [ Color green ]
				ifFalse: [ Color blue ] ])
		elementsOn: (self pbModel collect: #pbModel).
	aView addAll: es.
	es @ RTDraggable.
	es
		@
			(ElementClick new
				model: self guiModel;
				yourself).
	es
		@
			((RTLabeled new text: #name)
				fontSize: 3;
				top).
	eb := RTEdgeBuilder new.
	eb shape arrowedLine.
	eb
		view: aView;
		highlightable;
		elements: es;
		moveBehind;
		connectFromAll: [ :each | each incomingReferences collect: #from ].
	RTMetricNormalizer new
		elements: es;
		normalizeSize: #numberOfMethods;
		normalizeColor: #numberOfLinesOfCode.
	RTTreeLayout new on: aView elements.
	^ aView build
]
