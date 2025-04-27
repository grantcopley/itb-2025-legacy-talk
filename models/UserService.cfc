<cfcomponent>

    <cffunction name="getUserInfo" access="public" returntype="query" output="false">
        <cfargument name="userID" type="numeric" required="true">
        <cfset var result = "">
        
        <cfquery name="result">
            SELECT * FROM users WHERE id = <cfqueryparam value="#arguments.userID#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfreturn result>
    </cffunction>

</cfcomponent>