Class {
	#name : #CIMPWBModel,
	#superclass : #Object,
	#instVars : [
		'selectedVariable',
		'functionMap',
		'functionsModel'
	],
	#category : #CIMPWBFunctionDecomposition
}

{ #category : #accessing }
CIMPWBModel >> functionMap: aFunctionMap [ 
	functionMap := aFunctionMap
]

{ #category : #'as yet unclassified' }
CIMPWBModel >> functionModel [
	^ functionsModel
]

{ #category : #drawing }
CIMPWBModel >> initialize [
	super initialize.
	self initializePWBFunctionsModel
]

{ #category : #drawing }
CIMPWBModel >> initializePWBFunctionsModel [
	functionsModel := (MooseModel root first
		allWithType: FamixPWBFunction)
		select: [ :each | 
			(each variables select: [ :var | var name matchesRegex: 'i.*' ])
				isNotEmpty ]
]

{ #category : #accessing }
CIMPWBModel >> selectedVariable: aFamixPWBVariable [
	selectedVariable := aFamixPWBVariable.
	^ functionMap colorPalette
]
