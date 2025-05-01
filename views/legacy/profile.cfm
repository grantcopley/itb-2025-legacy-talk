<cfoutput>

<cfset VIP_LOYALTY_POINTS_THRESHOLD = 1000>

<h1>Welcome, #prc.userInfo.firstName# #prc.userInfo.lastName#</h1>

<cfif prc.userInfo.loyaltyPoints GT VIP_LOYALTY_POINTS_THRESHOLD>
    <div class="vip-badge">VIP Member</div>
</cfif>

<!--- Nested mess: conditionals inside loops inside another query --->
<cfif rc.showOrders EQ 1>

    <h2>Order History</h2>
    <ul>
    <cfloop array="#prc.orders#" index="order">
        <li>
            Order #order.orderID# - $#order.orderTotal#
            
            <!--- Magic number without explanation --->
            <cfif order.isBigOrder>
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