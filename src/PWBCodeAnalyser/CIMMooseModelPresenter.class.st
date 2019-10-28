Class {
	#name : #CIMMooseModelPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'pbModelTable'
	],
	#category : #'PWBCodeAnalyser-Presenters'
}

{ #category : #specs }
CIMMooseModelPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #pbModelTable;
		yourself
]

{ #category : #examples }
CIMMooseModelPresenter class >> run [
	<example>
	self new openWithSpec
]

{ #category : #initialization }
CIMMooseModelPresenter >> initializeModel [
	model := CIMCodeAnalyzerModel uniqueInstance
]

{ #category : #initialization }
CIMMooseModelPresenter >> initializeTable [
	| title |
	pbModelTable := self newTreeTable.
	title := 'Source code components'.
	pbModelTable
		addColumn:
			(SpCompositeTableColumn new
				title: title;
				addColumn:
					((SpImageTableColumn evaluated: #systemIcon)
						width: 20;
						yourself);
				addColumn: (SpStringTableColumn evaluated: #name);
				yourself);
		addColumn:
			(SpStringTableColumn
				title: 'Number of Line of code'
				evaluated: [ :elt | elt numberOfLinesOfCode ]);
		addColumn:
			(SpStringTableColumn
				title: 'Cyclomatic complexity'
				evaluated: [ :elt | elt cyclomaticComplexity ]);
		roots: {model pbModel};
		children: [ :elt | elt content ];
		beResizable
]

{ #category : #initialization }
CIMMooseModelPresenter >> initializeWidgets [
	self initializeModel.
	self initializeTable
]
