/*
 * Add the following to the INIT box of ALL curator modules:
 *
 * [this] call MEU_fnc_addZeusEH;
 */

params ["_curator"];

// Curator Event Handler to add FRIES to Zeus placed Helicopters

_curator addEventHandler ["CuratorObjectPlaced", {
    [_this select 1] call ace_fastroping_fnc_equipFRIES;
}];
