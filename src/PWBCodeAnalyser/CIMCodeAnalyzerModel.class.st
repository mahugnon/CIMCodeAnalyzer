Class {
	#name : #CIMCodeAnalyzerModel,
	#superclass : #Object,
	#instVars : [
		'pbModel'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #PWBCodeAnalyser
}

{ #category : #accessing }
CIMCodeAnalyzerModel class >> reset [
	<script>
	uniqueInstance := nil.
	self uniqueInstance
]

{ #category : #accessing }
CIMCodeAnalyzerModel class >> uniqueInstance [
	uniqueInstance ifNil: [ uniqueInstance := self new ].
	^ uniqueInstance
]

{ #category : #initialization }
CIMCodeAnalyzerModel >> initialize [
	pbModel := MooseModel root first allWithType: FamixPWBUserObject
]

{ #category : #accessing }
CIMCodeAnalyzerModel >> pbModel [
	^ pbModel
]

{ #category : #accessing }
CIMCodeAnalyzerModel >> pbModel: anObject [
	pbModel := anObject
]
