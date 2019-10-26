Class {
	#name : #CIMCodeAnalyzer,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'pbModelTable'
	],
	#category : #PWBCodeAnalyser
}

{ #category : #specs }
CIMCodeAnalyzer class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #pbModelTable;
		yourself
]

{ #category : #examples }
CIMCodeAnalyzer class >> run [
	<example>
	self new openWithSpec
]

{ #category : #initialization }
CIMCodeAnalyzer >> initializeModel [
	model := CIMCodeAnalyzerModel uniqueInstance
]

{ #category : #initialization }
CIMCodeAnalyzer >> initializeTable [
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
CIMCodeAnalyzer >> initializeWidgets [
	self initializeModel.
	self initializeTable
]
