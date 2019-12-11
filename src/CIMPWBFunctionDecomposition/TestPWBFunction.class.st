Class {
	#name : #TestPWBFunction,
	#superclass : #TestCase,
	#instVars : [
		'variable1',
		'variable2',
		'function',
		'testPWBModel',
		'function1',
		'variable3',
		'variable4'
	],
	#category : #'CIMPWBFunctionDecomposition-Tests'
}

{ #category : #running }
TestPWBFunction >> setUp [
	testPWBModel := MooseModel new.
	variable1 := FamixPWBVariable new name: 'icalcul'.
	variable2 := FamixPWBVariable new name: 'lcalcul'.
	variable3 := FamixPWBVariable new name: 'iliq'.
	variable4 := FamixPWBVariable new name: 'icalcul'.
	function := FamixPWBFunction new.
	function1 := FamixPWBFunction new.
	testPWBModel
		add: variable1;
		add: variable2;
		add: variable3;
		add: variable4.
	function
		variables:
			{variable1.
			variable2}.
	function1
		variables:
			{variable3.
			variable4}.
	testPWBModel
		add: function;
		add: function1
]

{ #category : #tests }
TestPWBFunction >> testGetInstanceVariableAccessed [
	self
		assert: (QueryPWBInstanceVariables new runOn: function) size
		equals: 1
]

{ #category : #tests }
TestPWBFunction >> testGetInstanceVariablesWithSameName [
	self
		assert:
			(QueryPWBInstanceVariablesWithSameName new
				runOn: (testPWBModel allWithType: FamixPWBFunction)
				with: 'icalcul') size
		equals: 2
]
