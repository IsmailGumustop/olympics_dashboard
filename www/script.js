varAthletics = 1;
varSwimming = 0;
varFencing = 0;

const summerSportsIcons = setInterval(function () {
    if (varAthletics == 1) {
        document.getElementById("athletics").style.fill = "currentColor";
        document.getElementById("swimming").style.fill = "none";
        document.getElementById("fencing").style.fill = "none";
        varAthletics = 0;
        varSwimming = 1;
        varFencing = 0;
    } else if (varSwimming == 1) {
        document.getElementById("athletics").style.fill = "none";
        document.getElementById("swimming").style.fill = "currentColor";
        document.getElementById("fencing").style.fill = "none";
        varAthletics = 0;
        varSwimming = 0;
        varFencing = 1;
    } else {
        document.getElementById("athletics").style.fill = "none";
        document.getElementById("swimming").style.fill = "none";
        document.getElementById("fencing").style.fill = "currentColor";
        varAthletics = 1;
        varSwimming = 0;
        varFencing = 0;
    }
}, 1000);


varSkiJump = 1;
varBobsleigh = 0;
varCurling = 0;

const wintererSportsIcons  = setInterval(function () {
    if (varSkiJump == 1) {
        document.getElementById("skijump").style.fill = "currentColor";
        document.getElementById("bobsleigh").style.fill = "none";
        document.getElementById("curling").style.fill = "none";
        varSkiJump = 0;
        varBobsleigh = 1;
        varCurling = 0;
    } else if (varBobsleigh == 1) {
        document.getElementById("skijump").style.fill = "none";
        document.getElementById("bobsleigh").style.fill = "currentColor";
        document.getElementById("curling").style.fill = "none";
        varSkiJump = 0;
        varBobsleigh = 0;
        varCurling = 1;
    } else {
        document.getElementById("skijump").style.fill = "none";
        document.getElementById("bobsleigh").style.fill = "none";
        document.getElementById("curling").style.fill = "currentColor";
        varSkiJump = 1;
        varBobsleigh = 0;
        varCurling = 0;
    }
}, 1000);