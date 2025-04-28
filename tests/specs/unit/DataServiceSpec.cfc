/*******************************************************************************
 *	Integration Test as BDD
 *
 *	Extends the integration class: coldbox.system.testing.BaseTestCase
 *
 *	so you can test your ColdBox application headlessly. The 'appMapping' points by default to
 *	the '/root' mapping created in the test folder Application.cfc.  Please note that this
 *	Application.cfc must mimic the real one in your root, including ORM settings if needed.
 *
 *	The 'execute()' method is used to execute a ColdBox event, with the following arguments
 *	* event : the name of the event
 *	* private : if the event is private or not
 *	* prePostExempt : if the event needs to be exempt of pre post interceptors
 *	* eventArguments : The struct of args to pass to the event
 *	* renderResults : Render back the results of the event
 *******************************************************************************/
component extends="coldbox.system.testing.BaseTestCase" appMapping="/root" {

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		// do your own stuff here
	}

	function afterAll(){
		// do your own stuff here
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run(){
		describe( "DataService", function(){
			beforeEach( function( currentSpec ){
				// Setup as a new ColdBox request, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
				setup();
				dataService = getInstance( "DataService" );
			} );

			describe( "toArray", function() {
				it( "can convert struct to an array", function(){
					var result = dataService.toArray( { name = "Grant", age = 30 } );
					expect( isArray( result ) ).toBeTrue();
					expect( arrayLen( result ) ).toBe( 1 );
					expect( result[ 1 ].name ).toBe( "Grant" );
				} );
	
				it( "can convert a query to an array of structs", function() {
					var result = dataService.toArray( queryNew( "name,age", "varchar,integer", [ { name: "Grant", age: 30 } ] ) );
					expect( isArray( result ) ).toBeTrue();
					expect( arrayLen( result ) ).toBe( 1 );
					expect( isStruct( result[ 1 ] ) ).toBeTrue();
					expect( result[ 1 ].name ).toBe( "Grant" );
				} );
			} );

			describe( "toStruct", function() {	
				it( "can convert a single record query to a struct", function() {
					var result = dataService.toStruct( queryNew( "name,age", "varchar,integer", [ { name: "Grant", age: 30 } ] ) );
					expect( isStruct( result ) ).toBeTrue();
					expect( structKeyExists( result, "name" ) ).toBeTrue();
					expect( result.name ).toBe( "Grant" );
				} );

				it( "throws an error when given a query with multiple records", function() {
					expect( function () {
						dataService.toStruct( queryNew( "name,age", "varchar,integer", [ { name: "Grant", age: 30 }, { name: "John", age: 25 } ] ) );
					} ).toThrow();
				} );
			} );

		} );
	}

}
