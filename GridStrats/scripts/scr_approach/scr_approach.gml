function scr_approach(argument0, argument1, argument2) {
	//approach(variable, amount, limit);

	variable = argument0;
	amount = argument1;
	limit = argument2;

	if(variable + amount <= limit)
	{
		return amount;	
	}
	else
	{
		return  (limit - variable);	
	}


}
