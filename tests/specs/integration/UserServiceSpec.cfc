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
		describe( "UserService", function(){
			beforeEach( function( currentSpec ){
				// Setup as a new ColdBox request, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
				setup();
				userService = getInstance( "UserService" );
			} );

			it( "can get user info", function(){
				var result = userService.getUserInfo( 1 );
				expect( isStruct( result ) ).toBeTrue();
				expect( result.firstname ).toBe( "Grant" );
			} );

			describe( "getUserOrders", function() {

				it( "can get user orders", function(){
					var result = userService.getUserOrders( 1 );
					expect( isArray( result ) ).toBeTrue();
					expect( result[1].orderID ).toBe( 1 );
					expect( result[1].orderTotal ).toBe( 250 );
				} );

				it( "can get user orders with items included ", function(){
					var result = userService.getUserOrders( userId=1, include=["items"] );
					expect( isArray( result ) ).toBeTrue();
					expect( result[1].orderID ).toBe( 1 );
					expect( result[1].orderTotal ).toBe( 250 );
					expect( isArray( result[1].items ) ).toBeTrue();
					expect( result[1].items[1].itemName ).toBe( "Hat" );
					expect( result[1].items[1].price ).toBe( 25 );
				} );
			} );


			it( "can get order items", function(){
				var result = userService.getOrderItems( 1 );
				expect( isArray( result ) ).toBeTrue();
				expect( result[1].itemName ).toBe( "Hat" );
				expect( result[1].price ).toBe( 25 );
			} );

		} );
	}

}
