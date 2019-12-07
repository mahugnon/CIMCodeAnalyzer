Class {
	#name : #ColorPalette,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'palette',
		'paletteOptions',
		'selectedPalette'
	],
	#category : #CIMPWBFunctionDecomposition
}

{ #category : #specs }
ColorPalette class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #paletteOptions
			withConstraints: [ :constraints | constraints height: self toolbarHeight ];
		add: #palette;
		yourself
]

{ #category : #specs }
ColorPalette class >> title [
	
	^ 'Color palette'
]

{ #category : #'as yet unclassified' }
ColorPalette >> defaultPalette [
	^ RTCPQualitative
]

{ #category : #initialization }
ColorPalette >> drawColorPalette: aView [
	| colorClick |
	colorClick := ColorClick new model: self model.
	selectedPalette new viewOn: aView.
	aView elements @ colorClick.
	^ aView
]

{ #category : #initialization }
ColorPalette >> initializeColorPalette [
	selectedPalette := self defaultPalette.
	palette := self instantiate: RoassalModel.
	palette
		script: [ :aView :canvas | 
			self drawColorPalette: aView.
			aView canvas focusOnCenterScaled ]
]

{ #category : #initialization }
ColorPalette >> initializePaletteOption [
	paletteOptions := self newDropList.
	paletteOptions
		items: RTColorPalette subclasses;
		selectItem: selectedPalette
]

{ #category : #initialization }
ColorPalette >> initializePresenters [
	paletteOptions
		whenSelectedItemChangedDo: [ :selected | 
			selectedPalette := selected.
			self update ]
]

{ #category : #initialization }
ColorPalette >> initializeWidgets [
	super initializeWidgets.
	self initializeColorPalette.
	self initializePaletteOption
]

{ #category : #accessing }
ColorPalette >> model [
	^ model
]

{ #category : #accessing }
ColorPalette >> model: anObject [
	model := anObject
]

{ #category : #accessing }
ColorPalette >> palette [
	^ palette
]

{ #category : #accessing }
ColorPalette >> palette: anObject [
	palette := anObject
]
