BEGIN	{
		n=0;
		time=0.0;
		bytes=0.0;
		count = 0;
	}
	{
		if ($2 != time) {
			printf ("%5.3f\t%5.3f\t%d\n", time, bytes, count);
			time = $2;
			bytes = $3;
			count = 2;
			n++;
		} else {
			time = $2;
			bytes += $3;
			++count;
			n++;
		}
	}
END	{
	
	}

