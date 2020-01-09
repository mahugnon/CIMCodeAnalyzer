Class {
	#name : #ElementClick,
	#superclass : #RTInteraction,
	#instVars : [
		'model'
	],
	#category : #'PWBCodeAnalyser-Interaction'
}

{ #category : #hooks }
ElementClick >> initializeElement: element [
  element announcer when: TRMouseClick do: [ model mooseModelPresenterSelectedItem: element model ]
]

{ #category : #accessing }
ElementClick >> model: aCollection [ 
	model := aCollection
]
