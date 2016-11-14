/*
params ["_object", "_caller", "_id", "_args"];
cop_blue_tp = _id;
*/
if (!alive remoteBuilder) then {
    player setPosASL ((getPosASL cop_blue) vectorAdd [(random 8) - 4, (random 8) - 4, 0.1]);
} else {
    hint "COP Red October is NOT built yet. Check your map.";
};
