RegisterNetEvent('esx_shop:payItems')
AddEventHandler('esx_shop:payItems', function(totalPrice, items)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= totalPrice then
        xPlayer.removeMoney(totalPrice)

        for _, item in pairs(items) do
            xPlayer.addInventoryItem(item.item, 1)
        end

        TriggerClientEvent('esx:showNotification', source, Config.Texts.paymentSuccessful)
    else
        TriggerClientEvent('esx:showNotification', source, Config.Texts.notEnoughMoney)
    end
end)
