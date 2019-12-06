Class {
	#name : #CIMPWBModel,
	#superclass : #Object,
	#instVars : [
		'selectedVariable',
		'functionMap',
		'functionsModel',
		'pickedColor',
		'colorMap'
	],
	#category : #CIMPWBFunctionDecomposition
}

{ #category : #accessing }
CIMPWBModel >> colorMap [
	^ colorMap
]

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
	self initializePWBFunctionsModel.
	self initializeColorMap
]

{ #category : #initialization }
CIMPWBModel >> initializeColorMap [
	colorMap := OrderedDictionary new
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
CIMPWBModel >> pickedColor: aColor [
	pickedColor := aColor
]

{ #category : #accessing }
CIMPWBModel >> selectedVariable: aFamixPWBVariable [
	selectedVariable := aFamixPWBVariable.
	colorMap at: selectedVariable name put: pickedColor.
	functionMap update
]
