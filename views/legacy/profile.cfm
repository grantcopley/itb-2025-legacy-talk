<!--- badView.cfm (pure legacy horror) --->
<cfoutput>
<cfparam name="url.userID" default="1">
<cfparam name="url.showOrders" default="1">

<!--- Query jammed inside the view with SQL Injection vulnerability --->
<cfquery name="getUserInfo">
    SELECT * FROM users WHERE id = #url.userID#
</cfquery>

<cfloop query="getUserInfo">
    <h1>Welcome, #firstName# #lastName#</h1>

    <!--- Magic number without explanation --->
    <cfif loyaltyPoints GT 1000>
        <div class="vip-badge">VIP Member</div>
    </cfif>

    <!--- Nested mess: conditionals inside loops inside another query --->
    <cfif url.showOrders EQ 1>
        <cfquery name="getOrders">
            SELECT * FROM orders WHERE userID = #url.userID#
        </cfquery>

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
                <cfquery name="getOrderItems">
                    SELECT * FROM order_items WHERE orderID = #orderID#
                </cfquery>

                <ul>
                <cfloop query="getOrderItems">
                    <li>#itemName# x #quantity# at $#price# each</li>
                </cfloop>
                </ul>
            </li>
        </cfloop>
        </ul>
    </cfif>

</cfloop>
</cfoutput>