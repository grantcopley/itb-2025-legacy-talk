<cfcomponent>

    <cfscript>
        function getUserInfo(userID) {
            return queryExecute(
                "SELECT * FROM users WHERE id = :userID",
                { userID: userID }
            );
        }
    </cfscript>

    <cffunction name="getUserOrders" access="public" returntype="query" output="false">
        <cfargument name="userID" type="numeric" required="true">
        <cfset var result = "">
        
        <cfquery name="result">
            SELECT * FROM orders WHERE userID = <cfqueryparam value="#arguments.userID#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfreturn result>
    </cffunction>

    <cffunction name="getOrderItems" access="public" returntype="query" output="false">
        <cfargument name="orderID" type="numeric" required="true">
        <cfset var result = "">
       
        <cfquery name="result">
            SELECT * FROM order_items WHERE orderID = <cfqueryparam value="#arguments.orderID#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfreturn result>
    </cffunction>

</cfcomponent>