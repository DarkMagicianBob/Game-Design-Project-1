menu = argument0;
pos = argument1;
if(string_count("Purchase Resurrection Potion", menu[pos]) == 1) {
    score -= global.lives_cost;
    global.lives_cost *= 2;
    lives += 1;
} else if(string_count("Purchase Arrow Upgrade", menu[pos]) == 1) {
    score -= global.upgrade_cost;
    global.upgrade_cost *= 2;
    global.pwr += 1;
} else if(string_count("Purchase Stamina Upgrade", menu[pos]) == 1) {
    score -= global.stam_cost;
    global.stam_cost *= 2;
    global.stam_limit += 50;
    global.stam_incr += .25;
} else if(string_count("Purchase Agility Upgrade", menu[pos]) == 1) {
    score -= global.agil_cost;
    global.agil_cost *= 2;
    global.spd += .5;
    global.turn_speed += .5;
}
