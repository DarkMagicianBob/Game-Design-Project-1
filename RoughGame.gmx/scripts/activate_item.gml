//General activation of item outside of specific item function

player_reference = argument[0];
item = argument[1];

if(item.durability > 0)
{
    if(global.stamina > item.stamina_cost)
    {
        item.durability -= item.durability_lost_rate;
        global.stamina -= item.stamina_cost;
        if(item.durability < 0){
            item.durability = 0;
        }
        
        switch(item.item_name)
        {
            case("Crossbow"):
                activate_crossbow(player_reference, item);
                break;
            case("Temp_Multi_Shot"):
                activate_multi_shot(player_reference, item);
                break;
            case ("Machine Gun"):
                activate_machine_gun(player_reference, item);
                break;
            case ("Speed Boots"):
                activate_boots(player_reference, item);
                break;
        }
    }
    else
    {
        show_debug_message("Need more stamina to use item.");
    }
}
else
{
    show_debug_message(string(item.item_name) + " is out of durability.");
    audio_play_sound(hit_stone, 10, false);
}


