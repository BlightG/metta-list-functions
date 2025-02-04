; Family 1
(Chandler male)
(Monica female)

(Jhon male)
(Pam female)
(Adam male)
(Jane female)

(Bob male)
(Tim male)
(Kim female)
(Eve female)
(Joey male)

(Jhon parent Bob)
(Pam parent Tim)
(Pam parent Kim)
(Adam parent Eve)
(Jane parent Joey)

(Chandler parent Jhon)
(Chandler parent Pam)
(Chandler parent Adam)
(Chandler parent Jane)

(Monica parent Jhon)
(Monica parent Pam)
(Monica parent Adam)
(Monica parent Jane)

; Family 2
(Charles male)
(Emma female)
(Rachel female)

(Joseph male)
(Evelyn female)
(Mia female)
(Amelia female)

(Isabella female)
(Oliver male)
(George male)
(Daniel male)
(Luna female)

(Charles parent Joseph)
(Charles parent Evelyn)
(Charles parent Mia)
(Charles parent Amelia)

(Emma parent Jospeh)
(Emma parent Evelyn)
(Rachel parent Mia)
(Rachel parent Amelia)

(Joseph parent Isabella)
(Evelyn parent Oliver)
(Mia parent George)
(Amelia parent Daniel)
(Amelia parent Luna)

(= (add-mother) 
	(match &self (, ($mother parent $child) ($mother female)) (add-atom &self ($mother mother $child)))
)

(= (add-father) 
	(match &self (, ($father parent $child) ($father male)) (add-atom &self ($father father $child)))
)

(= (add-grandmother)
	(match &self (, ($parent parent $child) ($grandmother mother $parent)) (add-atom &self ($grandmother grandmother $child)))
)

(= (add-grandfather)
	(match &self (, ($parent parent $child) ($grandfather father $parent)) (add-atom &self ($grandfather grandfather $child)))
)

(= (marriage $husband $wife)
	(add-atom &self ($husband married_to $wife))
)

(= (add-husband-family) 	
	(let ($husband $wife) 
		 (match &self ($husband married_to $wife) ($husband $wife))
		 (
			(match &self ($husband parent $child) (add-atom &self ($wife parent $child)))
			(match &self ($wife parent $child) (,
				(remove-atom &self ($husband parent $child))
				(add-atom &self ($husband parent $child)))
			)
		 )
	)
)

!(marriage Jhon Mia)
!(add-husband-family)
!(add-mother)
!(add-father)
!(add-grandmother)
!(add-grandfather)

(match &self ($mother mother $child) ($mother mother $child))
(match &self ($father father $child) ($father father $child))
(match &self ($grandmother grandmother $child) ($grandmother grandmother $child))
(match &self ($grandmother grandfather $child) ($grandmother grandfather $child))
!(match &self ($husband married_to $wife) ($husband married_to $wife))
!(match &self (Mia parent $child) (Mia parent $child))
!(match &self (Jhon parent $child) (Jhon parent $child))
!(match &self (Chandler grandfather $child) (Chandler grandfather $child))
