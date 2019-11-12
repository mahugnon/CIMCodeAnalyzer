Class {
	#name : #CloneMetricsResult,
	#superclass : #Object,
	#instVars : [
		'numberOfLinesOfCode',
		'numberOfLocalVariables',
		'numberOfFunctionCalls',
		'numberOfIterions',
		'numberOfReturns',
		'numberOfAssignments',
		'numberOfSelections',
		'name'
	],
	#category : #'PWBCodeAnalyser-Queries'
}

{ #category : #accessing }
CloneMetricsResult >> name [
	^ name
]

{ #category : #accessing }
CloneMetricsResult >> name: anObject [
	name := anObject
]

{ #category : #accessing }
CloneMetricsResult >> numberOfAssignments [
	^ numberOfAssignments
]

{ #category : #accessing }
CloneMetricsResult >> numberOfAssignments: anInteger [
	numberOfAssignments := anInteger
]

{ #category : #accessing }
CloneMetricsResult >> numberOfFunctionCalls [
	^ numberOfFunctionCalls
]

{ #category : #accessing }
CloneMetricsResult >> numberOfFunctionCalls: anInteger [
	numberOfFunctionCalls := anInteger
]

{ #category : #accessing }
CloneMetricsResult >> numberOfIterions [
	^ numberOfIterions
]

{ #category : #accessing }
CloneMetricsResult >> numberOfIterions: anInteger [
	numberOfIterions := anInteger
]

{ #category : #accessing }
CloneMetricsResult >> numberOfLinesOfCode [
	^ numberOfLinesOfCode
]

{ #category : #accessing }
CloneMetricsResult >> numberOfLinesOfCode: anInteger [
	numberOfLinesOfCode := anInteger
]

{ #category : #accessing }
CloneMetricsResult >> numberOfLocalVariables [
	^ numberOfLocalVariables
]

{ #category : #accessing }
CloneMetricsResult >> numberOfLocalVariables: anInteger [
	numberOfLocalVariables := anInteger
]

{ #category : #accessing }
CloneMetricsResult >> numberOfReturns [
	^ numberOfReturns
]

{ #category : #accessing }
CloneMetricsResult >> numberOfReturns: anInteger [
	numberOfReturns := anInteger
]

{ #category : #accessing }
CloneMetricsResult >> numberOfSelections [
	^ numberOfSelections
]

{ #category : #accessing }
CloneMetricsResult >> numberOfSelections: anInteger [
	numberOfSelections := anInteger
]
