if (!alive remoteBuilder) then {
    player setPosASL ((getPosASL cop_blue) vectorAdd [(random 8) - 4, (random 8) - 4, 0.1]);
} else {
    hint "COP Red October is NOT built yet. Check your map.";
};
