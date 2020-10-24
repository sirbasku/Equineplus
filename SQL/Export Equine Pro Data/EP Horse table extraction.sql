/*

Looks like user_Horse has more recent HorseName and gets timestamped on update in Equine Pro


select count(*) From temp_Horses = 43503
select count(*) From user_Horse = 25302

SELECT COUNT(*)/* u.HorseName AS user_Horse, t.HorseName AS temp_Horse */
FROM user_horse u
LEFT OUTER JOIN temp_Horses t ON t.HorseID = u.HorseID
WHERE t.HorseID is null

Returned 3850 user_Horse's that do not have a matching record in user_Horses ?What are these? No Band No
Returned 125 Rows where user_HorseName <> temp_HorseName seems user_HorseName is current horse name and temp_HorseName was the name of a foal before officially named

NEED SOLUTION TO MAP OLD GUID SIRE and DAM to new int PK in Creator:
1. Create new Horse table for horses with desired fields and legacy fields to retain, 
	this will have a new int PK (auto increment) and new int SireID and new int DamID fields (not auto).
2. INSERT from desired fields into new horse table, let new int PK auto increment
3. UPDATE new int SireID field with LEFT join to new table via Legacy SireID to Legacy HorseID field grabbing new int PK
4. UPDATE new int DamID field with LEFT join to new table via Legacy DamID to Legacy HorseID field grabbing new int PK

5. Have to be able to insert new int PK and FKs, not let Creator auto inc PKs

Need to figure out what the most up to date way to get local code is, look at differences in this query and see which one is right in Equine Pro App

*/

SELECT u.HorseName AS HorseName
, t.BandNumber
, u.RegistrationNumber AS user_RegistrationNumber
, t.RegistrationNumber AS temp_RegistrationNumber
, t.Local
, t.Location
, u.LocalID	
, lc.LookupDescription
, lc.LookupAbrv

, sire.HorseName AS SireName
, u.SireID
, dam.HorseName AS DamName
, u.DamID

, u.HorseID AS LegacyHorseID
, t.HorseName AS LegacyPreviousHorseName
, CONVERT(NVARCHAR(50), u.HorseID) AS Legacy_HorseIDString
, u.UpdateUser AS Legacy_UpdateUser
, u.UpdateTimestamp AS Legacy_UpdateTimestamp

FROM user_horse u
INNER JOIN temp_Horses t ON t.HorseID = u.HorseID
LEFT OUTER JOIN user_Horse sire ON sire.HorseID = u.SireID
LEFT OUTER JOIN user_Horse dam ON dam.HorseID = u.DamID
LEFT OUTER JOIN base_Lookup lc ON lc.LookupID = u.LocalID AND lc.LookupSetID = '506C0E43-4548-46C6-9BB7-09643EE23188'

WHERE u.HorseName LIKE '%Prevue%'

