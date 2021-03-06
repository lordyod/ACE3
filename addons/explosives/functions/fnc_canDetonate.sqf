/*
 * Author: Garth 'L-H' de Wet
 * Whether the unit is able to detonate explosives
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Able to detonate <BOOL>
 *
 * Example:
 * if ([player] call ACE_Explosives_fnc_canDetonate) then { hint "Can Detonate"; };
 *
 * Public: Yes
 */
#include "script_component.hpp"
private "_unit";
_unit = _this select 0;

[_unit] call FUNC(hasPlacedExplosives) and {count ([_unit] call FUNC(getDetonators)) > 0}
