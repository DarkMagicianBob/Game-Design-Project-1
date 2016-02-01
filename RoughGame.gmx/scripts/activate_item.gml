//General activation of item outside of specific item function

player_reference = argument[0];
item = argument[1];

item.durability -= item.durability_lost_rate;
if(item.durability < 0){
    item.durability = 0;
}

switch(item.item_name)
{
    case("Crossbow"):
        activate_crossbow(player_reference, item);
        break;
    case ("Machine Gun"):
        activate_machine_gun(player_reference, item);
        break;
}




