Class {
	#name : #VariableClick,
	#superclass : #RTInteraction,
	#instVars : [
		'model'
	],
	#category : #CIMPWBFunctionDecomposition
}

{ #category : #hooks }
VariableClick >> initializeElement: element [
  element announcer when: TRMouseClick do: [ self model openColorForm.
        self model selectedVariable: element model ]
]

{ #category : #hooks }
VariableClick >> model [
	^ model
]

{ #category : #accessing }
VariableClick >> model: anObject [
	model := anObject
]
