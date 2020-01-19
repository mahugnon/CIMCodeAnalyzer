Class {
	#name : #CIMMainMenu,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'markButton',
		'unMarkButton',
		'browseButton'
	],
	#category : #'PWBCodeAnalyser-TreeBase-Presenters'
}

{ #category : #initialization }
CIMMainMenu >> initializePresenters [
  markButton := self newButton.
  SpButtonPresenter.
  markButton
     label: 'Mark';
     iconNamed: #scriptManager.
  unMarkButton := self newButton.
  unMarkButton
     label: 'Unmark';
     iconNamed: #smallCancel.
  browseButton := self newButton
]
