Class {
	#name : #CIMMainPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'modelPresenter',
		'diagramPresenter',
		'model'
	],
	#category : #'PWBCodeAnalyser-Presenters'
}

{ #category : #specs }
CIMMainPresenter class >> defaultSpec [
	^ SpPanedLayout newHorizontal
		add: #modelPresenter;
		add: #diagramPresenter;
		yourself
]

{ #category : #running }
CIMMainPresenter class >> run [
	<example>
	^ self new openWithSpec
]

{ #category : #initialization }
CIMMainPresenter >> initializeRoassal [
	diagramPresenter := self newLabel.
	diagramPresenter label: 'Visualization here'
]

{ #category : #initialization }
CIMMainPresenter >> initializeWidgets [
	modelPresenter := self instantiate: CIMMooseModelPresenter.
	model := modelPresenter pbModel.
	model subscribeToSelectionChannel: self.
	self initializeRoassal
]

{ #category : #'as yet unclassified' }
CIMMainPresenter >> updateRoassal [
	diagramPresenter := self instantiate: model roassal.
	diagramPresenter pbModel: model selected content.
	self needRebuild: false.
	self buildWithSpec

	"self
		instantiatePresenters:
			{#diagramPresenter.
			model roassal name asSymbol}.
	diagramPresenter pbModel: model selected content."
]

{ #category : #api }
CIMMainPresenter >> updateWithSelection [
	self updateRoassal
]