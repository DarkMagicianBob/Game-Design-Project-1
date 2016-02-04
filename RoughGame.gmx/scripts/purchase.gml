menu = argument0;
pos = argument1;
if(string_count("Purchase Resurrection Potion", menu[pos]) == 1) {
    show_debug_message("purchasing life");
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
    global.spd += .25;
    global.turn_speed += .5;
} /*else if(string_count("Purchase Multi-Shot", menu[pos]) == 1) {
    score -= 1000;
    global.multi_shot_enabled = true;
    
} else if(string_count("Purchase Machine-Bow", menu[pos]) == 1) {
    score -= 1000;
    global.machine_bow_enabled = true;
} */
