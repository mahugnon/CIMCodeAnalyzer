Class {
	#name : #TagForm,
	#superclass : #SpPresenter,
	#instVars : [
		'formLabel',
		'formInput',
		'formColorPaletteButton',
		'model'
	],
	#category : #CIMPWBFunctionDecomposition
}

{ #category : #specs }
TagForm class >> defaultSpec [
  ^SpBoxLayout newVertical
     add: (SpBoxLayout newHorizontal
           add: #formLabel;
           add: #formInput withConstraints: [:constraints |  constraints
                 height: 150;
                 width: 100 ];
           add: #formColorPaletteButton;
           yourself) withConstraints: [:constraints |  constraints height: self toolbarHeight; width: 10 ];
     yourself;
     yourself
]

{ #category : #examples }
TagForm class >> run [
	<example>
	^ self new openWithSpec
]

{ #category : #specs }
TagForm class >> title [
	^ 'Add tag'
]

{ #category : #initialization }
TagForm >> initializePresenter [
	formColorPaletteButton
		action: [ ColorPalette new
				model: model;
				openModalWithSpec ]
]

{ #category : #initialization }
TagForm >> initializeWidgets [
	formLabel := self newLabel.
	formLabel label: 'Color Hex string'.
	formInput := self instantiate: SpTextInputFieldPresenter.
	formColorPaletteButton := self newButton.
	formColorPaletteButton
		label: 'choose color';
		icon: (self iconNamed: #paint)
]

{ #category : #accessing }
TagForm >> model: anObject [
  model := anObject
]
