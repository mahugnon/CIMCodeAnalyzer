Class {
	#name : #CIMPWBSimlarLinesQuery,
	#superclass : #CIMPWBAbstractQuery,
	#category : #'PWBCodeAnalyser-Queries'
}

{ #category : #'as yet unclassified' }
CIMPWBSimlarLinesQuery >> getHashs: aMethod [
	^ aMethod linesOfCode collect: [ :each | each hash ]
]

{ #category : #running }
CIMPWBSimlarLinesQuery >> runOn: aCollection [
	| clones result |
	result := OrderedDictionary new.
	1 to: aCollection size - 1 do: [ :i | 
		i to: aCollection size do: [ :j | 
			clones := OrderedCollection new.
			clones
				add: (self runOn: (aCollection at: i) and: (aCollection at: j)) ].
		result at: (aCollection at: i) name put: clones ].
	^ result
]

{ #category : #running }
CIMPWBSimlarLinesQuery >> runOn: aMethod1 and: aMethod2 [
	| method2Lines method1Lines |
	method2Lines := self getHashs: aMethod2.
	method1Lines := self getHashs: aMethod1.
	^ OrderedDictionary new
		at: aMethod1 name put: aMethod1 linesOfCode size;
		at: aMethod2 name put: aMethod2 linesOfCode size;
		at: 'SimilarLines'
			put: (method1Lines count: [ :line | method2Lines includes: line ]);
		yourself
]
