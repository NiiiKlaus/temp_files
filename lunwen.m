% 冒泡排序
function y=bubblesort(nums);
	length=length(nums);
	for i = 1:r-1
		for j = i+1:r
	        if nums(i) > nums(j)
	            t = nums(j);
	            nums(j) = nums(i);
	            nums(i) = t;
	        end
	    end 
	end
	y=nums;
end

% 选择排序
function y=selectionsort(nums);
	nums_len = length(nums);

	for i = 1:1:(nums_len-1)
		for j = i:1:nums_len
			if (nums(i) > nums(j))
				[nums(i), nums(j)] = swap(nums(i), nums(j));
			end
		end
		disp([num2str(nums), '. Sort: x = ', num2str(x)]);
	end
	
	y = x;
end

% 两数交换
function [a, b] = swap(x, y)
	a = y;
	b = x;
end

	
