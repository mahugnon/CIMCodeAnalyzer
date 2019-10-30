Class {
	#name : #CIMRoassalPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'diagram',
		'inputPort',
		'pbModel'
	],
	#category : #'PWBCodeAnalyser-Presenters'
}

{ #category : #specs }
CIMRoassalPresenter class >> defaultSpec [
	^ SpPanedLayout newHorizontal
		add: #diagram;
		yourself
]

{ #category : #'as yet unclassified' }
CIMRoassalPresenter >> adapterFrom: aCollection [
	^ pbModel select: [ :each | aCollection includes: each name ]
]

{ #category : #accessing }
CIMRoassalPresenter >> diagram [
	^ diagram
]

{ #category : #accessing }
CIMRoassalPresenter >> diagram: anObject [
	diagram := anObject
]

{ #category : #initialization }
CIMRoassalPresenter >> drawOn: aView [
	^ self subclassResponsibility
]

{ #category : #initialization }
CIMRoassalPresenter >> initializeDiagram [
	diagram := self instantiate: RoassalModel.
	diagram
		script: [ :aView :canvas | 
			self drawOn: aView.
			aView canvas focusOnCenterScaled]
]

{ #category : #initialization }
CIMRoassalPresenter >> initializeInputPort [
	inputPort := SpModelPort new
]

{ #category : #initialization }
CIMRoassalPresenter >> initializeWidgets [
	self initializeDiagram.
	self initializeInputPort
]

{ #category : #accessing }
CIMRoassalPresenter >> pbModel [
	^ pbModel
]

{ #category : #accessing }
CIMRoassalPresenter >> pbModel: anObject [
	pbModel := anObject
]
