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
		describe( "Profile Legacy", function(){
			beforeEach( function( currentSpec ){
				// Setup as a new ColdBox request, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
				setup();
			} );

			it( "can render the profile page as expected", function(){
				var event = this.get( "legacy.profile", { userID = 1, showOrders = 1 } );
				var renderedContent = event.getRenderedContent();
				expect( renderedContent ).toContain( "<h1>Welcome, Grant Copley</h1>" );
				expect( renderedContent ).toContain( "VIP Member" );
				expect( renderedContent ).toContain( "<h2>Order History</h2>" );
				expect( renderedContent ).toContain( "Order 1 - $250" );
				expect( renderedContent ).toContain( "Hat x 2 at $25 each" );
				expect( renderedContent ).toContain( "T-Shirt x 1 at $200 each" );				
			} );

		} );
	}

}
