Class {
	#name : #ColorPalette,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'palette'
	],
	#category : #CIMPWBFunctionDecomposition
}

{ #category : #specs }
ColorPalette class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #palette;
		yourself
]

{ #category : #specs }
ColorPalette class >> title [
	
	^ 'Color palette'
]

{ #category : #initialization }
ColorPalette >> drawColorPalette: aView [
	| colorClick |
	colorClick := ColorClick new model: self model.
	RTCPQualitative new viewOn: aView.
	aView elements @ colorClick.
	^ aView
]

{ #category : #initialization }
ColorPalette >> initializeColorPalette [
	palette := self instantiate: RoassalModel.
	palette
		script: [ :aView :canvas | 
			self drawColorPalette: aView.
			aView canvas focusOnCenterScaled ]
]

{ #category : #initialization }
ColorPalette >> initializeWidgets [
	super initializeWidgets.
	self initializeColorPalette
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
