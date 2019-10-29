Class {
	#name : #CIMMooseModelPresenterModel,
	#superclass : #Object,
	#instVars : [
		'pbModel',
		'selected',
		'selectionListeners'
	],
	#category : #'PWBCodeAnalyser-Models'
}

{ #category : #initialization }
CIMMooseModelPresenterModel >> initialize [
	super initialize.
	selectionListeners := OrderedCollection new.
	pbModel := CIMCodeAnalyserBasicAdapter
		adapt: (MooseModel root first allWithType: FamixPWBUserObject)
]

{ #category : #accessing }
CIMMooseModelPresenterModel >> notifySelectionListener [
	selectionListeners do: #updateWithSelection
]

{ #category : #accessing }
CIMMooseModelPresenterModel >> pbModel [
	^ pbModel
]

{ #category : #accessing }
CIMMooseModelPresenterModel >> pbModel: anObject [
	pbModel := anObject
]

{ #category : #api }
CIMMooseModelPresenterModel >> roassal [
	^ selected roassalPresenter
]

{ #category : #accessing }
CIMMooseModelPresenterModel >> selected [
	^ selected
]

{ #category : #accessing }
CIMMooseModelPresenterModel >> selected: anObject [
	selected := anObject.
	self notifySelectionListener
]

{ #category : #api }
CIMMooseModelPresenterModel >> subscribeToSelectionChannel: aCIMMainPresenter [
	selectionListeners add: aCIMMainPresenter
]
