/// scrRoundNearMultiple(Value, StepSize)
  // -- Rounds a value to the nearest multiple of a given step size

    return argument0 - (argument0 mod argument1) + ((argument0 mod argument1) < (argument1 / 2)) * argument1;
