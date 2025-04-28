<!--- badView.cfm (pure legacy horror) --->
<cfoutput>
<cfparam name="rc.userID" default="1">
<cfparam name="rc.showOrders" default="1">

<cfset userService = getInstance( "UserService" )>

<!--- Query jammed inside the view with SQL Injection vulnerability --->
<cfset getUserInfo = userService.getUserInfo( rc.userID )>

<h1>Welcome, #getUserInfo.firstName# #getUserInfo.lastName#</h1>

<!--- Magic number without explanation --->
<cfif getUserInfo.loyaltyPoints GT 1000>
    <div class="vip-badge">VIP Member</div>
</cfif>

<!--- Nested mess: conditionals inside loops inside another query --->
<cfif rc.showOrders EQ 1>
    <cfset getOrders = userService.getUserOrders( rc.userID )>

    <h2>Order History</h2>
    <ul>
    <cfloop query="getOrders">
        <li>
            Order #orderID# - $#orderTotal#
            
            <!--- Magic number without explanation --->
            <cfif orderTotal GT 500>
                <strong>(Big Order!)</strong>
            </cfif>

            <!--- Another query inside a loop inside a query --->
            <cfset getOrderItems = userService.getOrderItems( orderID )>

            <ul>
            <cfloop query="getOrderItems">
                <li>#itemName# x #quantity# at $#price# each</li>
            </cfloop>
            </ul>
        </li>
    </cfloop>
    </ul>
</cfif>
</cfoutput>