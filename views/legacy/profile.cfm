<!--- badView.cfm (pure legacy horror) --->
<cfoutput>
<cfparam name="rc.userID" default="1">
<cfparam name="rc.showOrders" default="1">

<cfset userService = getInstance( "UserService" )>
<cfset dataService = getInstance( "DataService" )>

<!--- Query jammed inside the view with SQL Injection vulnerability --->
<cfset getUserInfo = userService.getUserInfo( rc.userID )>

<cfset VIP_LOYALTY_POINTS_THRESHOLD = 1000>

<h1>Welcome, #getUserInfo.firstName# #getUserInfo.lastName#</h1>

<!--- Magic number without explanation --->
<cfif getUserInfo.loyaltyPoints GT VIP_LOYALTY_POINTS_THRESHOLD>
    <div class="vip-badge">VIP Member</div>
</cfif>

<!--- Nested mess: conditionals inside loops inside another query --->
<cfif rc.showOrders EQ 1>
    <cfset getOrders = userService.getUserOrders( userID=rc.userID, include=["items"] )>

    <h2>Order History</h2>
    <ul>
    <cfloop array="#getOrders#" index="order">
        <li>
            Order #order.orderID# - $#order.orderTotal#
            
            <!--- Magic number without explanation --->
            <cfif order.orderTotal GT 500>
                <strong>(Big Order!)</strong>
            </cfif>

            <ul>
            <cfloop array="#order.items#" index="item">
                <li>#item.itemName# x #item.quantity# at $#item.price# each</li>
            </cfloop>
            </ul>
        </li>
    </cfloop>
    </ul>
</cfif>
</cfoutput>