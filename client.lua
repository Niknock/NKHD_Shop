local selectedItems = {}

function openShopMenu(items)
    local elements = {}

    for _, item in pairs(items) do
        table.insert(elements, {
            label = item.label .. " - $" .. item.price,
            value = item
        })
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_menu', {
        title = Config.Texts.shopTitle,
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        local selectedItem = data.current.value

        table.insert(selectedItems, selectedItem)
        ESX.ShowNotification(string.format(Config.Texts.itemSelected, selectedItem.label))
    end, function(data, menu)
        menu.close()
    end)
end

function openCartMenu()
    local elements = {}

    if #selectedItems == 0 then
        ESX.ShowNotification(Config.Texts.emptyCart)
        return
    end

    for i, item in ipairs(selectedItems) do
        table.insert(elements, {
            label = item.label .. " - $" .. item.price .. " " .. Config.Texts.cartRemove,
            value = i 
        })
    end

    table.insert(elements, {label = Config.Texts.clearCart, value = "clear_cart"})

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cart_menu', {
        title = Config.Texts.cartTitle,
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        if data.current.value == "clear_cart" then
            selectedItems = {}
            ESX.ShowNotification(Config.Texts.cartCleared)
            menu.close()
        else
            table.remove(selectedItems, data.current.value)
            ESX.ShowNotification(Config.Texts.itemRemoved)
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end

function payForItems()
    local totalPrice = 0

    for _, item in pairs(selectedItems) do
        totalPrice = totalPrice + item.price
    end

    if #selectedItems == 0 then
        ESX.ShowNotification(Config.Texts.noItems)
        return
    end

    TriggerServerEvent('esx_shop:payItems', totalPrice, selectedItems)
    selectedItems = {} 
end

Citizen.CreateThread(function()
    for model, items in pairs(Config.Items) do
        exports.ox_target:addModel(model, {
            {
                name = 'shopShelf',
                label = Config.Texts.shopBrowse,
                icon = 'fas fa-box-open',
                onSelect = function()
                    openShopMenu(items)
                end
            }
        })
    end
end)

Citizen.CreateThread(function()
    exports.ox_target:addModel(Config.CashRegisterModel, {
        {
            name = 'shopCashRegister',
            label = Config.Texts.checkout,
            icon = 'fas fa-cash-register',
            onSelect = function()
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cash_register_menu', {
                    title = Config.Texts.checkout,
                    align = 'top-left',
                    elements = {
                        {label = Config.Texts.checkoutOption, value = "pay"},
                        {label = Config.Texts.viewCartOption, value = "view_cart"}
                    }
                }, function(data, menu)
                    if data.current.value == "pay" then
                        payForItems()
                    elseif data.current.value == "view_cart" then
                        openCartMenu()
                    end
                    menu.close()
                end, function(data, menu)
                    menu.close()
                end)
            end
        }
    })
end)
