
if(index!="")
{switch(index)
	{
	case 0:
		sprite_index=spr_knive;
		if(place_meeting(x,y,obj_char))
		{
			// obj_char.i
			instance_destroy(self);
		}	
		break;
	default:
		break;
	}
	
}