#define charge_item

player_reference = argument[0];
item = argument[1];

if(item.durability > 0)
{
    if(item.charge_capable == true)
    {
        if(global.stamina > (item.charge_cost / 60))
        {
            item.charge += (item.charge_rate / 60); // divide by 60 to convert from seconds to steps
            global.stamina -= (item.charge_cost / 60) // convert per seconds to per steps
            switch(item.item_name)
            {
                case("Machine Gun"):
                    //item.charge += (item.charge_rate / 60);
                    if(item.charge > item.charge_limit)
                    {
                        activate_machine_gun(player_reference, item);
                        item.charge = 0;
                        item.durability -= item.durability_lost_rate;
                        if(item.durability < 0)
                        {
                            item.durability = 0;
                        }
                    }
                    break;
                    
                /*case("Speed Boots"):
                    //item.charge += (item.charge_rate / 60);
                    player_reference.speed = item.charge;
                    if(item.charge > item.charge_limit)
                    {
                        player_reference.speed = item.charge;
                        item.durability -= item.durability_lost_rate;
                        if(item.durability < 0)
                        {
                            item.durability = 0;
                        }
                    }
                    break;*/
            
                default:
                    //item.charge += (item.charge_rate / 60); // divide by 60 to convert from seconds to steps
                    if(item.charge > item.charge_limit)
                    {
                        item.charge = item.charge_limit;
                        effect_create_above(ef_spark, player_reference.x, player_reference.y, 0, c_yellow);
                        
                    }
                    if(item.charge < 1)
                    {
                        audio_play_sound(charge1,4,false);
                    }
                    show_debug_message(item.item_name + " charge: " + string(item.charge));
                    break;
            } //end switch
        } //end stamina check
        else
        {
            release_charge_item(self, item);
            show_debug_message("Not enough stamina to keep charging item.");
        }// end lack of stamina release
    }
    else
    {
        show_debug_message("Cannot use charge on " + item.name);
    }
}
else
{
    show_debug_message(string(item.item_name) + " is out of durability.");
    audio_play_sound(hit_stone, 10, false);
}


#define release_charge_item

player_reference = argument[0];
item = argument[1];

switch(item.item_name)
{
    case("Crossbow"):
        if(item.charge > 2.5) // arbitrary value before arrow can fire
        {
            charged_arrow = activate_crossbow(player_reference, item);
            charged_arrow.type = "knockback";
            charged_arrow.projectile_power = ((item.charge / item.charge_limit) * 100) + global.pwr;
            //charged_arrow.damage *= charged_arrow.projectile_power + global.pwr;
            charged_arrow.speed /= (item.charge / item.charge_limit) * 4; // Arbitrary speed decrease by 2
            charged_arrow.image_xscale *= (item.charge / item.charge_limit) * 2.0; // Arbitrary size increase by 2
            charged_arrow.image_yscale *= (item.charge / item.charge_limit) * 2.0; // Arbitrary size increase by 2
        }
        audio_stop_sound(charge1); 
        item.charge = 0;
        break;    
    
    case("Temp_Multi_Shot"):
        item.charge = 0;
        break;
        
    default:
        item.charge = 0;
        break;
}