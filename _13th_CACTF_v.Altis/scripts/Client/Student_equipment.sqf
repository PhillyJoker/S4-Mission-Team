

if (isServer) then {
	_crate = _this select 0;
	 
	clearMagazineCargoGlobal _crate;  
	clearBackpackCargoGlobal _crate;
	clearWeaponCargoGlobal _crate;    
	clearItemCargoGlobal _crate;
	 
	_crate addItemCargoGlobal ["ACE_Vector",50];
	_crate addItemCargoGlobal ["ItemRadio",100];
	_crate addMagazineCargoGlobal["rhsusf_100Rnd_556x45_soft_pouch", 10];
	_crate addMagazineCargoGlobal["rhsusf_100Rnd_762x51", 10];
	_crate addMagazineCargoGlobal["rhsusf_100Rnd_762x51_m993", 10];

};
