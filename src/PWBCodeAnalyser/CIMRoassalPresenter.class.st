Class {
	#name : #CIMRoassalPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'diagram'
	],
	#category : #'PWBCodeAnalyser-Presenters'
}

{ #category : #specs }
CIMRoassalPresenter class >> defaultSpec [
	^ SpPanedLayout newVertical
		add: #diagram;
		yourself
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
CIMRoassalPresenter >> initializeModel [
	^ self subclassResponsibility
]

{ #category : #initialization }
CIMRoassalPresenter >> initializeWidgets [
	self initializeModel.
	self initializeDiagram
]
