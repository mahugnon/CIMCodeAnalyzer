Class {
	#name : #ColorClick,
	#superclass : #RTInteraction,
	#instVars : [
		'model'
	],
	#category : #CIMPWBFunctionDecomposition
}

{ #category : #hooks }
ColorClick >> initializeElement: element [
	element announcer
		when: TRMouseClick
		do: [ self model pickedColor: element model ]
]

{ #category : #accessing }
ColorClick >> model [
	^ model
]

{ #category : #accessing }
ColorClick >> model: anObject [
	model := anObject
]
