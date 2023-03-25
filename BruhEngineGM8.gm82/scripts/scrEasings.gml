/// scrEasings(time, start, change, duration, ease)
 // -- Easings


    switch (argument4)
    {
        // -- Ease in back
        case "easeInBack":
            var factorValue;
            factorValue = 1.70158;

            argument0 /= argument3;
            return argument2 * (argument0) * argument0 * ((factorValue + 1) * argument0 - factorValue) + argument1;
        break;


        // -- Ease out back
        case "easeOutBack":
            var factorValue;
            factorValue = 1.70158;

            argument0 = (argument0/argument3) - 1;
            return argument2 * ((argument0) * argument0 * ((factorValue + 1) * argument0 + factorValue) + 1) + argument1;
        break;


        // -- Ease inout back
        case "easeInOutBack":
            var factorValue;
            factorValue = 1.70158;
            argument0 /= argument3;
            argument0 *= 2;

            if ((argument0) < 1)
            {
                factorValue *= (1.525);
                return argument2 * 0.5 * (argument0 * argument0 * ((factorValue + 1) * argument0 - factorValue)) + argument1;
            }

            argument0 -= 2;
            factorValue *= 1.525
            return argument2 * 0.5 * ((argument0) * argument0 * ((factorValue + 1) * argument0 + factorValue) + 2) + argument1;
        break;


        // -- Ease in cubic
        case "easeInCubic":
            return argument2 * power(argument0 / argument3, 3) + argument1;
        break;


        // -- Ease out cubic
        case "easeOutCubic":
            return argument2 * (power(argument0 / argument3 - 1, 3) + 1) + argument1;
        break;


        // -- Ease inout
        case "easeInOutCubic":
            argument0 /= argument3 * 0.5;

            if (argument0 < 1)
            {
               return (argument2 * 0.5) * power(argument0, 3) + argument1;
            }

            return (argument2 * 0.5) * (power(argument0 - 2, 3) + 2) + argument1;
        break;


        // -- Ease in bounce
        case "easeInBounce":
            return argument2 - scrEasings(argument3 - argument0, 0, argument2, argument3, "easeOutBounce") + argument1;
        break;


        // -- Ease out bounce
        case "easeOutBounce":
            argument0 /= argument3;

            if (argument0 < (1 / 2.75))
            {
                return argument2 * (7.5625 * argument0 * argument0) + argument1;
            }
            else
            if (argument0 < (2 / 2.75))
            {
                argument0 -= (1.5 / 2.75);
                return argument2 * (7.5625 * argument0 * argument0 + 0.75) + argument1;
            }
            else
            if (argument0 < (2.5 / 2.75))
            {
                argument0 -= (2.25 / 2.75);
                return argument2 * (7.5625 * argument0 * argument0 + 0.9375) + argument1;
            }
            else
            {
                argument0 -= ( 2.625 / 2.75 );
                return argument2 * (7.5625 * argument0 * argument0 + 0.984375) + argument1;
            }
        break;


        // -- Ease inout bounce
        case "easeInOutBounce":
            if (argument0 < argument3 * 0.5)
            {
                return (scrEasings(argument0 * 2, 0, argument2, argument3, "easeInBounce") * 0.5 + argument1);
            }

            return (scrEasings(argument0 * 2 - argument3, 0, argument2, argument3, "easeOutBounce") * 0.5 + argument2 * 0.5 + argument1);
        break;


        // -- Ease in elastic
        case "easeInElastic":
            var factorValue, multiValue, changeValue;
            factorValue = 1.70158;
            multiValue = 0;
            changeValue = argument2;

            if (argument0 == 0 || changeValue == 0)
            {
                return argument1;
            }

            argument0 /= argument3;

            if (argument0 == 1)
            {
                return argument1 + argument2;
            }

            if (multiValue == 0)
            {
                multiValue = argument3 * 0.3;
            }

            if (changeValue < abs(argument2))
            {
                changeValue = argument2;
                factorValue = multiValue * 0.25;
            }
            else
            {
                factorValue = multiValue / (2 * pi) * arcsin (argument2 / changeValue);
            }

            return -(changeValue * power(2,10 * (--argument0)) * sin((argument0 * argument3 - factorValue) * (2 * pi) / multiValue)) + argument1;
        break;


        // -- Ease out elastic
        case "easeOutElastic":
            var factorValue, multiValue, changeValue;
            factorValue = 1.70158;
            multiValue = 0;
            changeValue = argument2;


            if (argument0 == 0 || changeValue == 0)
            {
                return argument1;
            }

            argument0 /= argument3;

            if (argument0 == 1)
            {
                return argument1 + argument2;
            }

            if (!multiValue)
            {
                multiValue = argument3 * 0.3;
            }

            if (changeValue < abs(argument2))
            {
                changeValue = argument2;
                factorValue = multiValue * 0.25;
            }
            else
            {
                factorValue = multiValue / (2 * pi) * arcsin (argument2 / changeValue);
            }

            return changeValue * power(2, -10 * argument0) * sin((argument0 * argument3 - factorValue) * (2 * pi) / multiValue ) + argument2 + argument1;
        break;


        // -- Ease inout elastic
        case "easeInOutElastic":
            var factorValue, multiValue, changeValue;
            factorValue = 1.70158;
            multiValue = 0;
            changeValue = argument2;

            if (argument0 == 0 || changeValue == 0)
            {
                return argument1;
            }

            argument0 /= (argument3 * 0.5);

            if (argument0 == 2)
            {
                return argument1 + argument2;
            }

            if (!multiValue)
            {
                multiValue = argument3 * (0.3 * 1.5);
            }

            if (changeValue < abs(argument2))
            {
                changeValue = argument2;
                factorValue = multiValue * 0.25;
            }
            else
            {
                factorValue = multiValue / (2 * pi) * arcsin (argument2 / changeValue);
            }

            if (argument0 < 1)
            {
                return -0.5 * (changeValue * power(2, 10 * (--argument0)) * sin((argument0 * argument3 - factorValue) * (2 * pi) / multiValue)) + argument1;
            }

            return changeValue * power(2, -10 * (--argument0)) * sin((argument0 * argument3 - factorValue) * (2 * pi) / multiValue) * 0.5 + argument2 + argument1;
        break;


        // -- Ease in expo
        case "easeInExpo":
            return argument2 * power(2, 10 * (argument0 / argument3 - 1)) + argument1;
        break;


        // -- Ease out expo
        case "easeOutExpo":
            return argument2 * (-power(2, -10 * argument0 / argument3) + 1) + argument1;
        break;


        // -- Ease in out expo
        case "easeInOutExpo":
            argument0 /= argument3 * 0.5;

            if (argument0 < 1)
            {
                return argument2 * 0.5 * power(2, 10 * (argument0 - 1)) + argument1;
            }

            argument0 -= 1;
            return argument2 * 0.5 * (-power(2, -10 * argument0) + 2) + argument1;
        break;


        // -- Ease in quad
        case "easeInQuad":
            argument0 /= argument3;
            return argument2 * argument0 * argument0 + argument1;
        break;


        // -- Ease out quad
        case "easeOutQuad":
            argument0 /= argument3;
            return -argument2 * argument0 * (argument0 - 2) + argument1;
        break;


        // -- Ease in out quad
        case "easeInOutQuad":
            argument0 /= (argument3 * 0.5);

            if (argument0 < 1)
            {
                return (argument2 * 0.5) * (argument0 * argument0) + argument1;
            }

            return (-argument2 * 0.5) * (--argument0 * (argument0 - 2) - 1) + argument1;
        break;


        // -- Ease in quart
        case "easeInQuart":
            return argument2 * power(argument0 / argument3, 4) + argument1;
        break;


        // -- Ease out quart
        case "easeOutQuart":
            return -argument2 * (power(argument0 / argument3 - 1, 4) - 1) + argument1;
        break;


        // -- Ease in out quart
        case "easeInOutQuart":
            argument0 /= argument3 * 0.5;

            if (argument0 < 1)
            {
                return argument2 * 0.5 * power(argument0, 4) + argument1;
            }

            return -argument2 * 0.5 * (power(argument0 - 2, 4) - 2) + argument1;
        break;


        // -- Ease in quint
        case "easeInQuint":
            return argument2 * power(argument0 / argument3, 5) + argument1;
        break;


        // -- Ease out quint
        case "easeOutQuint":
            return argument2 * (power(argument0 / argument3 - 1, 5) + 1) + argument1;
        break;


        // -- Ease in out quint
        case "easeInOutQuint":
            argument0 /= argument3 * 0.5;

            if (argument0 < 1)
            {
                return argument2 * 0.5 * power(argument0, 5) + argument1;
            }

            return argument2 * 0.5 * (power(argument0 - 2, 5) + 2) + argument1;
        break;


        // -- Ease in circ
        case "easeInCirc":
            argument0 /= argument3;
            return argument2 * (1 - sqrt(1 - argument0 * argument0)) + argument1;
        break;


        // -- Ease out circ
        case "easeOutCirc":
            argument0 = argument0 / argument3 - 1;
            return argument2 * sqrt(1 - argument0 * argument0) + argument1;
        break;


        // -- Ease in out circ
        case "easeInOutCirc":
            argument0 /= argument3 * 0.5;

            if (argument0 < 1)
            {
                return argument2 * 0.5 * (1 - sqrt(1 - argument0 * argument0)) + argument1;
            }

            argument0 -= 2;
            return argument2 * 0.5 * (sqrt(1 - argument0 * argument0) + 1) + argument1;
        break;


        // -- Ease in sine
        case "easeInSine":
            return argument2 * (1 - cos(argument0 / argument3 * (pi / 2))) + argument1;
        break;


        // -- Ease out sine
        case "easeOutSine":
            return argument2 * sin(argument0 / argument3 * (pi / 2)) + argument1;
        break;


        // -- Ease in out sine
        case "easeInOutSine":
            return argument2 * 0.5 * (1 - cos(pi * argument0 / argument3)) + argument1;
        break;
    }
