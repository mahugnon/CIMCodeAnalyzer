Class {
	#name : #CIMPWBSimlarLinesQuery,
	#superclass : #CIMPWBAbstractQuery,
	#category : #'PWBCodeAnalyser-Queries'
}

{ #category : #running }
CIMPWBSimlarLinesQuery >> runOn: aCollection [
	| result method1 method2 |
	result := OrderedCollection new.
	1 to: aCollection size - 1 do: [ :iter | 
		method1 := aCollection at: iter.
		method2 := aCollection at: iter + 1.
		result add: (self runOn: method1 and: method2) ].
	^ result
]

{ #category : #running }
CIMPWBSimlarLinesQuery >> runOn: aMethod1 and: aMethod2 [
	| method2Lines |
	method2Lines := aMethod2 sourceText lines.
	^ OrderedDictionary new
		at: aMethod1 name put: aMethod1 linesOfCode size;
		at: aMethod2 name put: aMethod2 linesOfCode size;
		at: 'SimilarLines'
			put:
			(aMethod1 sourceText lines
				select: [ :line | method2Lines includes: line ]);
		yourself
]
