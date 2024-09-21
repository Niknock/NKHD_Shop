Config = {}

Config.Items = {
    ['v_ret_247shelves02'] = { 
        {label = "Wasserflasche", item = "water", price = 3},
        {label = "Cola", item = "cola", price = 5},
        {label = "Energydrink", item = "energy_drink", price = 7}
    },
    ['v_ret_247shelves05'] = {
        {label = "Brot", item = "bread", price = 2},
        {label = "Joghurt", item = "yogurt", price = 4},
        {label = "Milch", item = "milk", price = 3}
    },
    ['v_ret_247_donuts'] = { 
        {label = "Donut", item = "donut", price = 5},
        {label = "Muffin", item = "muffin", price = 6}
    },
    ['v_66_fridge'] = {
        {label = "Sandwich", item = "sandwich", price = 8},
        {label = "Salat", item = "salad", price = 7}
    },
    ['v_ret_ml_fridge'] = { 
        {label = "Eistee", item = "iced_tea", price = 5},
        {label = "Fruchtsaft", item = "fruit_juice", price = 4}
    }

    -- ['prop name'] = { 
    --     {label = "Item label", item = "Item name", price = Price},
    --     {label = "Item label", item = "Item name", price = Price}
    -- }

}

Config.CashRegisterModel = 'prop_till_01'

Config.Texts = {
    shopTitle = "Shop",
    shopBrowse = "Browse Shop",
    cartView = "View Cart",
    checkout = "Proceed to Checkout",
    emptyCart = "Your cart is empty.",
    cartRemove = "[Remove]",
    clearCart = "Clear Cart",
    itemSelected = "You have selected %s.",
    itemRemoved = "Item has been removed from the cart.",
    cartCleared = "Your cart has been cleared.",
    noItems = "You have not selected any items.",
    notEnoughMoney = "You don't have enough money.",
    paymentSuccessful = "You have successfully paid.",
    totalPriceLabel = "Total Price: $%s",
    cartTitle = "Cart",
    checkoutOption = "Checkout",
    viewCartOption = "View Cart"
}
