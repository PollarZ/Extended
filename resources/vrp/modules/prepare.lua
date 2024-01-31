-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("characters/Person","SELECT * FROM characters WHERE id = @id")
vRP.Prepare("characters/Phone","SELECT id FROM characters WHERE Phone = @Phone")
vRP.Prepare("characters/Delete","UPDATE characters SET Deleted = 1 WHERE id = @id")
vRP.Prepare("characters/SetSkin","UPDATE characters SET Skin = @Skin WHERE id = @Passport")
vRP.Prepare("characters/SetBadge","UPDATE characters SET Badge = @Badge WHERE id = @Passport")
vRP.Prepare("characters/UpdatePhone","UPDATE characters SET Phone = @Phone WHERE id = @Passport")
vRP.Prepare("characters/SetMedicplan","UPDATE characters SET Medic = @Medic WHERE id = @Passport")
vRP.Prepare("characters/AddBank","UPDATE characters SET Bank = Bank + @Bank WHERE id = @Passport")
vRP.Prepare("characters/RemBank","UPDATE characters SET Bank = Bank - @Bank WHERE id = @Passport")
vRP.Prepare("characters/UpdateAvatar","UPDATE characters SET Avatar = @Avatar WHERE id = @Passport")
vRP.Prepare("characters/UserLicense","SELECT * FROM characters WHERE id = @id and License = @License")
vRP.Prepare("characters/Characters","SELECT * FROM characters WHERE License = @License and Deleted = 0")
vRP.Prepare("characters/LastLogin","UPDATE characters SET Login = UNIX_TIMESTAMP() WHERE id = @Passport")
vRP.Prepare("characters/InsertPrison","UPDATE characters SET Prison = Prison + @Prison WHERE id = @Passport")
vRP.Prepare("characters/ReducePrison","UPDATE characters SET Prison = Prison - @Prison WHERE id = @Passport")
vRP.Prepare("characters/Count","SELECT COUNT(License) FROM characters WHERE License = @License and Deleted = 0")
vRP.Prepare("characters/UpdateName","UPDATE characters SET Name = @Name, Lastname = @Lastname WHERE id = @Passport")
vRP.Prepare("characters/LastCharacter","SELECT id FROM characters WHERE License = @License ORDER BY id DESC LIMIT 1")
vRP.Prepare("characters/NewCharacter","INSERT INTO characters(License,Name,Lastname,Sex,Skin,Phone,Blood,Created) VALUES(@License,@Name,@Lastname,@Sex,@Skin,@Phone,@Blood,UNIX_TIMESTAMP() + 259200)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACCOUNTS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("accounts/All","SELECT * FROM accounts")
vRP.Prepare("accounts/Account","SELECT * FROM accounts WHERE License = @License")
vRP.Prepare("accounts/NewAccount","INSERT INTO accounts(License) VALUES(@License)")
vRP.Prepare("accounts/Clean","UPDATE accounts SET Whitelist = 0 WHERE Discord = @Discord")
vRP.Prepare("accounts/RemoveBanned","UPDATE accounts SET Banned = 0 WHERE License = @License")
vRP.Prepare("accounts/SetPremium","UPDATE accounts SET Premium = @Premium WHERE License = @License")
vRP.Prepare("accounts/LastLogin","UPDATE accounts SET Login = UNIX_TIMESTAMP() WHERE License = @License")
vRP.Prepare("accounts/UpgradePremium","UPDATE accounts SET Premium = Premium + 2592000 WHERE License = @License")
vRP.Prepare("accounts/AddGemstone","UPDATE accounts SET Gemstone = Gemstone + @Gemstone WHERE License = @License")
vRP.Prepare("accounts/UpdateCharacters","UPDATE accounts SET Characters = Characters + 1 WHERE License = @License")
vRP.Prepare("accounts/RemoveGemstone","UPDATE accounts SET Gemstone = Gemstone - @Gemstone WHERE License = @License")
vRP.Prepare("accounts/InsertBanned","UPDATE accounts SET Banned = UNIX_TIMESTAMP() + 86400 * @Days WHERE License = @License")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERDATA
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("playerdata/GetData","SELECT * FROM playerdata WHERE Passport = @Passport AND Name = @Name")
vRP.Prepare("playerdata/SetData","REPLACE INTO playerdata(Passport,Name,Information) VALUES(@Passport,@Name,@Information)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTITYDATA
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("entitydata/GetData","SELECT * FROM entitydata WHERE Name = @Name")
vRP.Prepare("entitydata/RemoveData","DELETE FROM entitydata WHERE Name = @Name")
vRP.Prepare("entitydata/SetData","REPLACE INTO entitydata(Name,Information) VALUES(@Name,@Information)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("vehicles/All","SELECT * FROM vehicles")
vRP.Prepare("vehicles/Drift","UPDATE vehicles SET Drift = 1 WHERE Plate = @Plate")
vRP.Prepare("vehicles/plateVehicles","SELECT * FROM vehicles WHERE Plate = @Plate")
vRP.Prepare("vehicles/UserVehicles","SELECT * FROM vehicles WHERE Passport = @Passport")
vRP.Prepare("vehicles/Count","SELECT COUNT(Vehicle) FROM vehicles WHERE Vehicle = @Vehicle")
vRP.Prepare("vehicles/removeVehicles","DELETE FROM vehicles WHERE Passport = @Passport AND Vehicle = @Vehicle")
vRP.Prepare("vehicles/selectVehicles","SELECT * FROM vehicles WHERE Passport = @Passport AND Vehicle = @Vehicle")
vRP.Prepare("vehicles/Arrest","UPDATE vehicles SET Arrest = 1 WHERE Passport = @Passport AND Vehicle = @Vehicle")
vRP.Prepare("vehicles/PaymentArrest","UPDATE vehicles SET Arrest = 0 WHERE Passport = @Passport AND Vehicle = @Vehicle")
vRP.Prepare("vehicles/plateVehiclesUpdate","UPDATE vehicles SET Plate = @Plate WHERE Passport = @Passport AND Vehicle = @Vehicle")
vRP.Prepare("vehicles/moveVehicles","UPDATE vehicles SET Passport = @OtherPassport WHERE Passport = @Passport AND Vehicle = @Vehicle")
vRP.Prepare("vehicles/rentalVehiclesDays","UPDATE vehicles SET Rental = Rental + 2592000 WHERE Passport = @Passport AND Vehicle = @Vehicle")
vRP.Prepare("vehicles/updateVehiclesTax","UPDATE vehicles SET Tax = UNIX_TIMESTAMP() + 2592000 WHERE Passport = @Passport AND Vehicle = @Vehicle")
vRP.Prepare("vehicles/rentalVehiclesUpdate","UPDATE vehicles SET Rental = UNIX_TIMESTAMP() + 2592000 WHERE Passport = @Passport AND Vehicle = @Vehicle")
vRP.Prepare("vehicles/addVehicles","INSERT IGNORE INTO vehicles(Passport,Vehicle,Plate,Work,Tax) VALUES(@Passport,@Vehicle,@Plate,@Work,UNIX_TIMESTAMP() + 604800)")
vRP.Prepare("vehicles/rentalVehicles","INSERT IGNORE INTO vehicles(Passport,Vehicle,Plate,Work,Rental,Tax) VALUES(@Passport,@Vehicle,@Plate,@Work,UNIX_TIMESTAMP() + 2592000,UNIX_TIMESTAMP() + 604800)")
vRP.Prepare("vehicles/InitialVehicles","INSERT IGNORE INTO vehicles(Passport,Vehicle,Plate,Work,Rental,Tax) VALUES(@Passport,@Vehicle,@Plate,@Work,UNIX_TIMESTAMP() + (86400 * 7),UNIX_TIMESTAMP() + (86400 * 7))")
vRP.Prepare("vehicles/updateVehicles","UPDATE vehicles SET Engine = @Engine, Body = @Body, Health = @Health, Fuel = @Fuel, Doors = @Doors, Windows = @Windows, Tyres = @Tyres, Nitro = @Nitro WHERE Passport = @Passport AND Vehicle = @Vehicle")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("chests/GetChests","SELECT * FROM chests WHERE Name = @Name")
vRP.Prepare("chests/RemBank","UPDATE chests SET Bank = Bank - @Bank WHERE Name = @Name")
vRP.Prepare("chests/AddBank","UPDATE chests SET Bank = Bank + @Bank WHERE Name = @Name")
vRP.Prepare("chests/AddChests","INSERT IGNORE INTO chests(Name,Permission) VALUES(@Name,@Name)")
vRP.Prepare("chests/Premium","UPDATE chests SET Premium = UNIX_TIMESTAMP() + 2592000 WHERE Name = @Name")
vRP.Prepare("chests/UpdateWeight","UPDATE chests SET Weight = Weight + (10 * @Multiplier), Slots = Slots + (5 * @Multiplier) WHERE Name = @Name")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WAREHOUSE
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("warehouse/All","SELECT * FROM warehouse")
vRP.Prepare("warehouse/Sell","DELETE FROM warehouse WHERE Name = @Name")
vRP.Prepare("warehouse/Informations","SELECT * FROM warehouse WHERE Name = @Name")
vRP.Prepare("warehouse/Password","UPDATE warehouse SET Password = @Password WHERE Name = @Name")
vRP.Prepare("warehouse/Transfer","UPDATE warehouse SET Passport = @Passport WHERE Name = @Name")
vRP.Prepare("warehouse/Acess","SELECT * FROM warehouse WHERE Name = @Name AND Password = @Password")
vRP.Prepare("warehouse/Tax","UPDATE warehouse SET Tax = UNIX_TIMESTAMP() + 2592000 WHERE Name = @Name")
vRP.Prepare("warehouse/Upgrade","UPDATE warehouse SET Weight = Weight + (10 * @Multiplier) WHERE Name = @Name")
vRP.Prepare("warehouse/Buy","INSERT INTO warehouse(Name,Password,Passport,Tax) VALUES(@Name,@Password,@Passport,UNIX_TIMESTAMP() + 2592000)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("propertys/All","SELECT * FROM propertys")
vRP.Prepare("propertys/Sell","DELETE FROM propertys WHERE Name = @Name")
vRP.Prepare("propertys/Exist","SELECT * FROM propertys WHERE Name = @Name")
vRP.Prepare("propertys/Serial","SELECT * FROM propertys WHERE Serial = @Serial")
vRP.Prepare("propertys/Garages","SELECT * FROM propertys WHERE Garage IS NOT NULL")
vRP.Prepare("propertys/AllUser","SELECT * FROM propertys WHERE Passport = @Passport")
vRP.Prepare("propertys/Item","UPDATE propertys SET Item = Item + 1 WHERE Name = @Name")
vRP.Prepare("propertys/Garage","UPDATE propertys SET Garage = @Garage WHERE Name = @Name")
vRP.Prepare("propertys/Credentials","UPDATE propertys SET Serial = @Serial WHERE Name = @Name")
vRP.Prepare("propertys/Vault","UPDATE propertys SET Vault = Vault + @Weight WHERE Name = @Name")
vRP.Prepare("propertys/Transfer","UPDATE propertys SET Passport = @Passport WHERE Name = @Name")
vRP.Prepare("propertys/Fridge","UPDATE propertys SET Fridge = Fridge + @Weight WHERE Name = @Name")
vRP.Prepare("propertys/Check","SELECT * FROM propertys WHERE Name = @Name AND Passport = @Passport")
vRP.Prepare("propertys/Tax","UPDATE propertys SET Tax = UNIX_TIMESTAMP() + 2592000 WHERE Name = @Name")
vRP.Prepare("propertys/Buy","INSERT INTO propertys(Name,Interior,Passport,Serial,Vault,Fridge,Tax) VALUES(@Name,@Interior,@Passport,@Serial,@Vault,@Fridge,@Tax)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FINES
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("fines/List","SELECT * FROM fines WHERE Passport = @Passport")
vRP.Prepare("fines/Remove","DELETE FROM fines WHERE Passport = @Passport AND id = @id")
vRP.Prepare("fines/Check","SELECT * FROM fines WHERE Passport = @Passport AND id = @id")
vRP.Prepare("fines/Add","INSERT INTO fines(Passport,Name,Date,Hour,Price,Message) VALUES(@Passport,@Name,@Date,@Hour,@Price,@Message)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAXS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("taxs/List","SELECT * FROM taxs WHERE Passport = @Passport")
vRP.Prepare("taxs/Remove","DELETE FROM taxs WHERE Passport = @Passport AND id = @id")
vRP.Prepare("taxs/Check","SELECT * FROM taxs WHERE Passport = @Passport AND id = @id")
vRP.Prepare("taxs/Add","INSERT INTO taxs(Passport,Name,Date,Hour,Price,Message) VALUES(@Passport,@Name,@Date,@Hour,@Price,@Message)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAINEL
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("painel/List","SELECT * FROM painel WHERE Permission = @Permission ORDER BY id DESC LIMIT 20")
vRP.Prepare("painel/Add","INSERT INTO painel(Passport,Permission,Type,Price) VALUES(@Passport,@Permission,@Type,@Price)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSACTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("transactions/List","SELECT * FROM transactions WHERE Passport = @Passport ORDER BY id DESC LIMIT @Limit")
vRP.Prepare("transactions/Add","INSERT INTO transactions(Passport,Type,Date,Price,Balance,Timeset) VALUES(@Passport,@Type,@Date,@Price,@Balance,UNIX_TIMESTAMP() + 259200)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEPENDENTS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("dependents/List","SELECT * FROM dependents WHERE Passport = @Passport")
vRP.Prepare("dependents/Remove","DELETE FROM dependents WHERE Passport = @Passport AND Dependent = @Dependent")
vRP.Prepare("dependents/Check","SELECT * FROM dependents WHERE Passport = @Passport AND Dependent = @Dependent")
vRP.Prepare("dependents/Add","INSERT INTO dependents(Passport,Dependent,Name) VALUES(@Passport,@Dependent,@Name)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVOICES
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("invoices/Remove","DELETE FROM invoices WHERE id = @id")
vRP.Prepare("invoices/Check","SELECT * FROM invoices WHERE id = @id")
vRP.Prepare("invoices/List","SELECT * FROM invoices WHERE Passport = @Passport")
vRP.Prepare("invoices/Add","INSERT INTO invoices(Passport,Received,Type,Reason,Holder,Price) VALUES(@Passport,@Received,@Type,@Reason,@Holder,@Price)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVESTMENTS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("investments/Remove","DELETE FROM investments WHERE Passport = @Passport")
vRP.Prepare("investments/Check","SELECT * FROM investments WHERE Passport = @Passport")
vRP.Prepare("investments/Add","INSERT INTO investments(Passport,Deposit,Last) VALUES(@Passport,@Deposit,UNIX_TIMESTAMP() + 86400)")
vRP.Prepare("investments/Invest","UPDATE investments SET Deposit = Deposit + @Price, Last = UNIX_TIMESTAMP() + 86400 WHERE Passport = @Passport")
vRP.Prepare("investments/Actives","UPDATE investments SET Monthly = Monthly + FLOOR((Deposit + Liquid) * 0.005), Liquid = Liquid + FLOOR((Deposit + Liquid) * 0.005), Last = UNIX_TIMESTAMP() + 86400 WHERE Last < UNIX_TIMESTAMP()")
-----------------------------------------------------------------------------------------------------------------------------------------
-- HWID
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("hwid/Check","SELECT * FROM hwid WHERE Token = @Token")
vRP.Prepare("hwid/All","UPDATE hwid SET Banned = @Banned WHERE Account = @Account")
vRP.Prepare("hwid/Insert","INSERT INTO hwid(Token,Account) VALUES(@Token,@Account)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- SMARTPHONE
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("smartphone/Calls","DELETE FROM smartphone_calls WHERE created_at < (UNIX_TIMESTAMP() - 86400 * 3)")
vRP.Prepare("smartphone/TorMessages","DELETE FROM smartphone_tor_messages WHERE created_at < (UNIX_TIMESTAMP() - 86400 * 3)")
vRP.Prepare("smartphone/WhatsappMessages","DELETE FROM smartphone_whatsapp_messages WHERE created_at < (UNIX_TIMESTAMP() - 86400 * 3)")
vRP.Prepare("smartphone/InstagramNotifications","DELETE FROM smartphone_instagram_notifications WHERE created_at < (UNIX_TIMESTAMP() - 86400 * 3)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEARTABLES
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("summerz/Transactions","DELETE FROM transactions WHERE UNIX_TIMESTAMP() >= Timeset")
vRP.Prepare("summerz/Premium","UPDATE accounts SET Premium = '0' WHERE UNIX_TIMESTAMP() >= Premium")
vRP.Prepare("summerz/Playerdata","DELETE FROM playerdata WHERE Information = '[]' OR Information = '{}'")
vRP.Prepare("summerz/Entitydata","DELETE FROM entitydata WHERE Information = '[]' OR Information = '{}'")
-----------------------------------------------------------------------------------------------------------------------------------------
-- RACES
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("Races/User","SELECT * FROM races WHERE Race = @Race AND Passport = @Passport")
vRP.Prepare("Races/Consult","SELECT * FROM races WHERE Race = @Race ORDER BY Points ASC LIMIT 5")
vRP.Prepare("Races/Insert","INSERT INTO races(Race,Passport,Vehicle,Points) VALUES(@Race,@Passport,@Vehicle,@Points)")
vRP.Prepare("Races/Update","UPDATE races SET Points = @Points, Vehicle = @Vehicle WHERE Race = @Race AND Passport = @Passport")
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	vRP.Query("summerz/Premium")
	vRP.Query("summerz/Playerdata")
	vRP.Query("summerz/Entitydata")
	vRP.Query("summerz/Transactions")

	if GetResourceState("smartphone") == "started" then
		vRP.Query("smartphone/Calls")
		vRP.Query("smartphone/TorMessages")
		vRP.Query("smartphone/WhatsappMessages")
		vRP.Query("smartphone/InstagramNotifications")
	end
end)