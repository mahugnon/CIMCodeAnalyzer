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
		add: 'Double click to browse.' height: self labelHeight;
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
	pbModelTable := self newTreeTable.
	pbModelTable
		addColumn:
			(SpCompositeTableColumn new
				title: 'Source code components';
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
		"	addColumn:
			(SpStringTableColumn
				title: 'Number of methods'
				evaluated: [ :class | class methods size asString ]);"
			roots: {model pbModel};
		children: [ :elt | elt content ];
		beResizable;
		activateOnDoubleClick;
		whenActivatedDo: [ :selection | selection selectedItem browse ]
]

{ #category : #initialization }
CIMCodeAnalyzer >> initializeWidgets [
	self initializeModel.
	self initializeTable
]
