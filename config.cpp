class CfgPatches {
	class AGM_Tagging {
		units[] = {};
		weapons[] = {"AGM_Spraypaint"};
		requiredVersion = 0.60;
		requiredAddons[] = {AGM_Core, AGM_Interaction};
		version = "0.95";
		versionStr = "0.95";
		versionAr[] = {0,95,0};
		author[] = {"BlueBär"};
		authorUrl = "https://github.com/BaerMitUmlaut";
	};
};

class CfgFunctions {
	class AGM_Tagging {
		class AGM_Tagging {
			file = "\AGM_Tagging\functions";
			class tagBuilding;
		};
	};
};

class CfgVehicles {
	class NonStrategic;
	class HouseBase: NonStrategic {
		class AGM_Actions {
			class AGM_Tagging {
				displayName = "$STR_AGM_Tagging_TagBuilding";
				condition = "'AGM_Spraypaint' in itemsWithMagazines _player";
				statement = "[_target, _player] call AGM_Tagging_fnc_tagBuilding";
				showDisabled = 0;
				priority = -2;
				icon = "AGM_Tagging\UI\icon.paa";
				hotkey = "T";
				enableInside = 0;
			};
		};
	};

	class Box_NATO_Support_F;
	class AGM_Box_Misc: Box_NATO_Support_F {
		class TransportItems {
			class _xx_AGM_Spraypaint {
				weapon = "AGM_Spraypaint";
				count = 10;
			};
		};
	};
};

class CfgWeapons {
	class AGM_ItemCore;
	class InventoryItem_Base_F;
	class AGM_Spraypaint: AGM_ItemCore {
		displayName = "$STR_AGM_Tagging_Spraypaint";
		descriptionShort = "$STR_AGM_Tagging_SpraypaintDescription";
		picture = "\AGM_Tagging\UI\agm_spraypaintcan.paa";
		scope = 2;
		class ItemInfo: InventoryItem_Base_F {
			mass = 10;
		};
	};
};