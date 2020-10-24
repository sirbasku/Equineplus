
SELECT co.[ContactID]
      ,co.[Name]
      ,co.Company
      ,co.Address1
      ,co.Address2
      ,co.City
      ,co.StateID
      ,co.Zip
      ,co.CountryID
      ,co.Phone1
      ,co.Phone2
      ,co.Fax
      ,co.UpdateUser
      ,co.UpdateTimestamp
      ,co.HorseNotes
      ,co.FirstName

	  --,cl.
  FROM [dbo].[user_Contact] AS co
  INNER JOIN user_Client AS cl ON cl.ContactID = co.ContactID
    
  where co.FirstName = 'First Name'