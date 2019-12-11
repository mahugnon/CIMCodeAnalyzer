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
	#classInstVars : [
		'colorMap',
		'current'
	],
	#category : #CIMPWBFunctionDecomposition
}

{ #category : #accessing }
CIMPWBModel class >> colorMap [
	^ colorMap
]

{ #category : #accessing }
CIMPWBModel class >> colorMap: anObject [
	colorMap := anObject
]

{ #category : #accessing }
CIMPWBModel class >> current [
	current ifNil: [ current := self new ].
	^ current
]

{ #category : #initialization }
CIMPWBModel class >> initializeColorMap [
	<script>
	colorMap := OrderedDictionary new
]

{ #category : #accessing }
CIMPWBModel class >> resetCurrent [
	<script>
	current := self new
]

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
colorMap := self class  colorMap  
	 
]

{ #category : #drawing }
CIMPWBModel >> initializePWBFunctionsModel [
	functionsModel := ((MooseModel root first
		allWithType: FamixPWBFunction)
		select: [ :each | 
			(each variables select: [ :var | var name matchesRegex: 'i.*' ])
				isNotEmpty ]) asSet sorted: [ :a :b | a name < b name ]
]

{ #category : #accessing }
CIMPWBModel >> pickedColor: aColor [
	pickedColor := aColor
]

{ #category : #'as yet unclassified' }
CIMPWBModel >> resetView [
	self class initializeColorMap.
	self initializeColorMap.
	functionMap update
]

{ #category : #'as yet unclassified' }
CIMPWBModel >> saveView [
	self class colorMap: colorMap
]

{ #category : #accessing }
CIMPWBModel >> selectedVariable: aFamixPWBVariable [
	| tag |
	selectedVariable := aFamixPWBVariable name.
	tag := FamixPWBTag new
		color: pickedColor asHexString;
		yourself.
	(QueryPWBInstanceVariablesWithSameName new
		runOn: functionsModel
		with: aFamixPWBVariable name)
		do: [ :var | 
			var tag: tag.
			tag entities add: var ].
	aFamixPWBVariable mooseModel add: tag.
	functionMap update
]
