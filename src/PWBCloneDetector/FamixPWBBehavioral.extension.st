Extension { #name : #FamixPWBBehavioral }

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> increaseNumberOfAssignationStatements [
	self
		numberOfAssignationStatements: self numberOfAssignationStatements + 1
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> increaseNumberOfConditionalStatments [
	self
		numberOfConditionalStatments: self numberOfConditionalStatments + 1
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> increaseNumberOfIterationStatements [
	self
		numberOfIterationStatements: self numberOfIterationStatements + 1
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> increaseNumberOfReturnStatements [
		self numberOfReturnStatements: self numberOfReturnStatements + 1
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> increaseSelectionStatement [
		self selectionStatement: self selectionStatement + 1
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> linesOfCode [
	^ self sourceText lines reject: [ :each | each = ' ' or: each = '' ]
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> numberOfArguments [
	^ self lookUpPropertyNamed: #numberOfArguments computedAs: [ 0 ]
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> numberOfArguments: aNumber [
	self privateState
		propertyAt: #numberOfArguments
		put: aNumber
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> numberOfAssignationStatements [
	^ self
		lookUpPropertyNamed: #numberOfAssignationStatements
		computedAs: [ 0 ]
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> numberOfAssignationStatements: aNumber [
	self privateState
		propertyAt: #numberOfAssignationStatements
		put: aNumber
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> numberOfConditionalStatments [
	^ self
		lookUpPropertyNamed: #numberOfConditionalStatments
		computedAs: [ 0 ]
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> numberOfConditionalStatments: aNumber [
	self privateState
		propertyAt: #numberOfConditionalStatments
		put: aNumber
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> numberOfFunctionCalls [
	^ (self outgoingInvocations flatCollect: #candidates) asSet size
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> numberOfIterationStatements [
	^ self
		lookUpPropertyNamed: #numberOfIterationStatements
		computedAs: [ 0]
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> numberOfIterationStatements: aNumber [
	self privateState
		propertyAt: #numberOfIterationStatements
		put: aNumber
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> numberOfLocalVariables [
	^ (self variables select: [ :each | each name matchesRegex: 'l.*' ])
		size
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> numberOfReturnStatements [
	^ self
		lookUpPropertyNamed: #numberOfReturnStatements
		computedAs: [ 0 ]
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> numberOfReturnStatements: aNumber [
	self privateState propertyAt: #numberOfReturnStatements put: aNumber
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> selectionStatement [
^ self
		lookUpPropertyNamed:  #selectionStatement
		computedAs: [ 0 ]
]

{ #category : #'*PWBCloneDetector' }
FamixPWBBehavioral >> selectionStatement: aNumber [ 
self privateState propertyAt: #selectionStatement put: aNumber
]
