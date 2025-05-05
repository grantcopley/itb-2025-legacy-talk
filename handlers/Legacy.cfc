component {

    property name="userService" inject="UserService";

    function profile( event, rc, prc ) {
        param name="rc.userID" default="1";
        param name="rc.showOrders" default="1";

        prc.orders = userService.getUserOrders( userID=rc.userID, include=["items"] );
        prc.userInfo = userService.getUserInfo( rc.userID );
        prc.VIP_LOYALTY_POINTS_THRESHOLD = 1000;
    }
}