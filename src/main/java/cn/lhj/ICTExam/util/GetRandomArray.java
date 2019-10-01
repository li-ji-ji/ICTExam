package cn.lhj.ICTExam.util;

import java.util.HashSet;
import java.util.Random;

public class GetRandomArray {

	public int[] getArray(Integer count,Integer max)throws Exception{
		HashSet<Integer> numSet=new HashSet<Integer>();
		Random random=new Random();
		while(numSet.size()<count)
		{
			numSet.add(random.nextInt(max));
		}
		int[] array = numSet.stream().mapToInt(Number::intValue).toArray();
		return array;
	}
	
}
